uses math;

type
  gift_t = record
    filename: string;
    m, n, a, b, c: byte
  end;
  piece_t = array[1..3, 1..3] of boolean;
  board_t = array[1..15, 1..30] of byte;

const
  gifts: array[1..5] of gift_t = (
    (filename: 'XEPHINH1.TXT'; m: 6; n: 5; a: 4; b: 2; c: 2),
    (filename: 'XEPHINH2.TXT'; m: 8; n: 12; a: 8; b: 18; c: 0),
    (filename: 'XEPHINH3.TXT'; m: 7; n: 13; a: 12; b: 5; c: 7),
    (filename: 'XEPHINH4.TXT'; m: 3; n: 10; a: 4; b: 2; c: 2),
    (filename: 'XEPHINH5.TXT'; m: 15; n: 6; a: 0; b: 10; c: 10)
  );
  pieces: array[1..3] of piece_t = (
    ((false, true, false), (false, true, false), (false, true, false)),
    ((false, true, true), (false, true, false), (false, true, false)),
    ((false, true, true), (false, true, false), (false, true, true))
  );

var
  f: text;
  i, m, n, a, b, c: byte;
  init_board: board_t;
  done: boolean;


function divide(dividend, divisor: smallint): smallint;
  begin
    if dividend mod divisor = 0 then
      exit(dividend div divisor);
    divide := dividend div divisor + 1
  end;


function modulo(dividend, divisor: smallint): smallint;
  begin
    if dividend mod divisor = 0 then
      exit(divisor);
    modulo := dividend mod divisor
  end;


function rotate(
  piece: piece_t;
  quarter: byte
): piece_t;

  var
    i, j: byte;

  begin
    if quarter = 0 then
      exit(piece);
    for i := 1 to 3 do
      for j := 1 to 3 do
        rotate[i][j] := piece[j][4 - i];
    exit(rotate(rotate, pred(quarter)))
  end;


function flip(piece: piece_t): piece_t;
  var
    i, j: byte;

  begin
    for i := 1 to 3 do
      for j := 1 to 3 do
        flip[i][j] := piece[4 - i][j]
  end;


function putable(
  board: board_t;
  y, x: byte;
  piece: piece_t
): boolean;

  var
    yoff, xoff, i, j: byte;

  begin
    if not piece[1][1] then
      if piece[1][2] then
        begin
          yoff := 1;
          xoff := 2
        end
      else
        begin
          yoff := 2;
          xoff := 1
        end
    else
      begin
        yoff := 1;
        xoff := 1
      end;

    for i := 1 to 3 do
      for j := 1 to 3 do
        if not piece[i][j] then
          continue
        else if not inrange(y + i - yoff, 1, m) or
                not inrange(x + j - xoff, 1, n) or
                (board[y + i - yoff][x + j - xoff] > 0) then
          exit(false);
    putable := true
  end;


function put(
  board: board_t;
  y, x: byte;
  piece: piece_t;
  no: byte
): board_t;

  var
    yoff, xoff, i, j: byte;

  begin
    if not piece[1][1] then
      if piece[1][2] then
        begin
          yoff := 1;
          xoff := 2
        end
      else
        begin
          yoff := 2;
          xoff := 1
        end
    else
      begin
        yoff := 1;
        xoff := 1
      end;

    for i := 1 to 3 do
      for j := 1 to 3 do
        if piece[i][j] then
           board[y + i - yoff][x + j - xoff] := no;
    exit(board)
  end;


procedure solve(
  board: board_t;
  position: smallint;
  no: byte
);

  var
    y, x: smallint;
    i: byte;

  begin
    if done then
      exit;
    while (board[divide(position, n)][modulo(position, n)] > 0) and
          (position <= m * n) do
      inc(position);
    if position > m * n then
      begin
        for y := 1 to m do
          begin
            for x := 1 to n - 1 do
              write(f, board[y][x], ' ');
            writeln(f, board[y][n])
          end;
        done := true;
        exit
      end;

    y := divide(position, n);
    x := modulo(position, n);
    for i := 0 to 1 do
      if (a > 0) and
         putable(board, y, x, rotate(pieces[1], i)) then
        begin
          dec(a);
          solve(put(board, y, x, rotate(pieces[1], i), no), position, no + 1);
          inc(a)
        end;
    for i := 0 to 3 do
      if (b > 0) and
         putable(board, y, x, rotate(pieces[2], i)) then
        begin
          dec(b);
          solve(put(board, y, x, rotate(pieces[2], i), no), position, no + 1);
          inc(b)
        end;
    for i := 1 to 3 do
      if (b > 0) and
         putable(board, y, x, rotate(flip(pieces[2]), i)) then
        begin
          dec(b);
          solve(put(board, y, x, rotate(flip(pieces[2]), i), no), position, no + 1);
          inc(b)
        end;
    for i := 0 to 3 do
      if (c > 0) and
         putable(board, y, x, rotate(pieces[3], i)) then
        begin
          dec(c);
          solve(put(board, y, x, rotate(pieces[3], i), no), position, no + 1);
          inc(c)
        end;
  end;


begin
  for i := 1 to 5 do
    begin
      assign(f, gifts[i].filename);
      rewrite(f);
      m := gifts[i].m;
      n := gifts[i].n;
      for a := 1 to m do
        for b := 1 to n do
          init_board[a][b] := 0;
      a := gifts[i].a;
      b := gifts[i].b;
      c := gifts[i].c;
      done := false;
      solve(init_board, 1, 1);
      close(f)
    end;

  assign(f, 'XEPHINH4.TXT');
  reset(f);
  for m := 1 to 3 do
    for n := 1 to 10 do
      read(f, init_board[m][n]);
  close(f);
  assign(f, 'XEPHINH4.TXT');
  rewrite(f);
  for a := 0 to 4 do
    for m := 1 to 3 do
      begin
        for n := 1 to 9 do
          write(f, init_board[m][n] + a * 8, ' ');
        writeln(f, init_board[m][10] + a * 8)
      end;
  close(f);

  assign(f, 'XEPHINH5.TXT');
  reset(f);
  for m := 1 to 15 do
    for n := 1 to 6 do
      read(f, init_board[m][n]);
  close(f);
  assign(f, 'XEPHINH5.TXT');
  rewrite(f);
  for m := 1 to 15 do
    begin
      for a := 0 to 3 do
        for n := 1 to 6 do
          write(f, init_board[m][n] + a * 20, ' ');
      for n := 1 to 5 do
        write(f, init_board[m][n] + 80, ' ');
      writeln(f, init_board[m][6] + 80);
    end;
  close(f);
end.
