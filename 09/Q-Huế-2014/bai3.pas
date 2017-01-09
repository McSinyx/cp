var
  x, y: string;
  f: text;
  a: array[0 .. 9] of shortint;
  b: shortint;
  c: char;

begin
  assign(f, 'INPUT.INP');
  reset(f);
  readln(f, x);
  readln(f, y);
  close(f);

  fillchar(a, 0, sizeof(a));

  for c in x do
    a[ord(c) - 48] := 1;

  for c in y do
    begin
      b := ord(c) - 48;
      if a[b] = 1 then
        a[b] := 2
    end;

  assign(f, 'OUTPUT.OUT');
  rewrite(f);
  for b := 9 downto 0 do
    if a[b] = 2 then
      write(f, b);
  writeln(f);
  close(f)
end.
