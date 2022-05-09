#!/usr/local/bin/python3

#
# inputter.py
#
# by Zeb DeOs, August 2014
# for completion of O'Reilly School of Technology
# Lesson 9, Objective 1
#

"Store user input in a file."

# Make sure file is there, even if this is the first run, and get
# it's initial size
f = open('input.txt', 'a')
size = f.tell()
f.close()

running_text = ''
if size > 0:
    f = open('input.txt', 'r')
    running_text = f.read()
    f.close()

# Open the file for appending input from user
f = open('input.txt', 'a')

# Accept and record user's input in the file
while True:
    if running_text:
        print(running_text)

    i = input('Enter text: ')
    if i:
        f.write(i)
        running_text += i
    else:
        break

# Clean up
f.close()
