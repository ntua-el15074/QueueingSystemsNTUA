clc;
clear all;
close all;

rand("seed",1);

P = [0,0,0,0,0,0,0,0,0,0,0];
arrivals = [0,0,0,0,0,0,0,0,0,0,0];
total_arrivals = 0; 
current_state = 0;  
previous_mean_clients = 0; 
counter = 0;
index = 0;

lambda = 5;

max_mu = 8;
min_mu = 3;
mu = max_mu;
threshold = lambda/(lambda + mu); 

transitions = 0; 

while transitions >= 0
  transitions = transitions + 1; 
  
  if mod(transitions,1000) == 0 
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; 
    endfor
    
    mean_clients = 0; 
    for i=1:1:length(arrivals)
       mean_clients = mean_clients + (i-1).*P(i);
    endfor
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 10000000 
      break;
    endif
    
    previous_mean_clients = mean_clients;
    
  endif
  
  random_number = rand(1); 
  if current_state == 0 || random_number < threshold 
    if current_state < 11
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1; 
      if current_state < 10
        current_state = current_state + 1;
      endif    
    endif   
  else 
    if (mu == min_mu)
      counter = counter + 1;
    else
        mu = 0.98 * mu;
    endif

    threshold = lambda/(lambda + mu);

    if counter == 10
        mu = max_mu;
    endif 

    if (mu < min_mu)
      mu = min_mu;
      counter = 0;
    endif 

    if current_state != 0 
      current_state = current_state - 1;
    endif
  endif
endwhile


fidfilename = sprintf("../results/results2_%d.txt", lambda);

fid = fopen(fidfilename, "w");
tid = fopen("../results/transitions2.txt", "a");


fprintf(fid, "State propabilities:\n");
for i=1:1:length(arrivals)
    fprintf(fid, "P(%d) = %f\n", i-1, P(i));
endfor

g = lambda*(1-P(11));
average_delay_time = mean_clients / g;
fprintf(fid, "Average delay time = %f\n", average_delay_time);
fprintf(fid, "Blocking propability = %f\n", P(11));
fprintf(tid, "Transitions = %d\n", transitions);

figure(1);
plot(to_plot,"r","linewidth",1.2);
titlename = sprintf("Average number of clients in the M/M/1 queue: Convergence, λ=%d", lambda);
title(titlename);
xlabel("transitions in thousands");
ylabel("Average number of clients");
filename = sprintf("../images/task1ask2_convergence_%d.png", lambda);
print("-dpng", filename);

x=[0,1,2,3,4,5,6,7,8,9,10];
figure(2);
bar(x,P,0.4);
titlename = sprintf("Probabilities, λ=%d", lambda);
title(titlename);
filename = sprintf("../images/task1ask2_probabilities_%d.png", lambda);
print("-dpng", filename);
