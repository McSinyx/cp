var
  f : text;
  n, n0, m, i, j, tmp : longint;
  s : string;

function dec2hex(deca : longint) : string;
  var
    a : array[0..7] of byte;
    i, j : byte;
  begin
    dec2hex := '';
    i := 0;
    while deca > 0 do
      begin
        a[i] := deca mod 16;
        deca := deca div 16;
        inc(i)
      end;
    dec(i);
    for j := i downto 0 do
      case a[j] of
        0 : dec2hex := dec2hex + '0';
        1 : dec2hex := dec2hex + '1';
        2 : dec2hex := dec2hex + '2';
        3 : dec2hex := dec2hex + '3';
        4 : dec2hex := dec2hex + '4';
        5 : dec2hex := dec2hex + '5';
        6 : dec2hex := dec2hex + '6';
        7 : dec2hex := dec2hex + '7';
        8 : dec2hex := dec2hex + '8';
        9 : dec2hex := dec2hex + '9';
        10 : dec2hex := dec2hex + 'A';
        11 : dec2hex := dec2hex + 'B';
        12 : dec2hex := dec2hex + 'C';
        13 : dec2hex := dec2hex + 'D';
        14 : dec2hex := dec2hex + 'E';
        15 : dec2hex := dec2hex + 'F'
      end
  end;

begin
  assign(f, 'HEXA.INP');
  reset(f);
  read(f, n);
  close(f);
  m := n;
  i := 0;
  while m > 0 do
    begin
      inc(i);
      tmp := 1;
      for j := 1 to i - 1 do tmp := tmp * 16;
      m := m + i * (tmp - tmp * 16)
    end;
  m := i;
  for i := 1 to m - 1 do
    begin
      tmp := 1;
      for j := 1 to i - 1 do tmp := tmp * 16;
      n := n + i * (tmp - tmp * 16)
    end;
  n0 := (n + m - 1) div m;
  for i := 1 to m - 1 do
    begin
      tmp := 1;
      for j := 1 to i - 1 do tmp := tmp * 16;
      n0 := n0 + tmp * 16 - tmp
    end;
    s := dec2hex(n0);
  if n mod m > 0 then m := n mod m;
  assign(f, 'HEXA.OUT');
  rewrite(f);
  writeln(f, s[m]);
  close(f)
end.
