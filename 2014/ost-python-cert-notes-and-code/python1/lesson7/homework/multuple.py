#!/usr/local/bin/python3

#
# multuple.py
#
# by Zeb DeOs, August 2014
# for completion of O'Reilly School of Technology
# Lesson 7, Objective 1
#

"""Nicely print out the products of a series of factors.

   The factors are hard-coded; no factor is larger than 99 (and thus no
   product is larger than 9801).
"""

FACTORS = (
    (2, 7),
    (1, 9),
    (23, 98),
    (99, 2),
    (3, 8),
    (23, 87),
)

factor_width = 2
product_width = 4
format_string = "{{:{}}} = {{:{}}} x {{:{}}}".format(
    product_width, factor_width, factor_width)

for factor_a, factor_b in FACTORS:
    product = factor_a * factor_b
    print(format_string.format(product, factor_a, factor_b))
