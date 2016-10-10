# [[2016-09-26] Challenge #285 [Easy] Cross Platform/Language Data Encoding part 1](https://www.reddit.com/r/dailyprogrammer/comments/54lu54/20160926_challenge_285_easy_cross/)

We will make a binary byte oriented encoding of data that is self describing
and extensible, and aims to solve the following problems:

* Portability between 32 and 64 (and any other) bit systems, and languages, and
  endian-ness.
* Type system independent of underlying language.
* Allow heterogeneous arrays (differing types of array elements) where the
  underlying language has poor support for them.
* Leverage power of homogeneous arrays in a language.
* Support records regardless of underlying language (array of records is
  homogeneous, even though a record is a heterogeneous list of fields)
* Allow ragged arrays (a table where each row is a list, but the rows do not
  have a uniform size (or shape))
* Provide basic in memory compression. Allow deferred decoding of partial
  data.

## 1. base64 encoding (used in later challenges)

To read and write binary data on reddit, we will use
[base64 encoding](279easy.md).

## 2. Extendible byte base.

Any size integer can be coded into a variable byte array by using the maximum
byte value as a marker to add the next byte value to decode the total.

This is useful for coding numbers that you think can be limited to around 255
or close to it, without being "hard constrained" by that limit. "256 possible
op codes (or characters) ought to be enough for everyone forever thinking"

**Unsigned byte input**

    12
    255
    256
    510
    512 44 1024

Last input is a list of 3 integers to encode

**Sample outputs**

    12
    255 0
    255 1
    255 255 0
    255 255 2 44 255 255 255 255 4

Every element that is not 255 marks the end of "that integer" in a list. You
should also write a decoder that transforms output into input.


## 3. Multibyte and variable byte encodings

Instead of a single byte target encoding, 2,4,8 and variable defined byte sizes
are also desirable to cover integers with larger ranges. An account balance
might have a 40 bit practical limit, but you might not guarantee it forever.
64 bits might not be enough for Zimbabwe currency balances for example.

For compressing a list of numbers, often it is useful to set the whole list to
one "byte size". Other choices include,

* Setting an enum/table of possible byte size codings of 1 2 4 8 sizes, and
  then encoding, the number of elements, the table/enum size and definition,
  and then 2 lists (enum key, data items)
* Interleave bytesize, data

The latter will often be longer for long lists, but does not encode the table
so is simpler to encode/decode.

### Encoding format for table definition:

1. 4 bytes: first 30 bits - length of list. Last 2 bits: key into 1 2 4 8. If
   first 30 bits are max value, then following 4 bytes are added to count until
   a non-max value is taken. Similar to challenge #2.
2. List of byte lengths defined by key in 1. If last 2 bits of 1 are 3
   (signifies up to 8 distinct integer sizes), then this list has 8 items. If
   there only 6 distinct integer size codings, then the last 2 items in this
   list would be ignored and set to 0. Values over 255 are encoded as in
   challenge 2.
3. List of ordered data encodings in boolean form, if there are more than 1. 1
   bit for 2, 2 bits for 4, 3 bits for 8.
4. List of data elements.

### Challenges

Encode list of integers from 0 to 1025 using 8 or 16 bit variable encoding.
With the shortest encoding that will contain the number. Just print the sum of
all the bytes as result for output brevity.

### Solution

1. First 4 bytes are (1025 * 4) + 1 (leading 0 bytes for smaller than "full
   size" numbers)
2. 2 byte list: 1 2
3. 0 for first 256 bits, 1 for remaining bits (total 1032 bits long with
   padding)
4. 256 + (769 * 2) bytes long encoding of the numbers.


# 4. Balanced signed numbers

Some numbers are negative. The common computer encoding for signed number
ranges is to subtract half the max power of 2 from the value. A signed byte has
range -128 to 127, where a 0 value corresponds to -128 (in our encoding).

For numbers outside this range encoded in a single byte, the process is to take
the first byte to determine the sign, and then following bytes add or subtract
up to 255 per byte until a non 255 value is reached.

# 5. Unbalanced signed numbers

Instead of the midpoint marking 0, a byte can encode a value within any defined
range. Another important application is to use "negative" numbers as codes of
some sort. These include:

* An expectation that negative numbers are less frequent and smaller relative
  to 0
* Coding special values such as null, infinity, undeterminable (0/0)
* Using codes to hint at extended byte encodings and sign of the number, or
  even data type


**Sample 0 index codes** (for 16 reserved codes) (new paragraph for multiline
explained codes)

    Null
    Infinity
    Negative Infinity
    Negative 1 byte
    Negative 2 bytes
    Negative 4 bytes
    Negative 8 bytes
    Negative custom byte length (value is encoded into 2 numbers. First is byte length (in 255 terminated bytes, followed by that number of bytes to represent the number)

    Positive 1 byte (first number indicates range of 468 to 723). 467 could have been encoded as 255 254 without this special code.

    Positive 2 byte
    Positive 4 byte
    Positive 8 byte
    Positive 16 byte
    Positive 64 byte
    Positive custom byte length (3 to 262 excluding other defined lengths)
    Positive custom 2 byte length (16 bit unsigned number defines byte length of number, followed by encoded number)

**Sample inputs**

    10
    123123
    -55
    Null

**Sample output**

    26
    9 123123
    3 54 (minimum range value is -1)
    0

**Challenge input**

    192387198237192837192837192387123817239182737 _44 981237123

Array of 3 numbers (_44 is -44) to be encoded
