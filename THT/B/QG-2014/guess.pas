uses dic;

type
  dic_t = array of string;
  coun_t = array['a'..'z'] of byte;

var
  f: text;
  dict, new_dict: array[0..999999] of string;
  chars: array of coun_t;
  count: coun_t;
  enum: array of record i, n: byte end;
  len, new_len: longint;
  i, j: byte;
  c: char;


procedure swapbyte(var x, y: byte);
  var
    tmp: byte;

  begin
    tmp := x;
    x := y;
    y := tmp
  end;



begin
  len := 0;
  assign(f, 'DIC.DAT');
  reset(f);
  while not eof(f) do
    begin
      readln(f, dict[len]);
      inc(len)
    end;
  close(f);

  setlength(chars, len);
  for i := 0 to len - 1 do
    begin
      for c := 'a' to 'z' do
        chars[i][c] := 0;
      for c in dict[i] do
        inc(chars[i][c])
    end;
  for c := 'a' to 'z' do
    count[c] := count_char(c);

  new_len := 0;
  for i := 0 to len - 1 do
    begin
      for c := 'a' to '{' do
        if chars[i][c] <> count[c] then
          break;
      if c = '{' then
        begin
          new_dict[new_len] := dict[i];
          inc(new_len)
        end
    end;

  setlength(enum, length(new_dict[0]));
  for i := 0 to length(enum) - 1 do
    begin
      enum[i].i := i + 1;
      enum[i].n := 0;
      for c := 'a' to 'z' do
        count[c] := 0;
      for j := 0 to new_len - 1 do
        inc(count[new_dict[j][i + 1]]);
      for c := 'a' to 'z' do
        if count[c] > 0 then
          inc(enum[i].n)
    end;

  for i := 0 to length(enum) - 2 do
    for j := i + 1 to length(enum) - 1 do
      if enum[i].n < enum[j].n then
        begin
          swapbyte(enum[i].n, enum[j].n);
          swapbyte(enum[i].i, enum[j].i)
        end;

  j := 0;
  while new_len > 1 do
    begin
      len := new_len;
      for i := 0 to len - 1 do
        dict[i] := new_dict[i];

      c := get_char_at_pos(enum[j].i);
      new_len := 0;
      for i := 0 to len - 1 do
        if dict[i][enum[j].i] = c then
          begin
            new_dict[new_len] := dict[i];
            inc(new_len)
          end;
      inc(j)
    end;

  answer(new_dict[0])
end.
