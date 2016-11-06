uses math;
var
  f : text;
  n, i : byte;
  a, b, c, c0 : array[1..255] of byte;
  d : array[1..255] of boolean;
  out : cardinal;
procedure libgc2m(m : byte; o0, o1 : cardinal);
  var j : byte;
  begin
    if m > 0 then begin
      for j := 1 to n do
        if d[j] then begin
          d[j] := false;
          c[n - m + 1] := j;
          libgc2m(m - 1, o0 + a[j], max(o0 + a[j], o1) + b[j]);
          d[j] := true;
        end
    end else
      if (o1 < out) or (out = 0) then begin
        out := o1;
        for j := 1 to n do c0[j] := c[j]
      end
  end;
begin
  assign(f, 'llgc2m.inp');
  reset(f);
  readln(f, n);
  for i := 1 to n do read(f, a[i], b[i]);
  close(f);
  for i := 1 to n do d[i] := true;
  out := 0;
  for i := 1 to n do begin
    d[i] := false;
    c[1] := i;
    libgc2m(n - 1, a[i], a[i] + b[i]);
    d[i] := true
  end;
  assign(f, 'llgc2m.out');
  rewrite(f);
  writeln(f, out);
  for i := 1 to n do write(f, c0[i], ' ');
  close(f)
end.
