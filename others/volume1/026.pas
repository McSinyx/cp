const
  enum: array[0..2] of string = ('none', 'one', 'both');

var
  (* 1 ngày = 1440 phút *)
  a, b: array[0..1] of int16;
  m: array[0..2] of int16;
  i, j, dogs: int8;

begin
  read(a[0], b[0], a[1], b[1], m[0], m[1], m[2]);
  for i := 0 to 2 do
    begin
      dogs := 0;
      for j := 0 to 1 do
        if (m[i] - 1) mod (a[j] + b[j]) < a[j] then
          inc(dogs);
      writeln(enum[dogs])
    end
end.
