(* Common library *)
unit clib;

interface

  uses math, strutils;

  type
    intar = array of int64;

  const
    factorial: array[1..20] of uint64 = (
      1,
      2,
      6,
      24,
      120,
      720,
      5040,
      40320,
      362880,
      3628800,
      39916800,
      479001600,
      6227020800,
      87178291200,
      1307674368000,
      20922789888000,
      355687428096000,
      6402373705728000,
      121645100408832000,
      2432902008176640000
    );
    fibonacci: array[1..93] of uint64 = (
      1,
      1,
      2,
      3,
      5,
      8,
      13,
      21,
      34,
      55,
      89,
      144,
      233,
      377,
      610,
      987,
      1597,
      2584,
      4181,
      6765,
      10946,
      17711,
      28657,
      46368,
      75025,
      121393,
      196418,
      317811,
      514229,
      832040,
      1346269,
      2178309,
      3524578,
      5702887,
      9227465,
      14930352,
      24157817,
      39088169,
      63245986,
      102334155,
      165580141,
      267914296,
      433494437,
      701408733,
      1134903170,
      1836311903,
      2971215073,
      4807526976,
      7778742049,
      12586269025,
      20365011074,
      32951280099,
      53316291173,
      86267571272,
      139583862445,
      225851433717,
      365435296162,
      591286729879,
      956722026041,
      1548008755920,
      2504730781961,
      4052739537881,
      6557470319842,
      10610209857723,
      17167680177565,
      27777890035288,
      44945570212853,
      72723460248141,
      117669030460994,
      190392490709135,
      308061521170129,
      498454011879264,
      806515533049393,
      1304969544928657,
      2111485077978050,
      3416454622906707,
      5527939700884757,
      8944394323791464,
      14472334024676221,
      23416728348467685,
      37889062373143906,
      61305790721611591,
      99194853094755497,
      160500643816367088,
      259695496911122585,
      420196140727489673,
      679891637638612258,
      1100087778366101931,
      1779979416004714189,
      2880067194370816120,
      4660046610375530309,
      7540113804746346429,
      12200160415121876738
    );

  function gcd(x, y: int64): int64;
  function isprime(x: int64): boolean;
  function issquare(x: int64): boolean;
  function ispalindrome(s: ansistring): boolean;
  function all(b: array of boolean): boolean;
  function addintstr(a, b: ansistring): ansistring;

  procedure qsort(var a : intar);
  function bsearch(
    a: intar;
    x: int64
  ): int64;
  function bisect_left(
    a: intar;
    x: int64
  ): int64;


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


  (* Translated from Python 3 math module *)
  function gcd(x, y: int64): int64;
    var z: int64;
    begin
      while y > 0 do
        begin
          z := y;
          y := x mod y;
          x := z
        end;
      gcd := x
    end;


  function isprime(x: int64): boolean;
    var i: int32;
    begin
      if x < 2 then
        exit(false);
      for i := 2 to trunc(sqrt(x)) do
        if x mod i = 0 then
          exit(false);
      isprime := true
    end;


  function issquare(x: int64): boolean;
    begin
      issquare := (x >= 0) and (sqr(trunc(sqrt(x))) = x)
    end;


  function ispalindrome(s: ansistring): boolean;
    var
      n, i: int32;
    begin
      n := length(s);
      for i := 1 to n div 2 do
        if s[i] <> s[n - i + 1] then
          exit(false);
        ispalindrome := true
    end;


  function all(b: array of boolean): boolean;
    var
      i: boolean;
    begin
      for i in b do
        if not i then
          exit(false);
      all := true
    end;


  function addintstr(a, b: ansistring): ansistring;
    var
      n: int64;
      remain: boolean = false;
      d: uint8;

    begin
      n := max(length(a), length(b)) + 1;
      a := addchar('0', a, n);
      b := addchar('0', b, n);
      repeat
        if remain then
          d := ord(a[n]) + ord(b[n]) - 47
        else
          d := ord(a[n]) + ord(b[n]) - 48;
        if d > 57 then
          begin
            dec(d, 10);
            remain := true
          end
        else
          remain := false;
        a[n] := chr(d);
        dec(n)
      until n = 0;
      addintstr := ifthen(ord(a[1]) = 48, copy(a, 2, length(a) - 1), a)
    end;


  function bsearch(
    a: intar;
    x: int64
  ): int64;

    var
      l, h, m: int64;

    begin
      l := 0;
      h := length(a) - 1;
      while l <= h do
        begin
          m := (l + h) div 2;
          if x = a[m] then
            exit(m)
          else if x < a[m] then
            h := m - 1
          else
            l := m + 1
        end;
      bsearch := -1
    end;


  (* Translated from Python 3 bisect module *)
  function bisect_left(
    a: intar;
    x: int64
  ): int64;

    var
      l, h, m: int64;

    begin
      l := 0;
      h := length(a);
      while l < h do
        begin
          m := (l + h) div 2;
          if a[m] < x then
            l := m + 1
          else
            h := m
        end;
      bisect_left := l
    end;

end.
