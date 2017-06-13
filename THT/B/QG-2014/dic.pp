unit dic;
interface
  function count_char(c: char): longint;
  function get_char_at_pos(x: longint): char;
  procedure answer(s: string);

implementation
var
  secret_word: string;
  words: array [1..1000000] of string;
  total_cost, n: longint;

procedure answer(s: string);
begin
  if s = secret_word then
  begin
    writeln('Chuc mung ban da tim ra dap an chinh xac la "', s, '"');
    writeln('Chi phi ban da su dung la ', total_cost);
  end
  else
  begin
    writeln('Dap an ban dua ra la "', s, '"');
    writeln('Dap an chinh xac la "', secret_word, '"');
  end;
  halt;
end;

procedure cost_limit_exceed;
begin
  writeln('Chi phi ban da su dung vuot qua chi phi toi da cho phep');
  halt;
end;

function count_char(c: char): longint;
var
  i, res: longint;
begin
  total_cost := total_cost + 1;
  if (total_cost > 1000) then
    cost_limit_exceed;
  res := 0;
  for i := 1 to length(secret_word) do
    if secret_word[i] = c then
      inc(res);
  exit(res);
end;

function get_char_at_pos(x: longint): char;
begin
  total_cost := total_cost + 10;
  if (total_cost > 1000) then
    cost_limit_exceed;
  if (x < 1) or (x > length(secret_word)) then
    exit('#');
  exit(secret_word[x]);
end;

procedure check_secret_word;
var
  f: text;
  i: longint;
  ok: boolean;
begin
  assign(f, 'dic.dat');
  reset(f);
  while not seekeof(f) do
  begin
    inc(n);
    readln(f, words[n]);
  end;
  close(f);
  ok := false;
  for i := 1 to n do
    if words[i] = secret_word then ok := true;
  if not ok then
  begin
    writeln('Du lieu duoc khoi tao khong chinh xac. Dap an can tim khong nam trong tu dien');
    halt;
  end;
end;

procedure init;
begin
  writeln;
  writeln('     TU DIEN     ');
  writeln('*****************');
  writeln;

  secret_word := 'cat';
  total_cost := 0;
  check_secret_word;
end;

initialization
  init;
end.
