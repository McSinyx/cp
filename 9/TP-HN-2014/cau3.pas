var
  f: text;
  s: string;
  c: char;
  a: array of byte;
  i, j: byte;
  tmp: byte = 0;


function palin(
  s: string;
  l, h: byte
): boolean;

  begin
    while l <= h do
      begin
        if s[l] <> s[h] then
          exit(false);

        inc(l);
        dec(h);
      end;

    palin := true
  end;



begin
  assign(f, 'CAU3.INP');
  reset(f);
  readln(f, s);
  close(f);

  setlength(a, 256);
  for i := 0 to 255 do
    a[i] := 0;

  for c in s do
    inc(a[ord(c)]);

  for i in a do
    if i > 0 then
      inc(tmp);

  assign(f, 'CAU3.OUT');
  rewrite(f);
  writeln(f, tmp);

  tmp := 0;
  for i := 1 to length(s) - 1 do
    for j := i + tmp to length(s) do
      if palin(s, i, j) then
        tmp := j - i + 1;

  writeln(f, tmp);
  close(f)
end.
