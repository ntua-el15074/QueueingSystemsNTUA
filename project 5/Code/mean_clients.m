% addpath('./intensities.m');
function [Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda_1, lambda_2, mu_1, mu_2, mu_3, mu_4, mu_5)
    [r_1, r_2, r_3, r_4, r_5, e] = intensities(lambda_1, lambda_2, mu_1, mu_2, mu_3, mu_4, mu_5);
    Q1 = r_1/(1-r_1);
    Q2 = r_2/(1-r_2);
    Q3 = r_3/(1-r_3);
    Q4 = r_4/(1-r_4);
    Q5 = r_5/(1-r_5);
endfunction
