type bigboo = [-1..1];

var
  f : text;
  n, i, j : byte;
  inp : array[0..100] of PointType;
  P, Q : PointType;
  P_out, Q_out : boolean;
  s : int64 = 0;

function stri2(A, B, C : PointType) : int64;
  begin
    stri2 := (C.y - A.y) * (A.x - B.x) - (C.x - A.x) * (A.y - B.y)
  end;

function outpoly(M : PointType) : int64;
  begin
    outpoly := s;
    for i := 0 to n - 1 do
      begin
        outpoly := outpoly - abs(stri2(M, inp[i], inp[i + 1]))
      end
  end;

function sign(x : smallint) : bigboo;
  begin
    case true of
      x > 0 : exit(1);
      x = 0 : exit(0);
      x < 0 : exit(-1)
    end
  end;

function intersect(A, B : PointType) : bigboo;
  var b00, b01 : bigboo;
  begin
    b00 := sign(stri2(P, Q, A));
    b01 := sign(stri2(P, Q, A));
    if b00 = b01 then
      if b00 = 0 then exit(0)
      else exit(-1);
    b00 := sign(stri2(A, B, P));
    b01 := sign(stri2(A, B, Q));
    if b00 = b01 then
      if b00 = 0 then exit(0)
      else exit(-1);
    exit(1)
  end;

function lensqr(A, B : PointType) : int64;
  begin
    exit()
  end;

procedure out(M, N : PointType);
  begin
    assign(f, 'DG.OUT');
    rewrite(f);
    write(f, trunc(sqrt(sqr(A.x - B.x) + sqr(A.y - B.y)) * 100));
    close(f);
    halt
  end;

begin
  assign(f, 'DG.INP');
  reset(f);
  readln(f, n);
  for i := 0 to n - 1 do
    readln(f, inp[i].x, inp[i].y);
  inp[n] := inp[0];
  readln(f, P.x, P.y, Q.x, Q.y);
  close(f);
  for i := 1 to n - 2 do
    s := s + abs(stri2(inp[0], inp[i], inp[i + 1]));
  if outpoly(P) = 0 then
    P_out := false;
  if outpoly(Q) = 0 then
    Q_out := false;
  if P_out and Q_out then
    for i := 0 to n - 1 do

  out(P, Q)
end.
