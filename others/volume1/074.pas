var
  n, i, j, max: int16;
  a: array of int64;

function zigzag(i, j: int16): boolean;
  begin
    if j - i < 2 then
      exit(true);
    if (a[j - 1] - a[j - 2]) * (a[j - 1] - a[j]) > 0 then
      exit(true);
    zigzag := false
  end;

begin
  readln(n);
  setlength(a, n);
  for i := n - 1 downto 0 do
    read(a[i]);
  max := 0;
  while i < n - 1 do
    for j := i + 1 to n - 1 do
      if (j = n - 1) or
         not zigzag(i, j + 1) then
        begin
          if j - i > max then
            max := j - i;
          i := j
        end;
  writeln(max + 1)
end.
