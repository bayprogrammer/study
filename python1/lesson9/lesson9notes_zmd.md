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

LEFT OFF: "Reading Files as Text"

---

Note: direct quotations in this document are from the O'Reilly School of
Technology course,
[Python 1: Beginning Python](http://www.oreillyschool.com/individual-courses/python1/).

