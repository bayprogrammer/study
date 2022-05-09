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
# wall_area.py
#
h = float(input("Room height: "))
w = float(input("Room width : "))
d = float(input("Room depth : "))
area = 2 * (h * ( w + d))
print("Area of walls:", area)

