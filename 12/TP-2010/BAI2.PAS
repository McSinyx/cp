var
  f : text;
  s : string;
  len, i, j : byte;
  count : integer = 0;

function libai2(s0 : string) : boolean;
  var
    bo, boo, b0 : boolean;
    c : char;
  begin
    b0 := false;
    bo := false;
    boo := false;
    for c in s0 do
      begin
        case c of
          '0' .. '9' : b0 := true;
          'a' .. 'z' : bo := true;
          'A' .. 'Z' : boo := true
        end;
        if b0 and bo and boo then exit(true)
      end;
    exit(false);
  end;

begin
  assign(f, 'BAI2.INP');
  reset(f);
  read(f, s);
  close(f);
  len := length(s);
  for i := 1 to len - 5 do
    for j := 6 to len - i + 1 do
      if libai2(copy(s, i, j)) then inc(count);
  assign(f, 'BAI2.OUT');
  rewrite(f);
  writeln(f, count);
  close(f)
end.
