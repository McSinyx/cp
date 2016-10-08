type
  rect = record
    a : longint;
    b : longint
  end;
  arec = array of rect;

var
  f : text;
  c, d, e : rect;

function join(g, h : rect) : arec;
  var n : byte = 0;
  procedure j01n(p, q : longint);
    begin
      inc(n);
      setlength(join, n);
      join[n - 1].a := p;
      join[n - 1].b := q
    end;
  begin
    if g.a = h.a then j01n(g.a, g.b + h.b);
    if g.a = h.b then j01n(g.a, g.b + h.a);
    if g.b = h.a then j01n(g.b, g.a + h.b);
    if g.b = h.b then j01n(g.b, g.a + h.a);
  end;

procedure out(m : longint);
  begin
    assign(f, 'GH.OU');
    rewrite(f);
    writeln(f, m);
    close(f);
    halt
  end;

procedure libl2(x, y, z : rect);
  var i, j : rect;
  begin
    for i in join(x, y) do
      for j in join(z, i) do
        if (j.a = j.b) and (j.a <> 0) then
          out(j.a)
  end;

begin
  assign(f, 'GH.IN');
  reset(f);
  readln(f, c.a, c.b);
  readln(f, d.a, d.b);
  readln(f, e.a, e.b);
  close(f);
  libl2(c, d, e);
  libl2(d, e, c);
  libl2(e, c, d);
  out(0)
end.
