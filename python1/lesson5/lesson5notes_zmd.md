Lesson 5: Sequence Containers: Lists and Tuples

Study Time Log:
S: 2014-05-16 10:26(UTC-7)
E: 2014-05-16 13:02(UTC-7)
S: 2014-05-28 10:58(UTC-7)
E: 2014-05-28 13:18(UTC-7)

4 hours 57 minutes

(Took extra time on the last example code modifying it to accomodate the
extra functionality discussed).

---

container objects

lists and tuples:
    types of Python container objects; sequence types

"Strings are sequence types as well..."

sequence type:
    container with elements in a specific order

Elements in a sequence are numbered, starting at zero.

Addressing elments with brackets after the sequence name, like so:

  element address
   |
   V
 s[0]
 ^
 |
sequence variable

list:
    mutable sequence type

tuple:
    immutable sequence type

Generally, lists are good for grouping elements to be processed in the
same way, wheras tuples are good for structures where the ordinal
position means something specific "about its capability".

To define a list literal within the code, use square brackets "[...]"
with element values separated by commas. Tuples are similar but use
parenthesis "(...)".

We can use the plus "+" operator to combine two lists into a third new
list. (same with tuples) You cannot add a list and a tuple together.

You can nest lists and tuples. Tuples can be elements in a list, and
(based on an experiment just now in the interactive interpreter, you can
indeed make a list an element of a tuple... interesting...). In the
tuple at least, the element is bound to the same list object as the
original name, so if you change the list via the element of the tuple,
you are modifying the same object bound to the variable... more of
interest!

indexing:
    the manner by which you access elements of a sequence based on an
    element's numeric address or address range

Access single element with index in brackets:

s[0]

Access a subset of elements via a slice, range separated by colon:

s[0:3]  # return elements 0, 1, 2

(Note the fourth element, index 3, is not actually returned, it is the
end of the slice address but not included in the slice.)

s[:2]  # missing first index means start slice at very beginning

s[2:]  # missing last index means end slice at very end

"Be aware that when you slice a sequence, the second index isn't the
index of the last element in the slice."

immutability:
    once created, it cannot be changed

Strings and tuples are both immutable sequence types; lists are
mutable. Elements of lists can be rebound to other values, in similar
manner to varable name bindings.

You can assign a replacement sequence to a slice of a list; the
replacement must be a sequence (list, tuple, and string would all work),
but if a stand alone string is used then each of its elements would be
indvidually used as elements in the list. E.g.:

-----

>>> lst = [1, 2, 3, 4, 5]
>>> lst[2:4]
[3, 4]
>>> lst[2:4] = 'happy'
>>> lst
[1, 2, 'h', 'a', 'p', 'p', 'y', 5]
>>> lst[2:7] = ('happy', 'days')
>>> lst
[1, 2, 'happy', 'days', 5]

-----

Note that the replacement sequence can be longer than the slice it
replaces, and the extra elements are added in at the appropriate place
just fine. Also the replacement sequence can be smaller and the replaced
elements are deleted even if no replacements are given. This means you
could even delete a slice from a list by giving it an empty sequence as
the replacement sequence (but there are better ways).

del:
    del statement is used to delete elements from a list

remove():
    method used to remove an element based on its value

With remove(), "if the same value occurs more than once, only the first
occurrence is deleted."

append():
    method to add an element to a list at the end

insert():
    method to add an element to a list at a specific index location

Values can also be added to an empty slice to add new elements to the
middle of a list. This works because when the beginning and ending
address of a slice are the same, the slice is an empty sequence (and
thus you're replacing an empty sequence with a non-empty sequence, thus
adding new elements to the list sequence).

  lower-index (inclusive)
   |
   V
  [3:5]
     ^
     |
    upper-index (not inclusive)

  [4:4]
    ^
    |
Lower and upper indices are the same, so it's an empty slice, which can
be assigned to.

len():
    built-in function to get the length of a sequence such as a list

"Slice assignments...must be a sequence.... [they] take much less code
than most other techniques [when you have a sequence of elements to
insert]."

stride:
    "specifies how many elements to skip in the slice before extracing
    the next element"

[first:last:stride]

The default stride is 1 if you leave it out. The stride may be negative.

>>> 'abcdefghijklmnopqrstuvwxyz'[::-1]
'zyxwvutsrqponmlkjihgfedcba'

Woot!!

See also the list reverse() method for lists. No reverse() method for
immutable strings and tuples, of course. The slice is returning a new
bit of data, whereas the reverse method actually mutates the list
sequence in place.

>>> a = ['a', 'b', 'c']
>>> a[::-1]
['c', 'b', 'a']
>>> a
['a', 'b', 'c']
>>> a.reverse()
>>> a
['c', 'b', 'a']

string.split([separator], [limit])
# -> list of split strings; if limited, the last string element will be
     the remainder after the last split was recognized (the whole string
     is still returned in chunks, but the last chunk will be unsplit)

>>> 'a b c d e f g h i j k l m n o p q r s t u v w x y z'.split(' ', 5)
['a', 'b', 'c', 'd', 'e', 'f g h i j k l m n o p q r s t u v w x y z']

sum(sequence)
# -> sum of numbers in passed sequence

len(sequence)
# -> length of passed sequence

sequence.count(search_value)
# -> number of times search_value is in the sequence

s.strip()
# -> "returns a string with no leading or trailing white space"

---

>>> d = "once upon a time there was a quick brown fox that jumps over the lazy dog"
>>> d.split()
['once', 'upon', 'a', 'time', 'there', 'was', 'a', 'quick', 'brown', 'fox', 'that', 'jumps', 'over', 'the', 'lazy', 'dog']
>>> d.split(" ", 2)
['once', 'upon', 'a time there was a quick brown fox that jumps over the lazy dog']
>>> d.split().count('dog')
1
>>> d.split().count('a')
2
>>> len(d)
73
>>> len(d.split())
16

---

in:
    keyword used to test for the presence of a value in a sequence

index():
    "method that will return the lowest index value...[for]...a given
    element"

index() "will raise an exception if the element isn't present."

You can use `if element in sequence` before using .index() to get the
first index of the element being searched for, but later we'll learn how
to just use .index() directly then handle the raised exception to avoid
doing the search twice.

DONE.

