% system M/M/1/3

clc;
clear all;
close all;

pkg load queueing;

lambda = 5;
mu = 20;
states = [0, 1, 2, 3]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu];

% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
% get the ergodic probabilities of the system
P = ctmc(transition_matrix);

mean_clients = 0;
for i=1:4
	mean_clients = mean_clients + P(i)*(i-1);
endfor

% transient probability until convergence. Convergence takes place when the probabilities differ by 0.01
for j=1:4
	index = 0;
	for T = 0 : 0.01 : 50
	  index = index + 1;
	  P0 = ctmc(transition_matrix, T, initial_state);
	  Prob0(index) = P0(j);
	  if P0 - P < 0.01
	    break;
	  endif
	endfor

	T = 0 : 0.01 : T;
	figure(j+1);
	plot(T, Prob0, "r", "linewidth", 1.3);
	plotname = sprintf('probability %d',j-1);
	title(plotname);
	xlabel('time');
	ylabel('probability');
	filename = sprintf('probability_%d_%d_%d.jpg',j-1, lambda, mu);
	print('-djpg', filename);
endfor

result = mean_clients * mu * 60;
text = sprintf('mean_clients(%d): %d', mu, result);
display(text);




