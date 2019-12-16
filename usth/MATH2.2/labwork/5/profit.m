function z = profit (x, y)
  A = [7 11; 10 8];
  b = [77; 80];
  c = [150; 175];
  [m n] = size (x);
  z = -inf (m, n);
  for s = 1 : m
    for t = 1 : n
      r = [x(s, t); y(s, t)];
      if A * r <= b
        z(s, t) = dot (c, r);
      endif
    endfor
  endfor
endfunction
