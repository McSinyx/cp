const
  inp = 'xepviec.inp';
  out = 'xepviec.out';
type int200 = 0..200;
var
  f : text;
  n, i, j, k, l, tmp : int200;
  a : array[0..200, 0..200] of int200;
function next(m : int200) : boolean;
  var i0, j0 : int200;
  begin
    for i0 := 1 to a[0, 0] do
      for j0 := 2 to a[i0, 0] do
        if m = a[i0, j0] then exit(false);
    next := true;
  end;
begin
  assign(f, inp);
  reset(f);
  readln(f, n);
  i := 0;
  repeat
    inc(i);
    j := 0;
    repeat
      inc(j);
      read(f, a[i, j])
    until eoln(f);
    a[i, 0] := j
  until eof(f);
  close(f);
  a[0, 0] := i - 1;
  for i := 1 to n do
    for j := 1 to a[0, 0] do
      if (a[j, 0] > 0) and next(a[j, 1]) then
        begin
          tmp := a[j, 1];
          a[0, i] := tmp;
          for k := 1 to a[0, 0] do
            if a[k, 1] = tmp then
              begin
                dec(a[k, 0]);
                for l := 1 to a[k, 0] do
                  a[k, l] := a[k, l + 1]
              end;
          break
        end;
  assign(f, out);
  rewrite(f);
  for i := 1 to n do
    write(f, a[0, i], ' ');
  close(f)
end.
