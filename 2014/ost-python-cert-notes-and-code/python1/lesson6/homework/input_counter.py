#!/usr/local/bin/python3

#
# input_counter.py
#

"""Analyze and report upon when words entered by the user are first
   encountered.
"""

words = set()
first_contact = dict()

while True:
    line = input("Enter text: ").split()

    if not line:
        break

    for word in line:
        words_old_len = len(words)
        words.add(word)
        words_new_len = len(words)
        if words_new_len > words_old_len:
            first_contact[word] = words_new_len

    for word, discovered in first_contact.items():
        print(word, discovered)

print("Finished")

