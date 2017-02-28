var
  i, n: int32;

function isperfect(n: int32): boolean;
  var
    i, s, m: int32;
  begin
    m := trunc(sqrt(n));
    if n mod m > 0 then
      s := 1
    else if n = m * m then
      s := 1 + m
    else
      s := 1 + m + n div m;
    for i := 2 to m - 1 do
      if n mod i = 0 then
        s := s + i + n div i;
    if s = n then
      isperfect := true
    else
      isperfect := false
  end;

begin
  readln(n);
  for i := 2 to n do
    if isperfect(i) then
      writeln(i)
end.
