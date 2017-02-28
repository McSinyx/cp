var
  h, w, v, lcm: int64;


function gcd(a, b: int64): int64;
  var
    c: int64;

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
  repeat
    readln(h, w, v);
    lcm := h * w div gcd(h, w);
    if lcm div h mod 2 = 0 then
      write('U')
    else
      write('L');
    if lcm div w mod 2 = 0 then
      write('L ')
    else
      write('R ');
    write(lcm div h + lcm div w - 2);
    writeln(' ', lcm div v)
  until eof(input)
end.
