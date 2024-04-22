lambda_1 = 10;
lambda_2 = 6;
mu_1 = 15;
mu_2 = 20;
mu_3 = 10;
mu_4 = 14;
mu_5 = 12;

max_lambda = 15;
lambda = (0.1*max_lambda):(0.01*max_lambda):(0.99*max_lambda);

for i = 1:1:90
    percentage = i/100;
    lambda_1 = percentage*max_lambda;
    [Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda_1, lambda_2, mu_1, mu_2, mu_3, mu_4, mu_5);
    E(i)= (Q1+Q2+Q3+Q4+Q5)/(lambda_1+lambda_2);
endfor

figure(1);
plot(lambda, E, "r", "linewidth", 1.2);
xlabel("maximum lambda");
ylabel("Delay");
filename = "../images/delay_to_lambda.png";
print("-dpng", filename);
