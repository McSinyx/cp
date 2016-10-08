type
  tank = record
    a, b, c, x, y : shortint
  end;
  tanklist = array[1..10] of tank;
  out = record
    x, y, u, v : shortint
  end;

var
  f : text;
  m, n, id, i, j, p : shortint;
  t1, t2, ttmp : tanklist;
  o : out;

function shootable(tank0, tank1 : tank) : boolean;
  begin
    exit(abs(tank0.x - tank1.x) + abs(tank0.y - tank1.y) <= tank0.c)
  end;

{This function should also care about the target's HP, but never mind LOL}
function damage(tank0 : tank) : shortint;
  var
    tmp : shortint;
  begin
     tmp := tank0.a * tank0.b;
     if tmp mod 10 = 0 then
      exit(tmp div 10);
     exit(tmp div 10 + 1)
  end;

begin
  assign(f, 'map.inp');
  reset(f);
  readln(f, m, n, id);
  for i := 1 to m do
    readln(f, t1[i].a, t1[i].b, t1[i].c, t1[i].x, t1[i].y);
  for i := 1 to n do
    readln(f, t2[i].a, t2[i].b, t2[i].c, t2[i].x, t2[i].y);
  close(f);
  if id = 2 then
    begin
      ttmp := t1;
      t1 := t2;
      t2 := ttmp;
      i := m;
      m := n;
      n := i
    end;
  p := 0;
  o.x := 0;
  for i := 1 to m do
    for j := 1 to n do
      if shootable(t1[i], t2[j]) and (damage(t1[i]) > p) then
        begin
          p := damage(t1[i]);
          o.x := t1[i].x;
          o.y := t1[i].y;
          o.u := t2[j].x;
          o.v := t2[j].y
        end;
  assign(f, 'decision.out');
  rewrite(f);
  if o.x > 0 then
    writeln(f, '2 ', o.x, ' ', o.y, ' ', o.u, ' ', o.v)
  else
    begin
      randomize;
      i := random(m) + 1;
      write(f, '2 ', t1[i].x, ' ', t1[i].y, ' ');
      if id = 1 then
        writeln(f, random(4) + 5, ' ', random(4) + 5)
      else
        writeln(f, random(4) + 1, ' ', random(4) + 1)
    end;
  close(f)
end.