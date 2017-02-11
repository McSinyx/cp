uses fibonacci;

var
  m: int64;
  i: byte;

begin
  readln(m);
  if m <= 2 then
    begin
      writeln('1 1');
      exit
    end;

  for i := 3 to 88 do
    if fibonacci93[i] > m then
      begin
        writeln(i - 1, ' ', fibonacci93[i - 1]);
        exit
      end
end.
