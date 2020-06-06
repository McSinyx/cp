unit sortnfind;

interface

  type
    intar = array of smallint;

  procedure qsort(var a : intar);

  function binin(
    a: intar;
    x: smallint
  ): boolean;

implementation

  procedure qsort(var a : intar);

    procedure sort(l, r: longint);
      var
        i, j, x, y: longint;

      begin
        i := l;
        j := r;
        x := a[(l + r) div 2];

        repeat
          while a[i] < x do
            inc(i);

          while x < a[j] do
            dec(j);

          if i <= j then
            begin
              y := a[i];
              a[i] := a[j];
              a[j] := y;
              inc(i);
              j := j - 1
            end
        until i > j;

        if l < j then
          sort(l, j);

        if i < r then
          sort(i, r)
      end;

    begin
       sort(0, length(a) - 1)
    end;


  function binin(
    a: intar;
    x: smallint
  ): boolean;

    var
      l, h, mid: word;

    begin
      l := 0;
      h := length(a) - 1;

      while l <= h do
        begin
          mid := (l + h) div 2;
          if x = a[mid] then
            exit(true)
          else if x < a[mid] then
            h := mid - 1
          else
            l := mid + 1
        end;

      binin := false
    end;

end.
