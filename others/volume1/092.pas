uses strutils;

var
  s: ansistring;

begin
  readln(s);
  s := delspace1(' ' + s + ' ');
  writeln(copy(s, 2, length(s) - 2))
end.
