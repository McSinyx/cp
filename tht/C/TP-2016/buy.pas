(* File name are supposed to be in upper case, but lower case names look more *mordern*.
 * `buy.pas' run first, read input from `buy.inp', write to `buy.out'
 * `set.pas' run next, read from `set.inp', write to `set.out'
 * `play.pas' run last, read from `map.inp', write to `decision.out'
 * (LMAO dunno how to sort files in Gist)
 *)

var
  f : text;
  a : array[1..10] of qword;
  idx : array[1..10] of shortint = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  out : array[1..10] of shortint = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  i, j, smalltmp : shortint;
  bigtmp : qword;

begin
  assign(f, 'buy.inp');
  reset(f);
  for i := 1 to 10 do
    read(f, a[i]);
  close(f);
  for i := 1 to 9 do
    for j := i + 1 to 10 do
      if a[i] > a[j] then {should use `>=' cuz the later tanks are usually better}
        begin
          smalltmp := idx[i];
          idx[i] := idx[j];
          idx[j] := smalltmp;
          bigtmp := a[i];
          a[i] := a[j];
          a[j] := bigtmp
        end;
  bigtmp := 100;
  for i := 1 to 8 do {capable of buying 10, but dat gon' make `set.pas' complicated}
    if a[i] > bigtmp then
      break
    else
      begin
        dec(bigtmp, a[i]);
        out[idx[i]] := 1
      end;
  assign(f, 'buy.out');
  rewrite(f);
  for i := 1 to 10 do
    writeln(f, out[i]);
  close(f)
end.