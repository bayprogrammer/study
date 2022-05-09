#!/usr/local/bin/python3
"""Count the words, lines and characters in a chunk of text."""

# Modifications for:
# - Make the program handle words longer than 20 chars
# - Keep count of individual words (using only sequences)

gettysburg = """\
Four score and seven years ago our
fathers brought forth on this continent,
a new nation, conceived in Liberty, and
dedicated to the proposition that
all men are created equal.

Now we are engaged in a great civil war,
testing whether that nation, or
any nation so conceived and so dedicated,
can long endure. We are met on
a great battle-field of that war. We have
come to dedicate a portion of that
field, as a final resting place for those
who here gave their lives that that
nation might live. It is altogether
fitting and proper that we should do this.

deinstitutionalizing
deinstitutionalizing
nstitutionalizing
tsdldfkalsdlfjklasdfitutionalizing
"""

lengthct = []
charct = len(gettysburg)

lines = gettysburg.split("\n")
linect = len(lines)

indvwordct = []

wordct = 0
for line in lines:
    words = line.split()
    wordct += len(words)
    for word in words:

        # record word length
        word_len_key = str(len(word))
        if word_len_key not in lengthct:
            lengthct.append(word_len_key)
            lengthct.append(0)
        lengthct[lengthct.index(word_len_key)+1] += 1

        # record individual word usage count
        if word not in indvwordct:
            indvwordct.append(word)
            indvwordct.append(0)
        indvwordct[indvwordct.index(word)+1] += 1

print("The text contains", linect, "lines,", wordct,
      "words, and", charct, "characters.")

lengths = lengthct[0::2]
lengths.sort(key=int)
for length in lengths:
    count = lengthct[lengthct.index(length)+1]
    print("Length {} : {}".format(length, count))

words = indvwordct[0::2]
for word in words:
    count = indvwordct[indvwordct.index(word)+1]
    print('Word "{}" : {}'.format(word, count))

