uses
  sortnfind;

var
  f: text;
  n, i, j: smallint;
  b: array of int64;
  c: int64;
  a: qword = 0;


function sign(x: int64): shortint;
  begin
    if x < 0 then
      exit(-1);
    exit(1)
  end;


function min(
  x: qword;
  y, z: int64
): qword;

  var
    tmp: qword;

  begin
    if sign(y) = sign(z) then
      tmp := abs(y) + abs(z)
    else if abs(y) < abs(z) then
      tmp := abs(z) - abs(y)
    else
      tmp := abs(y) - abs(z);

    if tmp < x then
      exit(tmp);
    exit(x)
  end;


begin
  assign(f, 'GAME.INP');
  reset(f);
  readln(f, n);
  setlength(b, n);
  for i := 0 to n - 1 do
    read(f, b[i]);
  qsort(b);
  for i := 0 to n - 1 do
    begin
      read(f, c);
      for j := 0 to n - 1 do
        a := min(a, b[j], c)
    end;
  close(f);

  assign(f, 'GAME.OUT');
  rewrite(f);
  writeln(f, a);
  close(f)
end.
