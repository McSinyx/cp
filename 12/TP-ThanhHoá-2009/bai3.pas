var
  f: text;
  s: string;
  min: byte = 255;


procedure palen(
  s: string;
  tmp: smallint
);

  begin
    if tmp + length(s) >= min then
      exit;

    if length(s) < 2 then
      begin
        min := tmp + length(s);
        exit
      end;

    if s[1] = s[length(s)] then
      palen(copy(s, 2, length(s) - 2), tmp + 2)
    else
      begin
        palen(copy(s, 2, length(s) - 1), tmp + 2);
        palen(copy(s, 1, length(s) - 1), tmp + 2)
      end
  end;


begin
  assign(f, 'BAI3.INP');
  reset(f);
  read(f, s);
  close(f);

  palen(s, -length(s));

  assign(f, 'BAI3.OUT');
  rewrite(f);
  writeln(f, min);
  close(f)
end.
