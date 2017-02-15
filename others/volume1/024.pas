uses clib;

var
  n: int64;
  b: boolean;

begin
  readln(n);
  b := isprime(n);
  while b and (n > 9) do
    begin
      n := n div 10;
      b := b and isprime(n)
    end;
  writeln(b)
end.
