uses math, strutils, sysutils;

var
  minx, maxx, miny, maxy, stepx, stepy, i, x0, f: integer;
  n, j, lenf: byte;
  raw_freq, freq: array of integer;
  xtrue, xfalse: array of string;


function gcd(a, b: integer): integer;
  var
    c: integer;

  begin
    while b > 0 do
      begin
        c := b;
        b := a mod b;
        a := c
      end;
    gcd := a
  end;


begin
  read(minx, maxx, miny, maxy, stepx, n);
  setlength(raw_freq, maxx - minx + 1);
  for i := 0 to length(raw_freq) - 1 do
    raw_freq[i] := 0;
  for i := 1 to n do
    begin
      readln(x0, f);
      raw_freq[x0 - minx] := f
    end;

  setlength(freq, length(raw_freq) div stepx);
  for i := 0 to length(freq) - 1 do
    begin
      freq[i] := 0;
      for j := 0 to stepx - 1 do
        inc(freq[i], raw_freq[i * stepx + j]);
      freq[i] := freq[i] div stepx
    end;

  stepy := maxy - miny + 1;
  for i in freq do
    stepy := gcd(stepy, i - miny + 1);

  lenf := 0;
  i := miny;
  repeat
    lenf := max(length(inttostr(i)), lenf);
    inc(i, stepy)
  until i > maxy;

  setlength(xfalse, length(freq));
  setlength(xtrue, length(freq));
  for i := 0 to length(freq) - 1 do
    begin
      xtrue[i] := addchar('*', '', length(inttostr(minx + stepx * i)));
      xfalse[i] := addchar(' ', '', length(inttostr(minx + stepx * i)));
      for j := 1 to stepx - 1 do
        begin
          xtrue[i] :=
            xtrue[i] +
            addchar('*', '', length(inttostr(minx + stepx*i + j)) + 1);
          xfalse[i] :=
            xfalse[i] +
            addchar(' ', '', length(inttostr(minx + stepx*i + j)) + 1)
        end
    end;

  repeat
    write(addchar(' ', inttostr(maxy), lenf), ' ');
    for i := 0 to length(freq) - 2 do
      begin
        if freq[i] >= maxy then
          write(xtrue[i])
        else
          write(xfalse[i]);
        write(' ')
      end;
    if freq[length(freq) - 1] >= maxy then
      writeln(xtrue[length(freq) - 1])
    else
      writeln(xfalse[length(freq) - 1]);
    dec(maxy, stepy)
  until maxy < miny;

  write(addchar(' ', '', lenf + 1));
  for i := minx to maxx - 1 do
    write(i, ' ');
  writeln(maxx)
end.
