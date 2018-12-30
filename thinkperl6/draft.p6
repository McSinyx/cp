#!/usr/bin/env perl6
# Exercise 2.2.1
sub sphere-volume(Numeric(Cool) $r) { 4/3 * π * $r³ }
#put sphere-volume('5');

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
sub is-power-of($a, $b) { { $_ == .Int }(log $a, $b) }

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

sub ducks { map * ~ 'ack' , flat('J'..'N', 'Ou', 'P', 'Qu') }
#put ducks;

sub count(Str $string, Str $substr, Int $index = 0, Int $result = 0) {
    my $i = index $string, $substr, $index;
    return $result unless defined $i;
    count $string, $substr, $i + 1, $result + 1
}
#put count 'banana', 'na';

sub bubble-sort(@seq is copy) {
    my $done;
    repeat {
        $done = True;
        for ^@seq.end -> $i {
            if @seq[$i] > @seq[$i+1] {
                @seq[$i, $i + 1] = @seq[$i + 1, $i];
                $done = False
            }
        }
    } until $done;
    @seq
}
#put bubble-sort <4 2 6 5 3 9 1>;

sub select-sort(@seq is copy) {
    for ^@seq.end -> $i {
        for $i..@seq.end -> $j {
            @seq[$i, $j] = @seq[$j, $i] if @seq[$i] > @seq[$j]
        }
    }
    @seq
}
#put select-sort <4 2 6 5 3 9 1>;

sub insert-sort(@seq is copy) {
    for 1..@seq.end -> $i {
        loop (my $j = $i; $j and @seq[$j] < @seq[$j - 1]; $j--) {
            @seq[$j, $j - 1] = @seq[$j - 1, $j]
        }
    }
    @seq
}
#put insert-sort <4 2 6 5 3 9 1>;

# Some simple regexes
#put $/ if "π ≈ $(π)" ~~ /\d**10/;
#put $/ if '1234567890' ~~ /^ <[0..7]>+ $/;
#put $/ if ' Hello, World!' ~~ /\w+/;
#put $/ if 'qaz asdf zxcv' ~~ /<< a \w*/;
#put $/ if 'hmmm ooer' ~~ /<< <[aeiou]> \w*/;
#put $/ if '0621323 0612345678- 0701234567' ~~ /<< 0 <[67]> \d**8 >>/;
#put $/ if 'hMmM OoEr' ~~ /:i << <[aeiou]> \w*/;
#put $/ if 'hmmm ooer' ~~ /(\w)$0/;
#put $1 if 'hmmm ooer' ~~ /(\w) $0 .* ((\w) $0)/;

sub YYYY-MM-DD(Str $string) {
    "$0-$1-$2" if $string ~~ /<< (\d\d\d\d) \- (\d\d) \- (\d\d) >>
    <?{0 < $1 < 13 && $2 && ($1 - 2 && $2 < 31 + ($1 - 1)%7%%2 ||
                             $2 < 29 + $0%%400 + ($0%100)*($0%%4))}>/
}
#put YYYY-MM-DD '986-05-19-1700-02-29-1234-11-31-01-10-2000-02-29';

# Exercise 7.3
sub rotate-ascii(Str $string, Int $rotation) {
    $string.comb.map({ m/<[A..Z]>/ && chr(65 + ($/.ord + $rotation - 65)%26) ||
                       m/<[a..z]>/ && chr(97 + ($/.ord + $rotation - 97)%26) ||
                       $_ }).join
}
#put rotate-ascii 'cheer', 7;
#put rotate-ascii 'melon', -10;
#put rotate-ascii 'HAL', 1;

# Exercise 8.1
#.put if .chars > 20 for '/usr/share/dict/words'.IO.lines;

# Exercise 8.2
sub words(&predicate) { '/usr/share/dict/words'.IO.lines.grep(&predicate) }
#.put for words({ not /<[Ee]>/ });

