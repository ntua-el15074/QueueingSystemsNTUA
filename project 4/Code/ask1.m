% pkg load queueing
c = 9;
arg_list = argv();
minutes = str2num(arg_list{1});

function p = erlangb_factorial (r,c) 
    s = 0; 
    for k = 0:1:c
        s = s + (power(r,k)/factorial(k));
    endfor 
    p = (power(r,c)/factorial(c))/s;
endfunction

function p = erlangb_iterative (r,c)
    p = 1;
    for k = 0:1:c
        p = (r*p)/(k+r*p);
    endfor
endfunction

filename_text = sprintf("../erlangb-%d.txt", minutes);
fd = fopen(filename_text, "w");

text = sprintf("Minutes = %d\n", minutes);
fprintf(fd, text);

text = sprintf("erlangb_factorial(9,9) = %d\n", erlangb_factorial(9,9));
fprintf(fd, text);

text = sprintf("erlangb_iterative(9,9) = %d\n", erlangb_iterative(9,9));
fprintf(fd, text);

text = sprintf("erlangb_factorial(1024,1024) = %d\n", erlangb_factorial(1024,1024));
fprintf(fd, text);

text = sprintf("erlangb_iterative(1024,1024) = %d\n", erlangb_iterative(1024,1024));
fprintf(fd, text);


p = zeros(0,500);

flag = 0;

for i = 1:1:500
    p(i) = erlangb_iterative(i*(minutes/60),i);
    if (p(i) < 0.01 && flag == 0)
        flag = 1;
        text = sprintf("Blocking probability < 0.01 for %d servers\n", i);
        fprintf(fd, text);
    endif
endfor

fprintf(fd, "==========\n");

fclose(fd);

figure(1);
stem(p, "linewidth", 2);
titlename = sprintf("Blocking probability for %d minutes", minutes);
title(titlename);
axis([0 40 0 0.1]);
grid on;
xlabel("Servers");
ylabel("Blocking probability");

filename = sprintf("../images/erlangb-%d-zoom.png", minutes);
print("-dpng", filename);
