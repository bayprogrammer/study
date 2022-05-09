# Lesson 2: Entering and Storing Data

<!--
Study Time Log:
S: 2014-04-28 10:51(UTC-7)
E: 2014-04-28 11:45(UTC-7)
S: 2014-04-30 10:38(UTC-7)
E: 2014-04-30 11:45(UTC-7)
-->

In Python, implicit is better than explicit. It won't implicitly convert
a string holding a number to a numeric type for adding it to a number
value.

Terms to allow to marinate my mind:

- object
- int
- str
- type conversion
- implicit type conversion
- [explicit type converstion]
- operand

Storing data and getting data (input) from the user. Interactive user
data comes to us in the form of the string data type.

## Binding Values to Names

Assignment Statement: store data bound to the assigned name. Data can be
a literal value or come from an expression.

    >>> n = "USA"
    >>> a = 2014 - 1776

Improves code readability (you can use meaningful names to refer to
values), allows using value in muliple places in code, and allows the
code to be run multiple times with different values.

(Side note: `**` operator has a greater precendence than the `*`
  operator).

Basic format of binding name to a value:

    name = value

Python names must start with upper or lowercase character or underscore,
followed by a combination of uppercase, lowercase, underscore, or
number characters. (Hyphen/dash "-" not acceptable.)

Memory allocated from a heap ("object space"); namespaces hold names
bound to values allocated in the object space.

<dl>
  <dt>module</dt>
  <dd>python file</dd>

  <dt>global namespace</dt>
  <dd>common term referring to the module's own namespace (module
    global)</dd>
</dl>

The built-in namespace "holds Python's essential functions."

An interactive session has its own "module global namespace".

The `dir()` function called by itself is stored in "the built-in
namespace." `dir()` called without an argument reports the contents of
the module global namespace from which it is called.

    a, z = 1, 2

Normally each line equals a single statement in Python; but a single
statement may span muliple lines when the '\' statement continuation
symbol is used or when a statement with unclosed brackets ("{", "[", or
"(") span lines.

Semi colon satement terminators may be used to have more than one
statement on a single line but this is highly discouraged.

compound statements: statements grouped in a block (a suite), such as
statements in a function or class definition. Denotated by having the
block of statements all indented at the same level.

`#` at the beginning of a line denotes a comment line. `#` is called
"pound sign", "octothorp", and "hash mark" commonly.

> As your skill level increases, your comments may be less detailed, but
> your code should always be easy to read for both intent (the desired
> result of the code) and implementation (the way the code accomplishes
> the intent).

`__doc__` resolved to the docstring (in module global namespace; None is
no docstring is present).

<!--
[Left off just before "Using String Methods: Case Convention"]
-->

We can use the `dir()` function on an object to see its available
methods.

    dir("")  #show available methods for string objects

    "zeb deos".lower()
    "zeb deos".upper()
    "zeb deos".title()

    print("hi", "my", "pie", "cry", sep="\n")  # sep!!

We can use the `input()` function to get data from the user interactively.
Data from the user via `input()` always is returned a s string, so we must
explicitly convert to other types (e.g. numeric) when needed.

## Type Conversions!

`int()`

`float()`

If the type conversions cannot be accomplished for some reason an
appropriate exception will be raised.

Floating point number handling will often have rounding erorrs. Care
must be taken to ensure rounding errors don't affect the results of your
calculation or accumulate over the runtime of the program.

The error data printed the screen by the interactive interpreter when
something like a type conversion can't be done is called an "exception
traceback". If an exception happens during non-interactive execution of
a Python program the program will halt rather than return you to the
`>>>` prompt. Exception handling will be covered later.

---

Note: direct quotations in this document are from the O'Reilly School of
Technology course,
[Python 1: Beginning Python](http://www.oreillyschool.com/individual-courses/python1/).
