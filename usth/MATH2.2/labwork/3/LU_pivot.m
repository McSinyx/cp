function [L U P] = LU_pivot (A)
  [n _] = size (A);
  [L P U] = deal (eye (n), eye (n), A);
  for k = 1:n
    [pivot m] = max (abs (U(k:n, k)));
    m = m + k - 1;
    if (m ~= k)
      U([m k], :) = U([k m], :);  % interchange rows m and k in U
      P([m k], :) = P([k m], :);  % interchange rows m and k in P
      if k >= 2;  % very important point
        % interchange rows m and k in columns 1:k-1 of L
        L([m k], 1:k-1) = L([k m], 1:k-1);
      end
    end
    for i = k + 1 : n
      L(i, k) = U(i, k) / U(k, k);
      U(i, :) -= L(i, k)*U(k, :);
    end
  end
end
