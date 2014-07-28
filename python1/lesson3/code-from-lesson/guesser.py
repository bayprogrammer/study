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

target = 63
guess = 0

while guess != target:
    guess = int(input("Guess and integer: "))
    if guess > target:
        print("Too high...")
    elif guess < target:
        print("Too low...")
    else:
        print("Just right!")

