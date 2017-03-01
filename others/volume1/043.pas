uses math;

var
  n, i, m: uint64;

begin
  readln(n);
  n := n - 1;
  i := 0;
  while i < 18 do
    begin
      m := 9 * 10 ** i * (i + 1);
      if m < n then
        n := n - m
      else
        break;
      i := i + 1
    end;
  m := i - (n - 1) mod (i + 1);
  n := 10 ** i + (n + i) div (i + 1) - 1;
  writeln(n div 10 ** m mod 10)
end.
