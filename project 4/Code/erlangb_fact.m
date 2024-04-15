function p = erlangb_factorial (r,c) 
    s = 0; 
    for k = 0:1:c
        s = s + (power(r,k)/factorial(k));
    endfor 
    p = (power(r,c)/factorial(c))/s;
endfunction
