pkg load queueing;

lambda = 10;

mu = 10.0001 : 0.0001 : 20;

[U, R, Q, X, p0] = qsmm1(lambda, mu);

colors = "rgbm";

figure(1); 
plot(mu,U,colors(1),'linewidth',1.2);
xlabel('Service Rate');
ylabel('Utilisation');
title('Utilisation');

print('-djpg', 'utilisation.jpg');

figure(2);
plot(mu,R,colors(1),'linewidth',1.2);
ylim([0,100]);
xlabel('Service Rate');
ylabel('Response Time');
title('Response Time');

print('-djpg', 'responsetime.jpg');

figure(3); 
plot(mu,Q,colors(1),'linewidth',1.2);
ylim([0,100]);
xlabel('Service Rate');
ylabel('Average number of requests');

print('-djpg', 'average_n_requests.jpg');

figure(4);
plot(mu,X,colors(1), 'linewidth',1.2);
xlabel('Service Rate');
ylabel('Throughput');

print('-djpg', 'throughput.jpg');








