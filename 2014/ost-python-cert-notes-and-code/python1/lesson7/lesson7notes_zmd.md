# Lesson 7: String Formatting

<!--
Study Time Log:
S: 15:40 2014-06-18 (UTC-7)
E: 16:58 2014-06-18 (UTC-7) [78]
S: 10:25 2014-07-07 (UTC-7)
E: 11:40 2014-07-07 (UTC-7) [75]

2 hours 33 minutes
-->

<dl>
<dt>format string</dt>
<dd>string containing literal text and replacement fields</dd>
<dt>replacement field</dt>
<dd>
    fields denotated by `{}` in string to be replaced by arguments
    to `format()` method on format string
</dd>
</dl>

    s = ("this is a format string to be formatted with an {}"
         "field".format('cool'))

Replacement fields are referenced either by position or name.

You can dereference dictionaries and sequences within the replacement
field.

    >>> "I am {0[name]}".format({'name':'zeb', 'age':27})
    I am zeb

    >>> "{0[0]} bottles of {0[1]} on the wall".format([99, 'beer'])
    99 bottles of beer on the wall

The `format()` method can take both positional arguments or keyword
arguments. "The arguments to the format() method call are the values
to be formatted." Literal curly brackets can be escaped like this: `{{`
for `{`, and `}}` for `}`.

    "some text {0[3]}".format(...)
                ^ ^
                | `-------------------,
          field name (positional)     |
                                   index key

    "some text {person[name]}".format(...)
                ^       ^
                |       `-------------------,
          field name (keyword)              |
                                         index key

    "some text {obj.id}".format(...)
                ^   ^
                |   `-------------------,
          field name (keyword)          |
                                    attribute

<dl>
<dt>format specification</dt>
<dd>
    optional part of the format selector expression how the field
    should be formatted (alignment, padding, etc.)
</dd>
</dl>

    {selector:format specification}

Format specification is optional, but if provided, its components must
be given in a prescribed order.

    {selector:<padding char><padding alignment option><padding ammount>}

    { 
        selector
        :
            padding
                alignment
                amount of padding
            sign
            base indicator
            digit separator
            field width
            precision
            field type
    }

    {0:#^20s}
     ^ ^^^ ^
     | ||| |
     | ||| |
     | ||| field type code (often optional)
     | ||amount of padding
     | |alignment option
     | padding character
    selector

    >>> "{0:#^20}".format(42)
    '#########42#########'
    >>> "{0:^20}".format(42)
    '         42         '
    >>> "{0:20}".format(42)
    '                  42'

    Alignment options:
    <       left-aligned
    >       right-aligned
    =       numeric types: padding after sign before digits
    ^       center

- Sign:
    - \+ : "Insert a + sign for positive values, a - sign for negative
            values."
    - \- : "Insert a - sign for negative values, no sign for positive
            values."
    - space : "Insert a - sign for negative values, a space for positive
              values"

## Base Indicator:

\# followed by:

 - 0b : for binary representation
 - 0o : for octal representation
 - 0x : for hexedecimal representation

## Digital Separator:

Allows you to specify a character to be used for grouping digits.

## Field Width:

Only appropriate for numberic values.

## Precision:

Concerning "how many significant digits to display" for numeric values,
otherwise "indicates how many characters will be used from the field
content."

"Precision is specified as a period followed by a decimal number."

## Field Type:

Final character indicating the type of the value being formatted;
s for string is optional, can also be applied to numeric values (and
then they will be treated as if being cast by `str()`). Stuff about
truncation, also complex numbers needing some special treatment for
the real and imaginary components being formatted separately.

The field type codes are listed in the lecture notes, and I'm sure I
could find exaustive information in the official documentation.

## Variable-Width Fields:

Width and precision arguments can be passed as arguments to the
`format()` method. It all looks very complicated! :( Basically, it's
like sub-selectors inside the formatting block, which specify which
arguments passed to `format()` provide those values as if they were
specified directly (allowing these bits to be set up at runtime based
on other state in the system).

---

Note: direct quotations in this document are from the O'Reilly School of
Technology course,
[Python 1: Beginning Python](http://www.oreillyschool.com/individual-courses/python1/).
