function x = subst (aug)
  [m n] = size (aug);
  x = zeros (m, 1);
  if (istril (aug))
    x(m) = aug(1, n) / aug(1, m);
    for k = 2 : m
      x(k) = (aug(k, n) - aug(k, k+1:m)*x(1:k-1)) / aug(k, k);
    end
  elseif (istriu (aug))
    x(m) = aug(m, n) / aug(m, m);
    for k = m - 1 : -1 : 1
      x(k) = (aug(k, n) - aug(k, k+1:m)*x(k+1:m)) / aug(k, k);
    end
  else
    error ('aug must be a triangular matrix');
  end
end
