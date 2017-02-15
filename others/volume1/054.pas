uses clib;

var
  n, c: int16;
  a: int32;
  s: int64 = 0;

begin
  readln(n);
  c := 0;
  repeat
    read(a);
    if issquare(a) then
      begin
        inc(c);
        s := s + a
      end;
    dec(n)
  until n = 0;
  writeln(c, ' ', s)
end.
