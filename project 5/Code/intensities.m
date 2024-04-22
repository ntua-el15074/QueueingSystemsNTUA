function [r_1, r_2, r_3, r_4, r_5, e] = intensities(lambda_1, lambda_2, mu_1, mu_2, mu_3, mu_4, mu_5)
  r_1 = (lambda_1/mu_1);
  r_2 = ((lambda_2+(1/2)*lambda_1)/mu_2);
  r_3 = ((2/3)*(1/2)*lambda_1 + (1/4)*lambda_1 + (1/3)*lambda_2)/mu_3;
  r_4 = ((2/3)*lambda_2/mu_4);
  r_5 = ((1/4)*lambda_1 + (2/3)*(3/5)*lambda_2)/mu_5;
  if((r_1 < 1) && (r_2 < 1) && (r_3 < 1) && (r_4 < 1) && (r_5 < 1))
    e = 1;
  else 
    e = 0;
  endif
endfunction
