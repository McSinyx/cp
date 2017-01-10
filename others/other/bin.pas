var
  f: text;
  n: int64;
  s: string = '';

begin
  assign(f, 'BIN.INP');
  reset(f);
  readln(f, n);
  close(f);

  while n > 0 do
    begin
      s := chr(n mod 2 + 48) + s;
      n := n shr 1
    end;

  writeln(s);

  assign(f, 'BIN.OUT');
  rewrite(f);
  writeln(f, s);
  close(f)
end.
