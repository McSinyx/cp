type ar = array[0..3] of longint;

var
  f : text;
  m, n, i, j : shortint;
  a : array[1..101, -1..102] of longint;
  tmp, max : longint;

function next(x, y : shortint) : ar;
  begin
    next[0] := a[x + 1, y - 2];
    next[1] := a[x + 1, y + 2];
    next[2] := a[x + 2, y - 1];
    next[3] := a[x + 2, y + 1]
  end;

begin
  for i := 1 to 101 do
    for j := -1 to 102 do
      a[i, j] := 0;
  assign(f, 'QM.IN');
  reset(f);
  readln(f, m, n);
  for i := 1 to m do
    for j := 1 to n do
      read(f, a[i, j]);
  close(f);
  for i := m - 1 downto 1 do
    for j := 1 to n do
      begin
        max := 0;
        for tmp in next(i, j) do
          if tmp > max then
            max := tmp;
        a[i, j] := a[i, j] + max;
      end;
  assign(f, 'QM.OU');
  rewrite(f);
  max := 0;
  for i := 1 to n do
    if a[1, i] > max then
      max := a[1, i];
  writeln(f, max);
  close(f);
end.
