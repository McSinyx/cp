disp ("Question 3:");
disp ("(a)");
function y = f (x)
  y = 2 + x.^2 + exp(x.*2 + 1);
endfunction
h = 0.005;
printf ("By forward difference with h = 0.05, f'(1.35) = %g\n",
        (f (1.35 + h) - f (1.35)) / h);

disp ("(b)");
disp ("I am unsure if diff is different on Matlab, but on octave,");
disp ("it's simply taking differences between consecutive elements.");
x = [1.35, 1.35+h];
printf ("Using diff with h = 0.05, we get same result, f'(1.35) = %g\n",
        (diff (f (x)) / h));
disp ("Using symbolical methods, f'(1.35) = 83.5946 which is quite close.");
