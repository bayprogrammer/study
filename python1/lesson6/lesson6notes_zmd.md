Lesson 6: Sets and Dicts

Study Time Log:
S: 2014-06-02 10:26(UTC-7)
E: 2014-06-02 12:35(UTC-7)

2 hours 9 minutes

---

set:
    "an unordered collection of items with no duplicate elements"

A set is a collection (aka container), similiar to list in that a set
contains elements, but elements are not stored sequentially and
duplicates are discarded

dict:
    a collection of elements indexed using keys (not limited to numeric
    indices)

---

Working with Sets

Sets are faster to search (such as using the 'in' keyword), but their
order is not predictable like a list's. If you try to add a duplicate
value to a set the duplicate will be discarded silently (a set may have
up to one each of a given element).

Set's are defined using a comma separated set of values inside curly
braces, or by passing a sequence to the set() built-in function.

>>> s1 = { 1, 2, 3 }
>>> s2 = set((1, 2, 3))
>>> s3 = set("abcdefg")

Frozen sets are immutable sets; trying to change frozen sets after
they're defined will cause exceptions.

Sets support "union, intersection, and difference" operations.

From the course text for lesson 6, I copy this table, for it looks
exceeedingly useful:

------------------------------------------------------------------------

Operation   Method Call         Returns
---------   -----------         -------

x in s      -                   True if x is an element of set s.

s <= t      s.issubset(t)       True if every element of s is also an
                                element of t.

s < t       -                   True if every element of s is also an
                                element of t but there is also an
                                element of t that is not in s.

s >= t      s.issuperset(t)     True if every element of t is also an
                                element of s.

s > t       -                   True if every element of t is also an
                                element of s but there is also an
                                element of s that is not in t.

-           s.isdisjoint(t)     True if s and t have no element in
                                common.

s | t       s.union(t)          The set containing all elements of s and
                                all elements of t.

s & t       s.intersection(t)   The set containing all elements that are
                                in both s and t.

s - t       s.difference(t)     The set containing all elements that are
                                in s but not in t.

s ^ t       s.symmetric_\       The set containing all elements that are
            difference(t)       in s or t but not in both.

s |= t      s.update(t)         None, but adds all elements of t to s.

s &= t      s.intersection_\    None, but leaves s containing only
            update(t)           elements that originally belonged to
                                both t and s.

s -= t      s.difference_\      None, but removes any elements of t from
            update(t)           s.

s ^= t      s.symmetric_\       None, but leaves s containing all
            difference_\        elements that belong to t or s but not
            update(t)           both.

------------------------------------------------------------------------

The `sorted()` built-in function can sort a set into an ordered list
object.

sorted(s) => list

Working with Dicts

"The dict is a useful structure for storing values against arbitrary
keys."

Dict keys can be strings, tuples, and integers (immutable objects, mind
you). A sequence of keys can be extracted using the .keys() method of a
dict. The .keys() method is an iterator returning the type dict_keys. The
.items() method is an iterator which "yields key-value pairs [as tuples]
rather than keys from the dict" of the type dict_items.

dict literal is denoted by curly braces like sets, but define key-value
pairs:

>>> d = { 'larry': 'perl', 'guido': 'python', 'matz': 'ruby' }

Assignment statments can be used to add new key-value pairs (or update
values for existing keys):

>>> d['pike'] = 'go'

For numeric keys, numeric equivalence is used to determine the key,
rather than input representation, so since 1.0 == 1 == 1+0j is True, any
of those three ways of expressing the numeric value of 1 would be
considered a reference to the same key in a dictionary (not three
separate keys).

Trying to get a key which does not exist on a dict will result in
KeyError exception being raised.

len(d) => "number of items in the dict"

k in d => True if key 'k' is in dict 'd', else False
k not in d

d.get(k, [default]) => value of element associated with key 'k', or the
value of default (or None if no default provided)

d.update(other) => update dict 'd' with data from dict 'other',
overwriting values for keys in d contained in other.

