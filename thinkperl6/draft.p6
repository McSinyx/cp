#!/usr/bin/env perl6
# Exercise 2.2.1
sub sphere-volume($r) { 4/3 * π * $r³ }

# Exercise 3.1
# Notice the operator precedence
sub rjust(Str $str, Int $width = 70) { ' ' x $width - $str.chars ~ $str }
#put rjust("Larry Wall", 80);

# Exercise 3.2
sub print-twice($str) {
    put $str;
    put $str
}
sub do-twice(&code, $arg) {
    code $arg;
    code $arg
}
#do-twice(&print-twice, "What's up doc");
sub do-four(&code, $arg) { do-twice { do-twice &code, $_ }, $arg }

# Exercise 3.3
sub grid(Int $rows=2, Int $cols=2, Int $side=4) {
    (('+' for 0..$cols).join((' ' for 0..$side).join('-'))~"\n" for 0..$rows)
    .join((('|' for 0..$cols).join(' ' x $side*2 + 1)~"\n") x $side)
}
#print grid(4, 4);

# Exercise 4.2
sub check-fermat(Int $a, Int $b, Int $c, Int $n) {
    return if $n <= 2;
    if $a**$n + $b**$n == $c**$n {
        put "Holy smokes, Fermat was wrong!"
    } else {
        put "No, that doesn't work."
    }
}

# Exercise 4.3
sub is-triangle($a, $b, $c) { ([-] reverse sort $a, $b, $c) < 0 }

# Exercise 4.4
sub fibonacci(Int $n, Int $a = 0, Int $b = 1) {
    return $a if $n <= 0; #put $a;
    fibonacci $n - 1, $b, $a + $b
}
#put fibonacci 20;

sub hypotenuse($a, $o) { sqrt $a² + $o² }
#put hypotenuse 3, 4;

# Exercise 5.2
multi ack(0, Int $n) { $n + 1 }
multi ack(Int $m where * > 0, 0) { ack $m - 1, 1 }
multi ack(Int $m where * > 0, Int $n where * > 0) {
    ack $m - 1, ack($m, $n - 1)
}
#put ack 3, 4;

# Exercise 5.3
sub is-palindrome(Str $str) { $str eq $str.flip }

# Exercise 5.4
sub is-power-of($a, $b) { { $_ == $_.Int }(log $a, $b) }

# Exercise 5.5: gcd is a built-in operator

# Exercise 6.1
sub my-sqrt($a, $epsilon = 0.000_000_1, $x = $a) {
    return $x if abs $x² - $a < $epsilon;
    my-sqrt $a, $epsilon, ($x + $a/$x) / 2
}

# Exercise 6.2
sub factorial(Int $n) { [*] 1..$n }
sub estimate-pi {
    my $factor = 2 * 2.sqrt / 9801;
    sub Srinivasa-Ramanujan($k = 1, $current = 1103, $result = 1103) {
        my $next = factorial($k * 4) * (1103 + $k*26390)
                   / factorial($k)⁴ / 396**($k*4);
        return $result + $next if $factor * $next < 10**-15;
        Srinivasa-Ramanujan $k + 1, $next, $result + $next;
    }
    1 / $factor / Srinivasa-Ramanujan
}
#put abs estimate-pi() - pi;
