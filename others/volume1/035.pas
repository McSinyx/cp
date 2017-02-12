var
  n, a: int16;
  b: array of boolean;

function all(b: array of boolean): boolean;
  var
    i: int16;
  begin
    for i := 0 to length(b) - 1 do
      if not b[i] then
        exit(false);
    all := true
  end;

begin
  readln(n);
  setlength(b, n);
  for n := n - 1 downto 0 do
    b[n] := false;
  for n := 1 to length(b) do
    begin
      read(a);
      if (a <= 0) or
         (a > length(b)) then
        continue;
      b[a - 1] := true
    end;
  writeln(all(b))
end.
