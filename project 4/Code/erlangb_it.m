function p = erlangb_iterative (r,c)
    p = 1;
    for k = 0:1:c
        p = (r*p)/(k+r*p);
    endfor
endfunction
