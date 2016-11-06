type
  board = array[0..1023] of boolean;

var
  f : text;
  a : board;
  i, j, k, l, m, n : byte;

function king(
  e : board;
  x, y : byte
) : board;
  var z, t : byte;
  begin
    for z := x - 1 to x + 1 do
      for t := y - 1 to y + 1 do
        e[z, t] := true;
    exit(e)
  end;

function full(c : board) : boolean;
  var d : boolean;
  begin
    for d in c do
      if not(d) then
        exit(false);
    exit(true)
  end;

function libai3(
  b : board;
  x0, y0 : byte
) : byte;
  type tmp = record
      n, x, y : byte
    end;
  var
    max : tmp;
    t, x, y : byte;
  begin
    if full(b) then exit(0);
    max.n := 0;
    for x := x0 to m do
      for y := y0 to n do
        if not(b[x, y]) then
          begin
            t := libai3(king(b, x, y), x + 1, y + 1) + 1;
            writeln(t);
            if t > max.n then
              begin
                max.x := x;
                max.y := y;
                max.n := t
              end
          end;
    exit(max.n)
  end;

begin
  assign(f, 'BAI3.INP');
  reset(f);
  readln(f, m, n, k);
  for l := 1 to k do
    begin
      readln(f, i, j);
      a := king(a, i, j)
    end;
  close(f);
  assign(f, 'BAI3.OUT');
  rewrite(f);
  writeln(libai3(a, 1, 1));
  close(f)
end.
