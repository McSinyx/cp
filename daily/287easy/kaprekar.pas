var
  a: array[0 .. 3] of shortint;

function largest_digit(n: smallint): shortint;
  var
    m: shortint;

  begin
    m := n div 1000;

    if m < n mod 1000 div 100 then
      m := n mod 1000 div 100;

    if m < n mod 100 div 10 then
      m := n mod 100 div 10;

    if m < n mod 10 then
      exit(n mod 10)
    else
      exit(m)
  end;

procedure sort_digits(n: smallint);
  var
    i, j: shortint;

  begin
    a[0] := n div 1000;
    a[1] := n mod 1000 div 100;
    a[2] := n mod 100 div 10;
    a[3] := n mod 10;

    for i := 0 to 2 do
      for j := i + 1 to 3 do
        if a[i] < a[j] then
          begin
            inc(a[i], a[j]);
            a[j] := a[i] - a[j];
            dec(a[i], a[j])
          end
  end;

function desc_digits(n: smallint): smallint;
  begin
    sort_digits(n);

    exit(a[0] * 1000 + a[1] * 100 + a[2] * 10 + a[3])
  end;

function kaprekar(n: smallint): qword;
  var
    i: shortint = 0;

  begin
    while n <> 6174 do
      begin
        inc(i);
        sort_digits(n);
        n := (a[0] - a[3]) * 999 + (a[1] - a[2]) * 90
      end;

    exit(i)
  end;

begin
  writeln('largest_digit(1234) -> ', largest_digit(1234));
  writeln('largest_digit(3253) -> ', largest_digit(3253));
  writeln('largest_digit(9800) -> ', largest_digit(9800));
  writeln('largest_digit(3333) -> ', largest_digit(3333));
  writeln('largest_digit(120) -> ', largest_digit(120));
  writeln;

  writeln('desc_digits(1234) -> ', desc_digits(1234));
  writeln('desc_digits(3253) -> ', desc_digits(3253));
  writeln('desc_digits(9800) -> ', desc_digits(9800));
  writeln('desc_digits(3333) -> ', desc_digits(3333));
  writeln('desc_digits(120) -> ', desc_digits(120));
  writeln;

  writeln('kaprekar(6589) -> ', kaprekar(6589));
  writeln('kaprekar(5455) -> ', kaprekar(5455));
  writeln('kaprekar(6174) -> ', kaprekar(6174))
end.
