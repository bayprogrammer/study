# Lesson 8: More About Looping

The `break` statement forces any loop to terminate.

## range()

The `range()` built-in function "generates arithmetic progressions", and
returns a `range` object, which can be effeciently iterated over.
`range()` begins at 0, not 1, which can be useful for use as an index
(though there is no need normally to use a range to iterate over a list,
just iterate directly over the list elements in a regular for loop).

<dl>
<dt>code smell</dt>
<dd>
    "code that works, but still stinks a little"
</dd>
</dl>

`range()` accepts three arguments; if only one is given, it will generate
0 through the number given (exclusive); if two are given, it will start
with the first number, and generate until the last number (again,
exclusive). If three are given, the third acts like the list's stride.

## enumerate()

`enumerate()` generates a two-tuple for each element in an iterable, the
first element being an index (which it automatically increments), and
the second being the value from the source iterator. You can enumerate
over lists, tuples, range objects, etc. When using a `for` loop with an
enumerate object, you can unpack both values at once, like so:

    for x, y in enumerate(['perl', 'python', 'javascript', 'ruby']):
        print(x, y)

## while loops for data validation

One can use a `while True: ...` construct to continuously loop over a
pattern requesting the user to input data but only breaking out of the
loop once valid input is provided.

## loops and dictionaries

.items() dict method returns a generator which produces two-tuples of
the key-value pairs for each original dict element. Useful to unpack in
a for loop:

    for key, value in some_dict:
        # do something with key and value
        print(key, value)

`del` statement can be used to remove items from a dictionary based on
its key. e.g. `del mydict['mykey']`

<!-- LEFT OFF: A More Complex Example -->
