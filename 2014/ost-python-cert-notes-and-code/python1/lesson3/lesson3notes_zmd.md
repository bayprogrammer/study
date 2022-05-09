# Lesson 3: Making Decisions: The if Statement

<!--
Study Time Log:
S: 2014-05-09 12:41(UTC-7)
E: 2014-05-09 14:23(UTC-7)
S: 2014-05-12 11:01(UTC-7)
E: 2014-05-12 11:36(UTC-7)
-->

---

We use the `if` statement to execute a different suite of statements
based on a given condition (whether the condition is true or false).

## Some Common Operators:

    a == b
    a != b
    a <  b
    a <= b
    a >  b
    a >= b

## Comparing Numbers:

Intuitive, but for complex numbers care must be taken to compare
absolute values by first getting the absolute value of the complex
number using the `abs()` function.

## Comparing Strings:

<dl>
  <dt>collation sequence</dt>
  <dd>the defined order for characters in strings</dd>
</dl>

Earlier characters in a collation sequence are considered less than
characters which occur later in the sequence. So `"a" < "b"`, `"b" >
"a"`, etc. When comparing strings, the interpreter steps through the
respective characters in each comparing their values according to the
collation sequence, starting with the first character of each string,
moving to subsequent characters if the initial comparisons do not
provide a clear winner (basically, like alphabetizing something). If all
the characters match to the end of one string, but the other string
keeps going (that is, is longer), then the longer of the two is
considered greater; if the strings contain identical characters and are
the same length, they are considered equal (as intuition would suggest).
The term "lexical comparison" is sometimes used to describe this
process. "string comparisons are case-sensitive."

The `upper()` and `lower()` string methods can be used to normalize
strings for comparisons when case is not a factor you wish to be
considered for the conditional.

The `in` operator is used to determine if one operand is a substring of
another, like so:

    >>> 'nana' in 'Banana'
    True

The `in` operator can also be used to check to see if a string exists in
a tuple or list:

    >>> 'zeb' in ('phil', 'apolos', 'mich', 'zeb')
    True 

(Note: not just strings, this is also valid:)

    >>> 5 in (1, 2, 3, 4, 5, 6)
    True

Here is a list of the most important string methods that can also be
used to test a string for various things ("characteristics"):

    s.startswith(x)
    s.endswith(x)
    s.isalnum()
    s.isalpha()
    s.isdigit()
    s.islower()
    s.isupper()

<dl>
  <dt>conditions</dt>
  <dd>
      "expressions that the Python interpreter will evaluate as True
      or False"
  </dd>
</dl>

    if <conditions>:
        <statements>

The suite of statements is indented (preferably by four spaces) to apply
it to the if statement (if and only if the condition(s) evaluate to
True).

<dl>
  <dt>indented suite</dt>
  <dd>
      "one or more statements with an indentation level greater than
      that of the if line"
  </dd>
</dl>

The `else` clause can be used in conjunction with an if statement to
specify a suite of statements to execute when the conditions of the if
statement evaluate to `False`. It has its own suite of statements
indented much like an if statment.

Always test. Always test all possible codepaths.

To allow multiple tests without requiring deep nested
else...if...else...if clauses, we can use the `elif` keyword as a clause
to an if statement. The final clause can be a final else clause, but
many elif clauses may be used without incurring additional nesting. Each
elif clause has its own suite of statements. The final else clause is
optional and can be omitted if not needed.

The `and` and `or` statments can be used to combine two or more
conditional statments together within a single if/elif statement (rather
than using nested ifs).

<dl>
  <dt>and</dt>
  <dd>all conditions ANDed together are true</dd>
  <dt>or</dt>
  <dd>any (at least one) of the conditions ORed together are true</dd>
</dl>

We can chain comparison operations to avoid unnecessary ANDs. "Instead
of writing `a < b and b < c`, you can write `a < b < c`."

---

Note: direct quotations in this document are from the O'Reilly School of
Technology course,
[Python 1: Beginning Python](http://www.oreillyschool.com/individual-courses/python1/).
