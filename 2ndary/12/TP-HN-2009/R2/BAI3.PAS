type
  ar = array of ansistring;

var
  f : text;
  s0 : ansistring;
  a0 : ar;

function incre(s1, s2 : ansistring) : boolean;
  var
    i : smallint;
  begin
    if length(s1) < length(s2) then exit(true);
    if length(s1) > length(s2) then exit(false);
    for i := 1 to length(s1) do
      begin
        if ord(s1[i]) < ord(s2[i]) then exit(true);
        if ord(s1[i]) > ord(s2[i]) then exit(false)
      end;
    exit(false)
  end;

function cal(a : ar) : smallint;
  var
    len, i, tmp : smallint;
  begin
    cal := 0;
    i := 0;
    len := length(a);
    while (cal + i < len) and (i + 1 < len) do
      begin
        inc(i);
        if incre(a[0], a[i]) then
          begin
            tmp := cal(copy(a, i, len - i)) + 1;
            if tmp > cal then
              cal := tmp
          end
      end
  end;

function putin(
  aray : ar;
  strng : ansistring;
  len : smallint
) : ar;
  begin
    setlength(aray, length(aray) + 1);
    aray[length(aray) - 1] := copy(strng, 1, len);
    exit(aray)
  end;

function libai3(
  s : ansistring;
  a : ar;
  n : smallint
) : smallint;
  var
    len, i, tmp : smallint;
  begin
    if s = '' then
      exit(cal(a));
    libai3 := 0;
    len := length(s);
    i := 0;
    while (i < n) and (i + libai3 < len) do
      begin
        inc(i);
        tmp := libai3(copy(s, i + 1, len - i), putin(a, s, i), n + 1);
        if tmp > libai3 then
          libai3 := tmp
      end
  end;

begin
  assign(f, 'BAI3.INP');
  reset(f);
  readln(f);
  read(f, s0);
  close(f);
  setlength(a0, 1);
  a0[0] := '';
  assign(f, 'BAI3.OUT');
  rewrite(f);
  writeln(f, libai3(s0, a0, 1));
  close(f)
end.
