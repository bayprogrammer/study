#!/usr/bin/env python

#
# example usage:
#
#   $ ./secure-container.py 347312 805915
#
# Completed by Zeb DeOs on TBD.
#

import sys

def inclusive_range(start, end):
    return range(start, end+1)

def num_valid_numbers(start, end):
    return len(find_valid_numbers(start, end))

def find_valid_numbers(start, end):
    return [ n for n in inclusive_range(start, end) if number_valid(n) ]

def number_valid(number):
    prev_digit = -1
    dup_found = False

    for digit in digits_of_number(number):
        dup_found = (prev_digit == digit) or dup_found

        if prev_digit > digit:
            return False

        prev_digit = digit

    return dup_found

def digits_of_number(number):
    for digit_string in str(number):
        yield int(digit_string)


if __name__ == '__main__':
    start, end = int(sys.argv[1]), int(sys.argv[2])

    total_n = len(inclusive_range(start, end))
    filtered_n = num_valid_numbers(start, end)

    print("In {}-{}: {} of {} meet the criteria.".format(start, end, filtered_n, total_n))
