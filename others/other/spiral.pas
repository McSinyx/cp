uses sysutils;

const
  direction: array[0..3, 0..1] of int8 = ((0, 1), (1, 0), (0, -1), (-1, 0));

var
  f: text;
  n, i: int32;
  m, x, y: int16;
  d: int8 = 0;
  a: array of array of int32;

function mt(x, y: int16): boolean;
  begin
    if (x < 0) or (y < 0) then
      exit(false);
    if (x >= m) or (y >= n) then
      exit(false);
    if a[x][y] > 0 then
      exit(false);
    mt := true
  end;

function rjust(i: int32; len: int8): string;
  begin
    rjust := inttostr(i);
    while length(rjust) < len do
      rjust := ' ' + rjust
  end;

begin
  assign(f, 'SPIRAL.INP');
  reset(f);
  readln(f, n);
  for m := trunc(sqrt(n)) downto 1 do
    if n mod m = 0 then
      begin
        n := n div m;
        break
      end;
  close(f);

  setlength(a, m);
  for x := m - 1 downto 0 do
    begin
      setlength(a[x], n);
      for y := n - 1 downto 0 do
        a[x][y] := 0
    end;

  for i := 1 to m * n do
    begin
      a[x][y] := i;
      if not mt(x + direction[d][0], y + direction[d][1]) then
        d := succ(d) mod 4;
      inc(x, direction[d][0]);
      inc(y, direction[d][1])
    end;

  assign(f, 'SPIRAL.OUT');
  rewrite(f);
  d := length(inttostr(m * n));
  for x := 0 to m - 1 do
    begin
      for y := 0 to n - 2 do
        write(f, rjust(a[x][y], d), ' ');
      writeln(f, rjust(a[x][n - 1], d))
    end;
  close(f)
end.
