function fib = fibonacci (n)
  fib = 0 : n;
  for i = 2 : n
    fib(i + 1) = fib(i) + fib(i - 1);
  end
  fib = fib(2:end);
end
