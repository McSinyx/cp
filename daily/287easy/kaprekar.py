#!/usr/bin/env python3

def largest_digit(n):
    return int(max(str(n)))


def desc_digits(n):
    return int(''.join(sorted('{:04}'.format(n), reverse=True)))


def asc_digits(n):
    return int(''.join(sorted('{:04}'.format(n))))


def kaprekar(n):
    i = 0

    while n != 6174:
        n = desc_digits(n) - asc_digits(n)
        i += 1

    return i


if __name__ == '__main__':
    print('largest_digit(1234) -> {}'.format(largest_digit(1234)))
    print('largest_digit(3253) -> {}'.format(largest_digit(3253)))
    print('largest_digit(9800) -> {}'.format(largest_digit(9800)))
    print('largest_digit(3333) -> {}'.format(largest_digit(3333)))
    print('largest_digit(120) -> {}\n'.format(largest_digit(120)))

    print('desc_digits(1234) -> {}'.format(desc_digits(1234)))
    print('desc_digits(3253) -> {}'.format(desc_digits(3253)))
    print('desc_digits(9800) -> {}'.format(desc_digits(9800)))
    print('desc_digits(3333) -> {}'.format(desc_digits(3333)))
    print('desc_digits(120) -> {}\n'.format(desc_digits(120)))

    print('kaprekar(6589) -> {}'.format(kaprekar(6589)))
    print('kaprekar(5455) -> {}'.format(kaprekar(5455)))
    print('kaprekar(6174) -> {}'.format(kaprekar(6174)))
