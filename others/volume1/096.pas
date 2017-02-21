uses math, strutils;

var
  a, b: ansistring;
  n: int16;
  remain: boolean = false;
  d: uint8;

begin
  readln(a);
  readln(b);
  n := max(length(a), length(b)) + 1;
  a := addchar('0', a, n);
  b := addchar('0', b, n);
  repeat
    if remain then
      d := ord(a[n]) + ord(b[n]) - 47
    else
      d := ord(a[n]) + ord(b[n]) - 48;
    if d > 57 then
      begin
        dec(d, 10);
        remain := true
      end
    else
      remain := false;
    a[n] := chr(d);
    dec(n)
  until n = 0;
  if ord(a[1]) = 48 then
    writeln(copy(a, 2, length(a) - 1))
  else
    writeln(a)
end.
