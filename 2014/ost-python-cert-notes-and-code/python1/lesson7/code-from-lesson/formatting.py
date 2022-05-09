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

"""Accept format strings from the user and format fixed data."""

i = 42
r = 31.97
c = 2.2 + 3.3j
s = "String"
lst = ["zero", "one", "two", "three", "four", "five"]
dct = {
    "Jim"    : "Dandy",
    "Stella" : "DuBois",
    1        : "integer",
}

while True:
    fmt = input("Format string: ")
    if not fmt:
        break
    fms = "{"+fmt+"}"
    print("Format:", fms, "output:",
          fms.format(i, r, c, s, e=lst, f=dct))

