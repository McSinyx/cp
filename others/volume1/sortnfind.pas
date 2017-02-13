unit sortnfind;

interface

  type
    intar = array of int64;

  procedure qsort(var a : intar);

  function binin(
    a: intar;
    x: int64
  ): boolean;

implementation

  procedure qsort(var a : intar);
    procedure sort(l, r: int64);
      var
        i, j, x, y: int64;

      begin
        i := l;
        j := r;
        x := a[(l + r) div 2];

        repeat
          while a[i] < x do
            i := i + 1;
          while x < a[j] do
            j := j - 1;

          if i <= j then
            begin
              y := a[i];
              a[i] := a[j];
              a[j] := y;
              i := i + 1;
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
    x: int64
  ): boolean;

    var
      l, h, mid: uint64;

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