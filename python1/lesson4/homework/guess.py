#!/usr/local/bin/python3

#
# guess.py
#

"""Guessing game. Program contains secret number variable at the
   beginning, and the end user must attempt to guess it correctly.
   The program provides clues to the user as to whether the guess
   is too high or too low.
"""

secret = 17
remaining = 5

while remaining:
    # Handle exception if user input can't be cast to float
    try:
        guess = float(input("Please guess a number: "))
    except ValueError:
        print("That's not a number, silly!")
        continue
    finally:
        # a guess is a guess, silly or not
        remaining -= 1

    if guess == secret:
        print("You got it!", secret, "is the correct number!")
        break
    elif guess > secret:
        print(guess, "is too high..")
    elif guess < secret:
        print(guess, "is too low..")
else:
    print("You're all out of guesses. The secret number was", secret)

