clc; 
clear all;
close all;

pkg load statistics;

# ----------------------------------------------------------
# -------------------------   2.1  -------------------------
# ----------------------------------------------------------
lambda = [0.5, 1.5, 4];

x = 0:0.001:8;

pdf(1,:) = exppdf(x,lambda(1));
pdf(2,:) = exppdf(x,lambda(2));
pdf(3,:) = exppdf(x,lambda(3));

figure(1);

hold on;

plot(x,pdf(1,:), 'r', 'LineWidth', 1.2);
plot(x,pdf(2,:), 'g', 'LineWidth', 1.2);
plot(x,pdf(3,:), 'b', 'LineWidth', 1.2);

hold off; 

xlabel('k values');
ylabel('Probability');
legend('lambda = 0.5', 'lambda = 1.5', 'lambda = 4');

# ----------------------------------------------------------
# -------------------------   2.2  -------------------------
# ----------------------------------------------------------

lambdas = [0.5, 1.5, 4];

min_lambda = 0.5 + 1.5 + 4;

x = 0:00001:8;

for i=1:columns(lambdas)
	cdf(i,:) = expcdf(x,lambdas(i));
endfor

cdf_min = expcdf(x, min_lambda);

colors = 'rgbm';

figure(1);

hold on;

for i=1:columns(lambdas)
	plot(x, cdf(i,:), colors(i), 'LineWidth', 1.2);
endfor

plot(x, cdf_min, colors(4), 'LineWidth', 1.2);

hold off;

xlabel('k values');
ylabel('Probability');
legend('lambda1', 'lambda2', 'lambda3', 'min lambda');

# ----------------------------------------------------------
# -------------------------   2.3  -------------------------
# ----------------------------------------------------------

x = 0:0.001:8;

exp = expcdf(x,2.5);

p_1 = 1 - exp(20000);
display(p_1);

p_2 = (1 - exp(45000))./(1 - exp(25000));
display(p_2);

# ----------------------------------------------------------
# -------------------------   3.1  -------------------------
# ----------------------------------------------------------

x = exprnd(0.1, 1,100);
y = ones(100,1);

 for i=1:99
  x(i+1) = x(i+1) + x(i);
  y(i+1) = y(i+1) + y(i);
endfor


figure(1); 

stairs(x, y, color='r');
xlabel('seconds');
ylabel('N(t)');
title('λ = 10');

# ----------------------------------------------------------
# -------------------------   3.2  -------------------------
# ----------------------------------------------------------

ev = [200, 400, 700, 1000, 5000, 50000, 100000];

for j=1:columns(ev)
	x = exprnd(0.1, 1,ev(j));
	y = ones(ev(j),1);
	k = ev(j) - 1;
	for i=1:k
		x(i+1) = x(i+1) + x(i);
		y(i+1) = y(i+1) + y(i);
	endfor


	figure(1); 

	titlename = sprintf('amount of events %d', ev(j));

	stairs(x, y, color='r');
	xlabel('seconds');
	ylabel('N(t)');
	title(titlename);

	filename = sprintf('../images/events_%d.jpg', ev(j));
	print('-djpg',filename);

	solution = ev(j) / x(ev(j)); 
	display(ev(j));
	display(solution);

	
endfor








