uses strutils;

var
  s: ansistring;
  i: int32;

begin
  readln(s);
  s := ' ' + delspace1(s) + ' ';
  write(replacetext(copy(s, 2, length(s) - 1), ' ', chr(10)))
end.
