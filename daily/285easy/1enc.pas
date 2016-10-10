(* uuencoding *)

var
  fi, fo: text;
  s: string[45] = '                                             ';
  n, i: shortint;
  c1, c2, c3: byte;

begin
  assign(fi, '1enc.inp');
  reset(fi);
  assign(fo, '1enc.out');
  rewrite(fo);

  repeat
    n := 0;
    while (n < 45) and not(eof(fi)) do
      begin
        inc(n);
        read(fi, s[n])
      end;
    write(fo, chr(n + 32));

    for i := 0 to n div 3 - 1 do
      begin
        c1 := ord(s[i * 3 + 1]);
        c2 := ord(s[i * 3 + 2]);
        c3 := ord(s[i * 3 + 3]);
        write(fo, chr(c1 div 4 + 32));
        write(fo, chr(c1 mod 4 * 16 + c2 div 16 + 32));
        write(fo, chr(c2 mod 16 * 4 + c3 div 64 + 32));
        write(fo, chr(c3 mod 64 + 32))
      end;

    if n mod 3 > 0 then
      begin
        c1 := ord(s[n div 3 * 3 + 1]);
        if n mod 3 = 2 then
          c2 := ord(s[n div 3 * 3 + 2])
        else
          c2 := 0;
        c3 := 0;
        write(fo, chr(c1 div 4 + 32));
        write(fo, chr(c1 mod 4 * 16 + c2 div 16 + 32));
        write(fo, chr(c2 mod 16 * 4 + c3 div 64 + 32));
        writeln(fo, chr(c3 mod 64 + 32))
      end
  until eof(fi);

  close(fi);
  close(fo)
end.
