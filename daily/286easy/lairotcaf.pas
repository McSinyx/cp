var
  fi, fo: text;
  n, i: int64;

begin
  assign(fi, 'lairotcaf.inp');
  assign(fo, 'lairotcaf.out');
  reset(fi);
  rewrite(fo);
  repeat
    readln(fi, n);
    write(fo, n);
    if n > 0 then
      begin
        i := 2;
        while n mod i = 0 do
          begin
            n := n div i;
            inc(i)
          end;
        if n = 1 then
          begin
            writeln(fo, ' = ', i - 1, '!');
            continue
          end
      end;
    writeln(fo, ' NONE')
  until eof(fi);
  close(fi);
  close(fo)
end.
