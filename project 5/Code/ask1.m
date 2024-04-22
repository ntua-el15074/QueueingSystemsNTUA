pkg load queueing;

a = 0.001:0.001:0.999;
lambda = 10000;
lambda_1 = a*lambda;
lambda_2 = (1-a)*lambda;
mu_1 = 29296;
mu_2 = 23437;

[_,_,Q1,_,_] = qsmm1(lambda_1,mu_1);
[_,_,Q2,_,_] = qsmm1(lambda_2,mu_2);

clients = Q1 + Q2;
time = clients/lambda;

figure(1);
plot(a,time,"r","linewidth",1.2);
xlabel("a parameter");
ylabel("Delay");

filename = "../images/delay_to_a.png";
print("-dpng", filename);

[minimum, minimum_a] = min(min(time,[],1));
fd = fopen("ask1.txt", "w");
min_a = 0.001*minimum_a
text = sprintf("Minimum Delay=%d for a=%.3f", minimum, min_a);
fprintf(fd,text);
fclose(fd);
