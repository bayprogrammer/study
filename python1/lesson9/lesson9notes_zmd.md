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

## Binary Data

Many types of files are better suited to a binary format (such as audio
and photos) and the computer can store such things more efficiently in a
binary encoding than a text-based encoding. We can view such data
manually using a hex editor. We can write programs that read and write
binary data from files as well. Working with binary data in python is as
'byte strings'.

    .read()   # read entire file from current position
    .read(n)  # read n bytes from current location
    .tell()   # tell the length of the file in bytes
    .seek(n)  # move cursor to n location
    .seek(0)  # 'rewind' to beginning of file

When `read()` returns no more bytes, it means you've reached the end of
the file (Python will just return an empty bytestring once it's
completed traversing the file, no matter how many bytes you request).

> each byte [in a *byte string*] is eight bits, so the *ordinal value*
> of characters is in the range 0 to 255.

LEFT OFF: Files for Miles

---

Note: direct quotations in this document are from the O'Reilly School of
Technology course,
[Python 1: Beginning Python](http://www.oreillyschool.com/individual-courses/python1/).
