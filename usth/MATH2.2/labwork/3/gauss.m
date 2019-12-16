function x = gauss (A, b)
  issquare (A) || error ('Matrix A must be square');
  Aug = [A b];
  [m n] = size (Aug);
  % forward elimination
  for k = 1 : m - 1
    for l = k + 1 : m
      Aug(l, k:n) = Aug(l, k:n) - Aug(k, k:n)*Aug(l, k)/Aug(k, k);
    end
  end
  x = ubst (Aug);
end
