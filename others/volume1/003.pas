var
  n: int64;
  l, s: byte;

begin
  readln(n);
  l := 0;
  s := 0;
  repeat
    inc(l);
    s := s + n mod 10;
    n := n div 10
  until n = 0;
  writeln(l, ' ', s)
end.
