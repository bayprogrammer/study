#!/usr/local/bin/python3

# Code from O'Reilly School of Technology Course:
#   Python 1: Beginning Python
#     Lesson 7: String Formatting
# Entered as per the lesson text instructions.

# From the lesson text:
#   Copyright © 1998-2014 O'Reilly Media, Inc.
#   This work is licensed under a Creative Commons
#   Attribution-ShareAlike 3.0 Unported License.
#   See http://creativecommons.org/licenses/by-sa/3.0/legalcode for more
#   information. 

"""Produce a listing of people's names, ages, and weights."""
data = [
        ("Steve", 59, 202),
        ("Dorothy", 49, 156),
        ("Simon", 39, 155),
        ("David", 61, 135)]
for name, age, weight in data:
    print("{0:.<30s} {1:4d} {2:4d}".format(name, age, weight))

