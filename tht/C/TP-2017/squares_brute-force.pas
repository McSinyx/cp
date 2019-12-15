(* The method I actually used at the contest, approx 15% time-out. *)
uses math;

var
  f: text;
  m, n, i, j, x, y: int16;
  k: int8;
  net: array[1..1000, 1..1000] of boolean;
  count: int64 = 0;

begin
  assign(f, 'squares.inp');
  reset(f);
  readln(f, m, n, k);
  for x := 1 to m do
    for y := 1 to n do
      net[x][y] := true;
  repeat
    dec(k);
    readln(f, x, y);
    net[x][y] := false
  until k = 0;
  close(f);

  for x := 1 to m - 1 do
    for y := 1 to n - 1 do
      if net[x, y] then
        for i := 0 to x - 1 do
          for j := 1 to min(m - x, n - y - i) do
            if net[x - i, y + j] and
               net[x + j, y + i] and
               net[x - i + j, y + i + j] then
              count := count + 1;

  assign(f, 'squares.out');
  rewrite(f);
  writeln(f, count);
  close(f)
end.
