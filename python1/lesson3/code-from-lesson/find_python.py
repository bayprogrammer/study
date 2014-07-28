#!/usr/local/bin/python3

# Code from O'Reilly School of Technology Course:
#   Python 1: Beginning Python
#     Lesson 3: Making Decisions: The if Statement
# Entered as per the lesson text instructions.

# From the lesson text:
#   Copyright © 1998-2014 O'Reilly Media, Inc.
#   This work is licensed under a Creative Commons
#   Attribution-ShareAlike 3.0 Unported License.
#   See http://creativecommons.org/licenses/by-sa/3.0/legalcode for more
#   information. 

"""Detect any mention of Python in the user's input."""

uin = input("Please enter a sentence: ")
if "python" in uin.lower():
    print("You mentioned Python.")
elif "perl" in uin.lower():
    print("Aha, a Perl user!.")
elif "ruby" in uin.lower():
    print("So you use Ruby, then?")
else:
    print("Didn't see any languages there.")

