const
  cond: array[0..2] of set of char = (
    ['A', 'H', 'I', 'M', 'O', 'T', 'U', 'V', 'W', 'X', 'Y'],
    ['B', 'C', 'D', 'E', 'H', 'I', 'K', 'O', 'X'],
    ['H', 'I', 'N', 'O', 'S', 'X', 'Y']
  );

var
  s: ansistring;
  c: char;
  b: array[0..2] of boolean;
  i: int8;

begin
  readln(s);
  for i := 0 to 2 do
    b[i] := true;
  for c in s do
    for i := 0 to 2 do
      b[i] := b[i] and (c in cond[i]);
  for i := 0 to 2 do
    if b[i] then
      write('+')
    else
      write('-');
  writeln
end.
end.
