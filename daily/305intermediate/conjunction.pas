type
  strarray = array of string;

var
  wordlist, a, maxa, mt: strarray;
  i: int32;
  size: int8 = 1;
  s, maxs: string;


function isnotin(
  s: string;
  a: strarray
): boolean;

  var
    l, m, h: int32;

  begin
    l := 0;
    h := length(a) - 1;
    repeat
      m := (l + h) div 2;
      if s = a[m] then
        exit(false)
      else if s < a[m] then
        h := m - 1
      else
        l := m + 1
    until l > h;
    isnotin := true
  end;


function conjunct(
  s: string;
  size: int8
): strarray;

  var
    a: strarray;
    i, j: int8;

  begin
    if s = '' then
      exit(mt);
    setlength(conjunct, 0);
    for i := size to length(s) do
      begin
        if isnotin(copy(s, 1, i), wordlist) then
          continue;
        a := conjunct(copy(s, i + 1, length(s) - i), size);
        if ((length(a) = 1) and
            (copy(s, i + 1, length(s) - i) <> a[0])) or
           (length(a) < length(conjunct)) then
          continue;

        setlength(conjunct, length(a) + 1);
        for j := 1 to length(a) do
          conjunct[j] := a[j - 1];
        conjunct[0] := copy(s, 1, i)
      end;
  end;


begin
  setlength(wordlist, 69903); (* I know this is a bit cheaty *)
  assign(input, 'wordlist');
  reset(input);
  for i := 0 to 69902 do
    readln(wordlist[i]);
  close(input);
  setlength(mt, 0); (* for convenience *)

  repeat
    setlength(maxa, 0);
    for s in wordlist do
      begin
        if length(s) < length(maxa) * size then
          continue;
        a := conjunct(s, size);
        if length(a) > length(maxa) then
          begin
            setlength(maxa, length(a));
            for i := 0 to length(a) - 1 do
              maxa[i] := a[i];
            maxs := s
          end
      end;
    if length(maxa) = 0 then
      break;

    write('Min size ', size, ': ', maxs, ' (', length(maxa), ': ');
    for i := 0 to length(maxa) - 2 do
      write(maxa[i], ', ');
    writeln(maxa[length(maxa) - 1], ')');
    inc(size)
  until false (* the loop should break before writing *)
end.
