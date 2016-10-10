(* uudecoding *)

var
  fi, fo: text;
  n, m, i, j: byte;
  s: string[4];
  a: array[1 .. 4] of byte;

begin
  assign(fi, '1dec.inp');
  reset(fi);
  assign(fo, '1dec.out');
  rewrite(fo);

  repeat
    read(fi, s[1]);
    n := ord(s[1]) - 32;
    if n mod 3 > 0 then
      n := n div 3 + 1
    else
      n := n div 3;

    for i := 1 to n do
      begin
        read(fi, s);
        for j := 1 to 4 do
          a[j] := ord(s[j]) - 32;

        m := a[1] * 4 + a[2] div 16;
        if m = 0 then
          break;
        write(fo, chr(m));

        m := a[2] mod 16 * 16 + a[3] div 4;
        if m = 0 then
          break;
        write(fo, chr(m));

        m := a[3] mod 4 * 64 + a[4];
        if m = 0 then
          break;
        write(fo, chr(m));
      end;

    readln(fi)
  until eof(fi);

  close(fi);
  close(fo)
end.
