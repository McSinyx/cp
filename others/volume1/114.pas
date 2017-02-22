var
  m, n, i, j: int16;
  h: array[0..1001, 0..1001] of int32;
  count: int32 = 0;

function stupid(x, y: int16): int8;
  begin
    if h[x][y] > h[x - 1][y] then
      exit(0);
    if h[x][y] > h[x + 1][y] then
      exit(0);
    if h[x][y] > h[x][y - 1] then
      exit(0);
    if h[x][y] > h[x][y + 1] then
      exit(0);
    stupid := 1
  end;

begin
  readln(m, n);
  for i := 1 to m do
    for j := 1 to n do
      read(h[i][j]);
  for i := 0 to m do
    h[i][0] := 0;
  for i := 1 to m + 1 do
    h[i][n + 1] := 0;
  for i := 0 to n do
    h[0][j] := 0;
  for i := 1 to n + 1 do
    h[m + 1][i] := 0;
  for i := 1 to m do
    for j := 1 to n do
      inc(count, stupid(i, j));
  writeln(count)
end.
