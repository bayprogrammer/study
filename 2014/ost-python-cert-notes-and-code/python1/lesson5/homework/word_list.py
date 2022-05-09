#!/usr/local/bin/python3

#
# word_list.py
#

"""Ask user for some text; return the text broken into
   individual words (one per line) starting with all words
   containing one or more uppercase letters, followed by
   those words not containing such uppercase letters.
"""

words = input("Input text: ").split()

lower = []
notlower = []
for word in words:
    if word.islower():
        lower.append(word)
    else:
        notlower.append(word)

# so tempted to ignore step 4...
# print("\n".join(notlower + lower))

# ...but I wont...
for word in notlower + lower:
    print(word)

