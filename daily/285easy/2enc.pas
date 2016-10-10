var
  fi, fo: text;
  n, i: cardinal;


begin
  assign(fi, 'part2.inp');
  assign(fo, 'part2.out');
  reset(fi);
  rewrite(fo);
  repeat
    repeat
      read(fi, n);
      for i := 1 to n div 255 do
        write(fo, 255, ' ');
      write(fo, n mod 255, ' ')
    until eoln(fi);
    writeln(fo)
  until eof(fi);
  close(fi);
  close(fo)
end.
