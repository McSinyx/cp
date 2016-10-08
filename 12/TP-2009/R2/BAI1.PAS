uses math;

var
  f : text;
  n : longint;
  lena, i : integer;
  a : array[1..512] of longint;

procedure insort(x : longint);
  var i, j : integer;
  begin
    inc(lena);
    a[lena] := x - 1;
    for i := 1 to lena do
      if a[i] < x then begin
        for j := lena downto i + 1 do
          a[j] := a[j - 1];
        a[i] := x;
        exit
      end
  end;

function notin(x : longint) : boolean;
  var l, h, m : integer;
  begin
    l := 1;
    h := lena;
    repeat
      m := (l + h) div 2;
      if a[m] = x then exit(false);
      if a[m] < x then h := m - 1
      else l := m + 1
    until l > h;
    notin := true
  end;

procedure mklist(n0 : longint);
  var
    i, j : byte;
    n10, m0 : longint;
  begin
    if n0 <> 0 then begin
      insort(n0);
      for i := 0 to trunc(log10(n0)) do
        begin
          n10 := 1;
          for j := 1 to i do n10 := n10 * 10;
          m0 := n0 div (n10 * 10) + n0 mod n10;
          if notin(m0) then mklist(m0)
        end
    end
  end;

function prime(m : longint) : boolean;
  var p, q : integer;
  begin
    if m < 2 then exit(false);
    if m = 2 then exit(true);
    if m = 3 then exit(true);
    if m mod 2 = 0 then exit(false);
    if m mod 3 = 0 then exit(false);
    p := 5;
    q := 2;
    while p * p <= m do
      begin
        if m mod p = 0 then exit(false);
        p := p + q;
        q := 6 - q
      end;
    prime := true
  end;

begin
  assign(f, 'BAI1.INP');
  reset(f);
  read(f, n);
  close(f);
  lena := 0;
  mklist(n);
  assign(f, 'BAI1.OUT');
  rewrite(f);
  for i := 1 to lena do
    if prime(a[i]) then begin
      writeln(f, a[i]);
      close(f);
      exit
    end;
  writeln(f, -1);
  close(f)
end.
