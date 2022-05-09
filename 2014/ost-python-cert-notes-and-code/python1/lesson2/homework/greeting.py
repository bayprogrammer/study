#
# greeting.py
#

"""Politely ask the user for his or her first and last name, and in
   return provide a warm personalized greeting."""

first = input("Pray tell, what is your first name? ")
last = input("And what is your last name? ")

# using string format() method for better control over spacing with
# punctuation
print("Pleased to make your acquaintance, {} {}!".format(first, last))

