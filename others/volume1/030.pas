var
  s: ansistring;

function ispalindrome(s: ansistring): boolean;
  var
    n, i: int32;
  begin
    n := length(s);
    for i := 1 to n do
      if s[i] <> s[n - i + 1] then
        exit(false);
      ispalindrome := true
  end;

begin
  readln(s);
  if ispalindrome(s) then
    writeln('YES')
  else
    writeln('NO')
end.
