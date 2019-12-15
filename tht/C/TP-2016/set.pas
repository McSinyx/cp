var
  f : text;
  m, n, id : shortint;
  {This, because random failed on Windows, may because of not having /dev/urandom}
  out : array[1..8] of shortint = (5, 1, 3, 7, 2, 6, 4, 8);

begin
  assign(f, 'set.inp');
  reset(f);
  readln(f, m, n, id);
  close(f);
  if id = 2 then
    begin
      m := n;
      n := 5
    end
  else
    n := 4;
  assign(f, 'set.out');
  rewrite(f);
  for id := 1 to m do
    writeln(f, n, ' ', out[id]);
  close(f)
end.