uses math, strutils;

var
  n: int64;

begin
  readln(n);
  writeln(inttobin(n, trunc(log2(n)) + 1))
end.
