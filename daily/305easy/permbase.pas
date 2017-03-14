uses math, strutils, sysutils;

var
  inv: string;
  b: byte;
  n: string;


function permbase(
  base: byte;
  index: longint
): string;

  var
    i: byte = 1;

  begin
    while base ** i <= index do
      begin
        index := index - base ** i;
        inc(i)
      end;
    permbase := dec2numb(index, i, base)
  end;


function invpermbase(
  base: byte;
  value: string
): longint;

  begin
    invpermbase := (base ** length(value) - base) div (base - 1) +
                   numb2dec(value, base)
  end;

begin
  (*
   * Input format:
   * <invert?>
   * <base> <value>
   *)
  readln(inv);
  readln(b, n);
  n := delspace(n);
  if strtobool(inv) then
    writeln(invpermbase(b, n))
  else
    writeln(permbase(b, strtoint(n)))
end.
