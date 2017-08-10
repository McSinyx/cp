uses strutils;

var
  i: int16;

function ivxlcdm(s: string): boolean;
  var
    a: array['C'..'X'] of int8;
    c: char;

  begin
    for c in 'IVXLCDM' do
      a[c] := 0;
    for c in s do
      inc(a[c]);
    for c in 'IVXLCDM' do
      if a[c] <> 1 then
        exit(false);
    ivxlcdm := true
  end;

begin
  for i := 1000 to 2000 do
    if ivxlcdm(inttoroman(i)) then
      writeln(i)
end.
