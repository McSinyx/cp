function [x fx ea iter] = bisect (f, xl, xu, es = 0.0001, maxit = 50)
  % uses bisection method to find the root of f,
  % with xl and xu being lower and upper guesses,
  % es being desired relative error
  % and maxit being maximum allowable iterations
  % to return the real root x, fx = f(x),
  % approximate relative error ea (%)
  % and number of iterations iter
  nargin < 3 && error ('bisect requires at least 3 arguments');
  [fl fu iter] = deal (f (xl), f (xu), 0);
  if (fl == 0)
    [x fx ea] = deal (xl, 0, 0);
    return;
  elseif (fu == 0)
    [x fx ea] = deal (xu, 0, 0);
    return;
  end
  fl * fu < 0 || error ('no sign change');

  [x ea] = deal (xl, 100);
  while (ea > es && iter++ < maxit) % yes, I use Octave only
    [xold x] = deal (x, (xl + xu) / 2);
    fx = f (x);
    if (fx == 0)
      ea = 0;
      break;
    elseif (x)
      ea = abs ((x - xold) / x) * 100;
    end
    if (f (xl) * fx < 0)
      xu = x;
    else
      xl = x;
    end
  end
end
