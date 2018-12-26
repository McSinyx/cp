type sni = record
  s : ansistring;
  n : integer
end;

var
  f : text;
  s : ansistring;
  op, cl : integer;
  c : char;

function cal(s : ansistring) : integer;
  var
    c : char;
    tmp : integer = 0;
  begin
    cal := 0;
    for c in s do
      if c = '(' then
        begin
          inc(tmp);
          if tmp > cal then
            cal := tmp
        end
      else
        begin
          dec(tmp);
          if tmp < 0 then exit(0)
        end;
    if tmp <> 0 then
      exit(0)
  end;

function rplc(
  s : ansistring;
  c : char;
  idx : integer
) : ansistring;
  begin
    exit(copy(s, 1, idx - 1) + c + copy(s, idx + 1, length(s) - idx + 1))
  end;

function libtn(
  s : ansistring;
  op, cl, idx : integer
) : sni;
  var
    i : integer;
    v0, v1 : sni;
  begin
    if (op = 0) and (cl = 0) then
      begin
        libtn.s := s;
        libtn.n := cal(s);
        exit
      end;
    i := idx;
    while s[i] <> '?' do
      inc(i);
    if op = 0 then
      exit(libtn(rplc(s, ')', i), 0, cl - 1, i + 1));
    if cl = 0 then
      exit(libtn(rplc(s, '(', i), op - 1, 0, i + 1));
    v0 := libtn(rplc(s, '(', i), op - 1, cl, i + 1);
    v1 := libtn(rplc(s, ')', i), op, cl - 1, i + 1);
    if v0.n > v1.n then
      exit(v0)
    else exit(v1)
  end;

begin
  assign(f, 'BTN.INP');
  reset(f);
  read(f, s);
  close(f);
  op := length(s) div 2;
  cl := length(s) div 2;
  for c in s do
    if c = '(' then
      dec(op)
    else if c = ')' then
      dec(cl);
  assign(f, 'BTN.OUT');
  rewrite(f);
  writeln(f, libtn(s, op, cl, 1).s);
  close(f)
end.
