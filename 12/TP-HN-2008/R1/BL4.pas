var
  f : text;
  n : word;
  a, b : array of longword;
  tmp0, tmp1 : longword;

procedure ins(var l : array of longword; x : longword);
  begin
    setlength(l, length(l) + 1);
    l[length(l) - 1] := x
  end;

begin
  setlength(a, 0);
  setlength(b, 0);
  assign(f, 'CLB.IN');
  reset(f);
  readln(f, n);
  for i := 1 to n do
    begin
      readln(f, tmp0, tmp1);
      ins(a, tmp0);
      ins(b, tmp1)
    end;
  close(f);
  
