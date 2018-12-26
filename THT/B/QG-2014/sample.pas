uses dic;

var
  answer1: char;
  answer2, answer3, answer4: longint;

begin
  answer1 := get_char_at_pos(4);
  writeln('Vi tri thu 4 cua xau can tim la: ', answer1);

  answer2 := count_char('c');
  writeln('So luong ki tu c trong tu can tim la: ', answer2);

  answer3 := count_char('a');
  writeln('So luong ki tu a trong tu can tim la: ', answer3);

  answer4 := count_char('n');
  writeln('So luong ki tu n trong tu can tim la: ', answer4);

  answer('can');
end.
