type
  pointtype = record
    x, y: int16
  end;

var
  f: text;
  n, i, j: int32;
  count: int32 = 0;
  c, k: int8;
  color: array[-200..200, -200..200] of int8;
  points: array[1..4, 1..100000] of pointtype;
  len: array[1..4] of int16 = (0, 0, 0, 0);

function colorec(var a, b: pointtype): boolean;
  begin
    colorec := [color[a.x, b.y], color[b.x, a.y],
                color[a.x, a.y], color[b.x, b.y]] = [1, 2, 3, 4]
  end;

begin
  for i := -200 to 200 do
    for j := -200 to 200 do
      color[i, j] := 0;
  assign(f, 'COLOREC.INP');
  reset(f);
  readln(f, n);
  repeat
    readln(f, i, j, c);
    color[i, j] := c;
    inc(len[c]);
    points[c, len[c]].x := i;
    points[c, len[c]].y := j
  until eof(f);
  close(f);

  for k := 1 to 4 do
    if len[k] <= n then
      begin
        c := k;
        n := len[c]
      end;
  for i := 1 to n do
    for k := 1 to 4 do
      if k <> c then
        for j := 1 to len[k] do
          if colorec(points[c, i], points[k, j]) then
            inc(count);

  assign(f, 'COLOREC.OUT');
  rewrite(f);
  writeln(f, count);
  close(f)
end.
