(* uuencoding *)

var
  fi, fo: text;
  s: string[3] = 'CnX';
  n: cardinal = 0;
  i: cardinal;
  j: byte;


function enc(s: string): string;
  var
    c1, c2, c3: byte;

  begin
    c1 := ord(s[1]);
    if length(s) < 2 then
      c2 := 0
    else
      c2 := ord(s[2]);
    if length(s) < 3 then
      c3 := 0
    else
      c3 := ord(s[3]);

    enc := chr(c1 div 4 + 32) 
           + chr(c1 mod 4 * 16 + c2 div 16 + 32)
           + chr(c2 mod 16 * 4 + c3 div 64 + 32)
           + chr(c3 mod 64 + 32)
  end;


begin
  assign(fi, '1enc.inp');
  assign(fo, '1enc.out');

  reset(fi);
  while not eof(fi) do
    begin
      read(fi, s[1]);
      inc(n)
    end;
  if n = 0 then
    writeln(fo, ' ');

  reset(fi);
  rewrite(fo);
  for i := 1 to n div 45 do
    begin
      write(fo, 'M');
      for j := 1 to 15 do
        begin
          read(fi, s);
          write(fo, enc(s))
        end;
      writeln(fo);
    end;

  n := n mod 45;
  if n > 0 then
    begin
      write(fo, chr(n + 32));
      for i := 1 to n div 3 do
        begin
          read(fi, s);
          write(fo, enc(s))
        end;
        if n mod 3 > 0 then
          begin
            read(fi, s);
            writeln(fo, enc(s))
          end
        else
          writeln(fo)
    end;

  close(fi);
  close(fo)
end.
