function [L U] = LU (A)
  [n n1] = size (A);
  [L U] = deal (eye (n), A);
  for k = 1:n
    for i = k + 1 : n
      L(i, k) = U(i, k) / U(k, k);
      U(i, :) = U(i, :) - L(i, k)*U(k, :);
    end
  end
end