# Exercise 8.3
multi avoids(@letters, @forbidden) { ($_ ∉ @letters for @forbidden).all }
multi avoids(Str $word, Str $forbidden) { avoids $word.comb, $forbidden.comb }
sub least-forbidden(Int $n) {
    my %avoids = [$_ => {} for 'a'..'z'];
    for '/usr/share/dict/words'.IO.lines.map(~*.lc).unique -> $word {
        %avoids{$_}{$word} = True unless defined index $word, $_ for 'a'..'z';
    }

    # Despacito (baby take it slow so we can last long)
    [([∩] %avoids{$_}).elems => $_ for combinations('a'..'z', $n)].max.value
}
# Unless run on a supercomputer, there ain't no way
# one has the patience to wait for it to finish.
#say least-forbidden 5;

# Exercise 8.4
#.put for words { m:i/^ <[acefhlo]>+ $/ };

# Exercise 8.5
my @uses-all = <a e i o u y>;
#.put for words { (defined index $^word, $_ for @uses-all).all };

# Exercise 8.6
sub is-abcdedarian(Str $word) { [lt] $word.lc.comb }
#.put for words &is-abcdedarian;

# Exercise 8.7
#.put for words { m/(.) $0 (.) $1 (.) $2/ };

# Exercise 8.8
#.put if [.substr(2), substr($_ + 1, 1), substr($_ + 2, 1, 4), ~($_ + 4)]
#        .map(&is-palindrome).all for 100_000..999_996;

# Exercise 8.9
sub age-reversible(Int $times) {
    for '10'..'90' -> $car {
        my $diff = $car - $car.flip;
        my @reversible = grep { .flip == $_ - $diff }, $car..'99';
        return @reversible if @reversible == $times
    }
}
#put age-reversible(8)[*-3].flip;

# Exercise 9.1
multi nested-sum(Numeric $number) { $number }
multi nested-sum(@array) { @array.map(&nested-sum).sum }
#put nested-sum [1, 2, [3, 4], [5, [6, 7]], [[8], [9, [10]]]];

# Exercise 9.2
#put [\+] 1..4;

# Exercise 9.5
#put [≤] (1, 2, 2);
#put [≤] (1, 2, 1);

# Exercise 9.6
sub is-anagram(Str $this, Str $that) { $this.comb.sort ~~ $that.comb.sort }
#put is-anagram 'this', 'shit';

# Exercise 9.7
sub has-duplicates(@array) { @array.unique != @array }
#put has-duplicates <o o e r>;

# Exercise 9.8
sub birthday-paradox(Int $n, Int $T) {
    sum(map { has-duplicates map { Int(rand * 365.25) }, ^$n }, ^$T) / $T
}
#put birthday-paradox 23, 10000;

# Exercise 9.10
sub bisect(@a, $x, Int $low = 0, Int $high = @a.elems) {
    return unless $low < $high;
    my $mid = ($low + $high) div 2;
    my $cmp = @a[$mid] cmp $x;
    return $mid unless $cmp;
    $cmp ~~ More ?? bisect @a, $x, $low, $mid !! bisect @a, $x, $mid+1, $high
}

# Exercise 9.11
#my @words = '/usr/share/dict/words'.IO.lines;
#put "$_ $(.flip)" if /^(.)$0*$/ ^ defined bisect @words, .flip for @words;

# Exercise 9.12
sub interlock(Str $word, @words) {
    my ($evens, $odds);
    for $word.comb -> $even, $odd = '' {
        $evens ~= $even;
        $odds ~= $odd
    }
    bisect(@words, $evens).defined && bisect(@words, $odds).defined
}
#my @words = '/usr/share/dict/words'.IO.lines;
#.put for @words.grep:{ interlock($_, @words) };

# Exercise 10.3
sub hash-duplicates(@array) {
    my %hash;
    for @array {
        return True if %hash{$_};
        %hash{$_} = True
    }
    False
}
#put hash-duplicates <o o e r>;

# Exercise 10.4
sub rotations {
    my %words = '/usr/share/dict/words'.IO.lines.grep(/^ <[a..z]>+ $/).Set;
    my @result;
    for %words.keys -> $word {
        next unless %words{$word};
        (%words{$word}, $_) = False, $word;
        my $virgin = True;
        loop (tr/a..z/b..za/; $_ cmp $word; tr/a..z/b..za/) {
            next unless %words{$_};
            %words{$_} = False;
            if $virgin {
                $virgin = False;
                @result.push([$word, $_])
            } else {
                @result[*-1].push($_)
            }
        }
    }
    @result
}
#.put for rotations;
