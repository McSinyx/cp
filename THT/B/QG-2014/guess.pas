uses dic;

var
  s: string = '';
  i: byte;
  c: char;

begin
  for i := 1 to 50 do
    begin
      c := get_char_at_pos(i);
      if c = '#' then
        answer(s)
      else
        s := s + c
    end
end.
