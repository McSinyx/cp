function T = heatrans (cp, lambda, rho, Tg, Td, T0, L, dx, dt, N)
  alpha = lambda / rho / cp;
  beta = alpha * dt / dx^2;
  M = round (L / dx);
  side = repelem (beta, M);
  A = diag (side, -1) + diag (repelem (1 - 2*beta, M + 1)) + diag (side, 1);
  A(1, :) = A(end, :) = 0;
  A(1, 1) = A(end, end) = 1;

  T = repelem (T0, M + 1);
  [T(1) T(end)] = deal (Tg, Td);
  for k = 2 : N
    T(:, k) = A * T(:, k - 1);
  end
end
