disp ("Question 1:");
disp ("(a)");
printf ("11^3 + 12^3 - 7^3 = %d\n", 11^3 + 12^3 - 7^3);
printf ("15! = %d\n", factorial (15));

disp ("(b)");
A = [1 2 3
     4 5 6
     7 8 9];
B = eye (3);

disp ("(b.i)");
disp ("A + B = ");
disp (A + B);

disp ("(b.ii)");
disp ("A' = ");
disp (A');

disp ("(b.iii)");
disp ("A^-1 = ");
disp (inv (A));

disp ("(c.i)");
printf ("x^2 = 19  ->  x = %g\n", sqrt (19));
disp ("(c.ii)");
printf ("x^4 = 55  ->  x = %g\n", sqrt (sqrt (19)));

disp ("(d)");
X = 0 : 30;
Y = X * 2 + 3;
plot (X, Y);
xlabel ("x");
ylabel ("y = 2x + 3");
disp ("Press any key to continue...");
kbhit;
