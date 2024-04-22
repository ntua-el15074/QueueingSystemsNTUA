lambda_1 = 10;
lambda_2 = 6;
mu_1 = 15;
mu_2 = 20;
mu_3 = 10;
mu_4 = 14;
mu_5 = 12;

[r_1, r_2, r_3, r_4, r_5, e] = intensities(lambda_1, lambda_2, mu_1, mu_2, mu_3, mu_4, mu_5);
if (e > 1) 
    disp("Unstable system");
    return;
endif

[Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda_1, lambda_2, mu_1, mu_2, mu_3, mu_4, mu_5);

E = Q1 + Q2 + Q3 + Q4 + Q5;
gamma = lambda_1 + lambda_2;
D = E/gamma;
text = sprintf("D = %f\n", D);

fd = fopen('output.txt', 'w');
fprintf(fd, "=====================\n");
fprintf(fd, "Intensities\n");
fprintf(fd, "---------------------\n");
fprintf(fd, "r_1 = %f\n", r_1);
fprintf(fd, "r_2 = %f\n", r_2);
fprintf(fd, "r_3 = %f\n", r_3);
fprintf(fd, "r_4 = %f\n", r_4);
fprintf(fd, "r_5 = %f\n", r_5);
fprintf(fd, "=====================\n");
fprintf(fd, "Mean Clients\n");
fprintf(fd, "---------------------\n");
fprintf(fd, "Q1 = %f\n", Q1);
fprintf(fd, "Q2 = %f\n", Q2);
fprintf(fd, "Q3 = %f\n", Q3);
fprintf(fd, "Q4 = %f\n", Q4);
fprintf(fd, "Q5 = %f\n", Q5);
fprintf(fd, "=====================\n");
fprintf(fd, "Mean Delay\n");
fprintf(fd, "---------------------\n");
fprintf(fd, "%s", text);
fprintf(fd, "=====================\n");

fclose(fd);

