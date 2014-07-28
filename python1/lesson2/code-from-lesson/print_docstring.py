# Code from O'Reilly School of Technology Course:
#   Python 1: Beginning Python
#     Lesson 2: Entering and Storing Data
# Entered as per the lesson text instructions.

# From the lesson text:
#   Copyright © 1998-2014 O'Reilly Media, Inc.
#   This work is licensed under a Creative Commons
#   Attribution-ShareAlike 3.0 Unported License.
#   See http://creativecommons.org/licenses/by-sa/3.0/legalcode for more
#   information. 

#
# This is a program that prints its own docstring
#
x = """print_docstring.py prints its own docstring
(the string that's the first executable statement,
which in this case extends to three lines)."""
__doc__ = x
print(__doc__)

