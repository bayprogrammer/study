#!/usr/local/bin/python3

# Code from O'Reilly School of Technology Course:
#   Python 1: Beginning Python
#     Lesson 8: More About Loops
# Entered as per the lesson text instructions.

# From the lesson text:
#   Copyright © 1998-2014 O'Reilly Media, Inc.
#   This work is licensed under a Creative Commons
#   Attribution-ShareAlike 3.0 Unported License.
#   See http://creativecommons.org/licenses/by-sa/3.0/legalcode for more
#   information. 

"""Validate user input"""

while True:
    s = input("Type 'yes' or 'no':")
    if s == 'yes':
        break
    if s == 'no':
        break
    print("Wrong! Try again.")
print(s)
