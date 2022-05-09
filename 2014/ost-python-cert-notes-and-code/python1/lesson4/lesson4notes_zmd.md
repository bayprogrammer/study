Lesson 4: Iteration: For and While Loops

Study Time Log:
S: 2014-05-14 10:26(UTC-7)
E: 2014-05-14 11:48(UTC-7)

---

Python types covered so far: strings and numbers.

Python sequence types; one of which is the string (there are others as
well).

while loop:
    repeat action repeatedly as long as condition is true

for loop:
    repeat action repeatedly on each of a set of objects (in a sequence
    type like a string

break statement:
    causes the loop to stop executing; can be used to optimize code to
    stop a loop once you know you've accomplished a task, even if the
    loop would otherwise keep running.

off by 1 error:
    occurs if you increment things incorrectly

The 'else' clause can be used with both the for and while loops; it
indicates a suite of statements to be executed if the loop exits
NORMALLY-- using the break statement to exit a loop prematurely allows
us to exit the loop without the else clause's suite of statements being
run.

<code>
a = 0
while a < 5:
    print("a: {}".format(a))
    a += 1
else:
    # will be reached:
    print("End of the loop reached normally.")

# ---

a = 0
while a < 5:
    if a == 3:
        break
    print("a: {}".format(a))
    a += 1
else:
    # will not be reached
    print("End of the loop reached normally.")
</code>

[Basically, the else suite is executed when the while loop's condition
evaluates to false or the for loop runs out of elements to iterate
through; when you break the loop manually, the loop's condition never
got a chance to evaluate to False, so the else clause was never reached.
This is akin to if/else, where else is evaluated when the if's condition
evaluates to False.]

We can simplify code, and "should 'do the simpliest thing that works",
such as not using an else clause to an if in a loop when we know that if
the if condition evaluates to True, we will break out of the loop
entirely (and thus know for certain whatever we might have put in the
if's else clause won't be called unexpectedly). [I have thought this way
for quite some time, nice to know I've been on the right track.]

while loops are particularly useful when dealing with something that is
not a finite sequence (such as running over a loop until some condition
is evaluated as True, no matter how many unknown iterations it may
take).

while True:

    Used when the programmer will terminate the loop using break from
    within the loop, or for a program meant "for continous operation",
    or when the programmer has made a big mistake.

The `continue` statement can be used to break not the whole loop, but
just to skip to the next iteration (bypassing the rest of the current
iteration).

----

String.find(x):
    "[Locate] a given character inside the string"

String.split():
    "Splits the string up into its constituent words..."

----

