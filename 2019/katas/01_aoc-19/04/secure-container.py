#!/usr/bin/env python

import sys


def num_valid_numbers(start, end):
    return len(find_valid_numbers(start, end))

def find_valid_numbers(start, end):
    return [ n for n in inclusive_range(start, end) if number_valid(n) ]

def inclusive_range(start, end):
    return range(start, end+1)

def number_valid(number):
    dup_found = False

    count = 0
    for curr, next in digits(number):
        count += 1

        if next is None or curr < next:
            if count == 2:
                dup_found = True
            count = 0
        elif curr > next:
            return False

    return dup_found

def digits(number):
    digits = [ int(d) for d in list(str(number)) ]
    length = len(digits)

    for curr_i in range(0, length):
        next_i = curr_i + 1

        if next_i < length:
            yield digits[curr_i], digits[next_i]
        else:
            yield digits[curr_i], None


#
# example usage:
#
#   $ ./secure-container.py 347312 805915
#
# Completed by Zeb DeOs on 7 Dec 2019.
#
if __name__ == '__main__':
    start, end = int(sys.argv[1]), int(sys.argv[2])

    total_n = len(inclusive_range(start, end))
    filtered_n = num_valid_numbers(start, end)

    #print(find_valid_numbers(start, end))

    print("In {}-{}, \033[1m{}\033[0m of {} meet the criteria.".format(start, end, filtered_n, total_n))
