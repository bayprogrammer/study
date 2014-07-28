#!/usr/local/bin/python3

#
# check_string.py
#

"""Basic comprehension test: make sure a user can follow the simple
   instruction to enter a string of characters which are all upper-case
   and ends with at least one period character."""

# Commence testing
print("""At the following prompt, enter a string containing all UPPER-CASE
characters that also ends with at least one period. This is a test. You
will be graded.""")
s = input("\nInput String Here: ")
print()  # blank line

# Innocent until proven guilty
feedback = "Good job, you passed the test! \o/"

# Check student's work
passed_da_test = s.isupper() and s.endswith(".")

if not passed_da_test:
    feedback = "I'm sorry, you didn't pass the test."

    # Prepare personalized feedback for student based on specific
    # characteristics of inputted data
    if not s.isupper():
        feedback = feedback + "\nYour string did not contain all UPPER-CASE characters."

    if not s.endswith("."):
        feedback = feedback + '\nYour string did not end with at least one period (".")'

print(feedback)

