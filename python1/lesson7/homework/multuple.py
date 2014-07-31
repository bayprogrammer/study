#!/usr/local/bin/python3

#
# multuple.py
#

"""TODO: Document
"""

data = (
    (2, 7),
    (1, 9),
    (23, 98),
    (99, 2),
    (3, 8),
    (23, 87),
)

# We assume no factor is larger than 99; 99 * 99 == 9801, thus:
factor_width = 2   # factor never wider than 2 chars
product_width = 4  # product never wider than 4 chars

for x, y in data:
    z = x * y
    # TODO: Properly format
    print("{} = {} x {}".format(z, x, y))
