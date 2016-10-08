You are trapped at uninhabited island only with your laptop. Still you don't want your significant other to worry about you, so you are going to send a message in a bottle with your picture or at least a couple of words from you (sure, you could just write down the words, but that would be less fun). You're going to use uuencoding for that.

Uuencoding is a form of binary-to-text encoding, which uses only symbols from 32-95 diapason, which means all symbols used in the encoding are printable.

#Description of encoding

A uuencoded file starts with a header line of the form:

    begin <mode> <file><newline>

<mode> is the file's Unix file permissions as three octal digits (e.g. 644, 744). For Windows 644 is always used.

<file> is the file name to be used when recreating the binary data.

<newline> signifies a newline character, used to terminate each line.

Each data line uses the format:

    <length character><formatted characters><newline>

<length character> is a character indicating the number of data bytes which have been encoded on that line. This is an ASCII character determined by adding 32 to the actual byte count, with the sole exception of a grave accent "`" (ASCII code 96) signifying zero bytes. All data lines except the last (if the data was not divisible by 45), have 45 bytes of encoded data (60 characters after encoding). Therefore, the vast majority of length values is 'M', (32 + 45 = ASCII code 77 or "M").


<formatted characters> are encoded characters.

The mechanism of uuencoding repeats the following for every 3 bytes (if there are less than 3 bytes left, trailing 0 are added):

1. Start with 3 bytes from the source, 24 bits in total.

2. Split into 4 6-bit groupings, each representing a value in the range 0 to 63: bits (00-05), (06-11), (12-17) and (18-23).

3. Add 32 to each of the values. With the addition of 32 this means that the possible results can be between 32 (" " space) and 95 ("_" underline). 96 ("`" grave accent) as the "special character" is a logical extension of this range.

4. Output the ASCII equivalent of these numbers.


For example, we want to encode a word "Cat". ASCII values for C,a,t are 67,97,116, or  `010000110110000101110100` in binary. After dividing into four groups, we get 010000 110110 000101 110100, which is 16,54,5,52 in decimal. Adding 32 to this values and encoding back in ASCII, the final result is `0V%T`.

The file ends with two lines:

    `<newline>
    end<newline>

#Formal Inputs & Outputs

##Input

a byte array or string.

##Output

a string containing uuencoded input.

#Examples

Input: Cat

Output:
 
    begin 644 cat.txt
    #0V%T
    `
    end

Input:
I feel very strongly about you doing duty. Would you give me a little more documentation about your reading in French? I am glad you are happy — but I never believe much in happiness. I never believe in misery either. Those are things you see on the stage or the screen or the printed pages, they never really happen to you in life.


Output:

    begin 644 file.txt
    M22!F965L('9E<GD@<W1R;VYG;'D@86)O=70@>6]U(&1O:6YG(&1U='DN(%=O
    M=6QD('EO=2!G:79E(&UE(&$@;&ET=&QE(&UO<F4@9&]C=6UE;G1A=&EO;B!A
    M8F]U="!Y;W5R(')E861I;F<@:6X@1G)E;F-H/R!)(&%M(&=L860@>6]U(&%R
    M92!H87!P>2#B@)0@8G5T($D@;F5V97(@8F5L:65V92!M=6-H(&EN(&AA<'!I
    M;F5S<RX@22!N979E<B!B96QI979E(&EN(&UI<V5R>2!E:71H97(N(%1H;W-E
    M(&%R92!T:&EN9W,@>6]U('-E92!O;B!T:&4@<W1A9V4@;W(@=&AE('-C<F5E
    M;B!O<B!T:&4@<')I;G1E9"!P86=E<RP@=&AE>2!N979E<B!R96%L;'D@:&%P
    3<&5N('1O('EO=2!I;B!L:69E+C P
    `
    end

#Bonuses

##Bonus 1

Write uudecoder, which decodes uuencoded input back to a byte array or string

##Bonus 2

Write encoder for files as well.

##Bonus 3

Make encoding parallel.

#Further Reading

[Binary-to-text encoding](https://en.wikipedia.org/wiki/Binary-to-text_encoding) on Wikipedia.

#Finally

This challenge is posted by /u/EvgeniyZh

Also have a good challenge idea?

Consider submitting it to /r/dailyprogrammer_ideas
