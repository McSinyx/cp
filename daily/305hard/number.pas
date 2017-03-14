var
  a: array[0..15] of byte;


function factorial(n: byte): int64;
  begin
    if n < 2 then
      exit(1);
    factorial := factorial(pred(n)) * n
  end;


function number(
  a: array of byte;
  depth: byte
): int64;

  var
    i, sum: byte;
    b: array[0..9] of byte;

  begin
    if depth = 15 then
      begin
        sum := 0;
        for i := 1 to 15 do
          inc(sum, a[i]);
        if sum <> 69 then
          exit(0);
        number := 1307674368000; (* factorial(15) *)
        for i := 0 to 9 do
          b[i] := 0;
        for i := 1 to 15 do
          inc(b[a[i]]);
        for i := 0 to 9 do
          number := number div factorial(b[i]);
        exit
      end;

    number := 0;
    i := a[depth];
    inc(depth);
    repeat
      a[depth] := i;
      number := number + number(a, depth);
      inc(i)
    until i = 10
  end;


begin
  a[0] := 0;
  writeln(number(a, 0))
end.
