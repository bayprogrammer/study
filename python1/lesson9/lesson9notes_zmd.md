# Lesson 9: Reading and Writing Files

## Opening and Writing to a File

`open()` built-in function creates a file object bound to a file on disk
(creating the file on disk if necessary). We give the `open()` function
the name of the file to open (a string representing the path to the
file) and a flag indicating whether to open read only, write, or to
append to the file (e.g. 'w' for write).

    fileobject.open('filename.txt', 'w')
    fileobject.write('string\n')
    fileobject.writelines(['one\n', 'two\n', 'three\n'])
    fileobject.close()

## Reading a File

Opening a file for reading (use the 'r' flag) returns an interable file
object, which lines you can loop over.

    f.open('funnies.txt', 'r')

    f.read()  # or
    f.readline()  # or
    f.readlines()

    for line in f:
        # do stuff
        pass

    f.close()

As you read a file, it is "used up", so if you need to read from the
start again, reopen the file with the 'r' flag. When you're done with a
file, `.close()` it. This is a best practice and cleans up the resource. 

## Appending to an existing file

We just use the append 'a' option to open a file for appending to
(otherwise, with 'w', an existing file will be truncated and we would
loose its previous content).

## Seeking within a file

The `.seek()` method can be used to move the file object cursor around by
units of characters. The first argument is the number of characters to
read from, and the second optional argument is a numeric constant
telling `.seek()` from whence to seek from. When seeking from the
current position a negative seek value may be used to seek backwards,
and a negative seek value may not be used if seeking from the beginning
of the file (can't seek beyond the boundaries of the file), and a
negative seek value must be used if seeking relative to the end of the
file.

    FROM_START = 0
    FROM_CURRENT = 1
    FROM_END = 2

    f = open('funnies.txt', 'r')
    f.seek(4, FROM_START)
    f.seek(3, FROM_CURRENT)
    f.seek(4, FROM_END)

The `.tell()` method tells us where in the file our cursor is currently
located.

## Getting additional data about a file

There are more methods and attributes on a file object we can use to
check the status of a file object:

    .name
    .readable()
    .writable()
    .seekable()
    .encoding
    .errors
    .closed

## Persistence

<dl>
<dt>persistence</dt>
<dd>"when you turn off or quit the application, the data remains
available"</dd>
</dl>

Files on long-term storage are only one form of persistance; another
example is that of a database storage system.

> Sophisticated persistence engines are called databases. ... These are
> integrated sets of logically organized files or records. ... Usually,
> databases use the relational model, but there are also hierarchical,
> object, network, and flat-file models.

LEFT OFF: Creating a File-Based To-Do List (sample code entry)

---

Note: direct quotations in this document are from the O'Reilly School of
Technology course,
[Python 1: Beginning Python](http://www.oreillyschool.com/individual-courses/python1/).
