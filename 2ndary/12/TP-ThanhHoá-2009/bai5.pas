uses
  sortnfind;

var
  f: text;
  rect: array of boolean;
  mem: array of intar;
  m, n: byte;
  tmp, i, idx0, idx1: smallint;


function locate(x: smallint): smallint;
  var
    i: smallint;

  begin
    for i := 0 to length(mem) - 1 do
      if binin(mem[i], x) then
        exit(i)
  end;


procedure mv(
  src: intar;
  var dest: intar
);

  var
    lendest, lensrc, i: smallint;

  begin
    lendest := length(dest);
    lensrc := length(src);
    setlength(dest, lendest + lensrc);

    for i := 0 to lensrc - 1 do
      dest[i + lendest] := src[i];

    setlength(src, 0);
    qsort(dest)
  end;


begin
  assign(f, 'BAI5.INP');
  reset(f);
  readln(f, m, n);
  setlength(rect, m * n);

  for i := 0 to m * n - 1 do
    begin
      read(f, tmp);

      if tmp = 0 then
        rect[i] := true
      else
        rect[i] := false
    end;
  close(f);

  setlength(mem, 0);

  for i := 0 to m * n - 1 do
    if rect[i] then
      begin
        idx0 := -1;
        idx1 := -1;

        if (i > 0) and rect[i - 1] then
          idx0 := locate(i - 1);

        if (i >= n) and rect[i - n] then
          if idx0 = -1 then
            idx0 := locate(i - n)
          else
            begin
              tmp := locate(i - n);

              if tmp < idx0 then
                begin
                  idx1 := idx0;
                  idx0 := tmp
                end
              else if tmp > idx0 then
                idx1 := tmp
            end;

        if idx0 + idx1 = -2 then
          begin
            setlength(mem, length(mem) + 1);
            setlength(mem[length(mem) - 1], 1);
            mem[length(mem) - 1][0] := i;
            continue
          end;

        setlength(mem[idx0], length(mem[idx0]) + 1);
        mem[idx0][length(mem[idx0]) - 1] := i;

        if idx1 > 0 then
          mv(mem[idx1], mem[idx0])
      end;

  tmp := 0;
  for i := 0 to length(mem) - 1 do
    if length(mem[i]) > tmp then
      tmp := length(mem[i]);

  assign(f, 'BAI5.OUT');
  rewrite(f);
  writeln(f, tmp);
  close(f)
end.
