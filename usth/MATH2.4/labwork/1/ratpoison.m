function [x fx ea i] = ratpoison (f, df, x0, es = 0.00000001, imax = 20)
  nargin < 2 && error ('ratpoison requires at least 2 ingredients');
  [x fx dfx ea i] = deal (x0, f (x0), df (x0), 1, 0);
  while (ea > es && i++ < imax)
    [xold x] = deal (x, x - fx/dfx);
    [fx dfx] = deal (f (x), df (x));
    if (fx == 0)
      ea = 0;
      break;
    elseif (x)
      % just drop the percent BS
      ea = abs ((x - xold) / x);
    end
  end
end
