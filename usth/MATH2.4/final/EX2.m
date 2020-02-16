disp ("Question 2:");
disp ("(a)");
pkg load symbolic;
syms x real;
solve (sqrt (x) - x + 1 == 0)
% ans = (sym)
%   √5   3
%   ── + ─
%   2    2
pkg unload symbolic;
disp ("To get numerical solutions we can use fzero");
disp ("With the initial guess of 0, fzero (@(x) sqrt (x) - x + 1, 0) returns");
fzero (@(x) sqrt (x) - x + 1, 0)

disp ("(b)");
hold on;
ezplot (@(x) exp (-x));
ezplot (@(x) sin (x));
hold off;
disp ("Press any key to continue...");
kbhit;

disp ("(c)");
s = 0;
for k = 1 : 1000
  s += k^3;
endfor
printf ("The cubic sum of integers from 1 to 1000 is %d\n", s);

disp ("(d)");
A = [2 1 4
     1 2 -5
     3 -2 4];
b = [10 1 8]';
disp ("Using mldivide, [x y z] = ");
disp (mldivide (A, b)');
disp ("Using inv, [x y z] = ");
disp ((inv (A) * b)');
