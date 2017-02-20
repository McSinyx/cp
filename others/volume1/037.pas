var
  s: ansistring;


function bracket(
  s: ansistring;
  l, h: integer
): integer;

  var
    i, tmp: integer;

  begin
    if l > h then
      exit(0);
    bracket := -1;
    repeat
      tmp := 0;
      for i := l to h do
        begin
          if s[i] = '(' then
            dec(tmp)
          else
            inc(tmp);
          if tmp = 0 then
            begin
              tmp := succ(bracket(s, succ(l), pred(i)));
              if tmp > bracket then
                bracket := tmp;
              l := succ(i);
              break
            end
          end;
    until l > h;
  end;


begin
  readln(s);
  writeln(bracket(s, 1, length(s)))
end.
