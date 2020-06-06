var
  f: text;
  n, i: shortint;
  a: array of string;


function minus(num, bit: shortint): boolean;
  begin
    minus := num shr bit mod 2 = 1
  end;


function cal(n, b: shortint): boolean;
  var
    i, s: shortint;

  begin
    s := 0;

    for i := 2 to n do
      if minus(b, n - i) then
        s := s - i
      else
        s := s + i;

    cal := s = -1
  end;


function equa(n, b: shortint): string;
  var
    i: shortint;

  begin
    equa := '1';

    for i := 2 to n do
      begin
        if minus(b, n - i) then
          equa := equa + '-'
        else
          equa := equa + '+';

        equa := equa + char(i + 48)
      end;

    equa := equa + '=0'
  end;


begin
  assign(f, 'BAI4.INP');
  reset(f);
  readln(f, n);
  close(f);
  setlength(a, 0);

  if n mod 4 mod 3 = 0 then
    for i := 1 to 1 shl (n - 1) - 1 do
      if cal(n, i) then
        begin
          setlength(a, length(a) + 1);
          a[length(a) - 1] := equa(n, i)
        end;

  assign(f, 'BAI4.OUT');
  rewrite(f);
  writeln(f, length(a));
  for i := 0 to length(a) - 1 do
    writeln(f, a[i]);
  close(f)
end.
