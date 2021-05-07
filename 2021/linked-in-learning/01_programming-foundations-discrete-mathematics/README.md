# Programming Foundations: Discrete Mathematics

[LinkedIn Learning course][1] by [Peggy Fisher][2]

[1]: https://www.linkedin.com/learning/programming-foundations-discrete-mathematics
[2]: https://www.linkedin.com/in/peggyfisher145?trk=learning-course_instructor&upsellOrderOrigin=default_guest_learning

## Table of Contents

### [Introduction](#introduction)

* [X] [Welcome](#welcome)
* [X] [What you should know](#what-you-should-know)
* [X] [Using the exercise files](#using-the-exercise-files)

### 1. [Discrete Math Uses](#1-discrete-math-uses)

* [X] [Basics of discrete mathematics](#basics-of-discrete-mathematics)
* [X] [Discrete math for programming](#discrete-math-for-programming)
* [X] [Real-world discrete math](#real-world-discrete-math)
* [X] [Abstract discrete math](#abstract-discrete-math)
* [X] [Chapter Quiz](#chapter-quiz)

### [2. Sets](#2-sets)

* [X] [Objects as sets](#objects-as-sets)
* [X] [Set notation](#set-notation)
* [ ] [Set operations](#set-operations)
* [ ] Power sets
* [ ] Sequences and sums
* [ ] Recursion
* [ ] Cardinality, disjointness, and partitions
* [ ] Sets from Cartesian products
* [ ] Challenge: Practice with sets
* [ ] Solution: Practice with sets
* [ ] Chapter Quiz

### 3. Setting Up SML

* [ ] Functional programming
* [ ] Datatypes
* [ ] Characters and strings
* [ ] Recursive functions
* [ ] Challenge: Learn SML
* [ ] Solution: Create new data types
* [ ] Chapter Quiz

### 4. Analyzing Data Sequences

* [ ] Use SML to create lists
* [ ] Perform functions on lists
* [ ] Create datatypes that use lists
* [ ] Challenge: Model a lunch order
* [ ] Solution: Model a lunch order
* [ ] Chapter Quiz

### 5. Effective Arguments and Defensible Decisions

* [ ] Valid reasoning and inference
* [ ] Truth tables
* [ ] Identify and evaluate predicates
* [ ] Conditional propositions
* [ ] Valid arguments
* [ ] Rules of inference
* [ ] Prove logical equivalence
* [ ] Challenge: Write truth tables
* [ ] Solution: Write truth tables
* [ ] Chapter Quiz

### 6. Proofs Made Easy

* [ ] Write a general outline for a proof
* [ ] Write subset proofs
* [ ] Evaluate conditional proofs
* [ ] Understand biconditional proofs
* [ ] Prove with mathematical induction
* [ ] Challenge: Write a proof
* [ ] Solution: Write a proof
* [ ] Chapter Quiz

### 7. Advanced Discrete Math Topics

* [ ] Visualize data with graph theory
* [ ] Network optimization with trees
* [ ] Event probability
* [ ] Cryptography
* [ ] Challenge: Advanced techniques
* [ ] Solution: Advanced techniques
* [ ] Chapter Quiz

### Conclusion

* [ ] Next steps

-----

## Introduction

### Welcome

### What you should know

* Algebra
* Take notes
* Practice
* Paper & pencil
* Do exercises

### Using the exercise files

## 1. Discrete Math Uses

### Basics of discrete mathematics

* Study of math that falls outside calculus
  - Calculus is study of continuous math concepts
  - Discrete is study of, well, discrete concepts
    - Separable, countable, qualified objects
* e.g. Analog vs. digital
* Core concepts
  - Logic: identify predicates, formatting conditional statements,
    adding quantifiers, logical operations
  - Set theory: enumerate groups of data: infinite and finite sets
  - Number theory: using integers/natural numbers to enumerate sets of
    data
  - Graph theory: model pair-wise relationships b/w objects
  - Combinatorics: study of finite countable discrete structures
    - used in number theory, graph theory, probability theory
    - e.g. study of sequences such as fibonacci
    - involves mathematical reasoning combined with creativity and
      problem solving

### Discrete math for programming

* Important to foundations of programming
* Computers operate in discrete units of data (bits and bytes)
  - Bits: 0 or 1
  - Boolean: true or false (represented as 0 or 1)
  - Logical expresssion: evaluate to true or false
    - conditionals
    - occur frequently in programming
    - any time a program needs to loop, generally depends on logical
      expressions
* Program Efficiency
  - accuracy and efficiency
  - sorting algorithm (based on input size)
    - e.g. (just to name a few)
      - bubble sort
      - insertion sort
      - merge sort
      - quicksort
      - selection sort

### Real-world discrete math

* Logic: study of formal reasoning
  - discrete math involves many forms of evaluating logical statements
  - specific and well-defined meaning
* Idenfiy an assumption
  - then seek to rule out the assumption on the basis of its consequences
* Indirect proof
  - testing and evaluating
* Laws of logic
  - permutation
  - truth tables

### Abstract discrete math

* Abstracte Math
  - justify use of math in applications
  - conceptual reasoning about abstract ideas
  - understanding and constructing proofs
  - prove theorims using mathematical ideas

* Proofs
  - complex problems broken down into smaller problems
  - often start with statement similar to this:
    - "One supposes that a particular but arbitrarily chosen element x in D for
      which P(x) is true." (P = proposition)
  - generalize to more specific solutions

* Discrete Mathematics
  - relatively few formulas to memorize
  - fundamental concepts & their application
  - algorithms: series of steps used to solve a problem
  - can be used to solve abstract math problems

### Chapter Quiz

## 2. Sets

### Objects as sets

* Set Theory
  - building blocks of discrete mathematics
* What is a set
  - collection of objects
    - physical
    - numbers
  - cardinality of a set: number of objects in a set
* Set Properties
  - order of elements is not important
  - empty set: set with no elements
  - equal sets: two sets have exactly the same elements
  - cardinality: number of elements in the set
* Special Set Names
  - used for sets of numbers in particular
  - N: all natural numbers (e.g. counting numbers)
  - W: whole numbers (0 in addition to N)
  - Z: set of all integers
    - Z+: positive
    - Z-: negative
  - Q: set of all rational numbers
    - any number that can be expressed as a/b where a and b are both integers
      and b is not equal to 0
  - R: set of all real numbers
    - includes all other sets, plus some numbers that cannot be written in
      rational form (e.g. sqrt(3))
* Venn Diagram
  - pictoral representation of how sets relate to eachother
  - [examines the special numeric sets via Venn diagrams)
  - subsets
* Other Types of Sets
  - other types of information may be treated as sets
    - database: set containing a large amount of data
    - university student enrollment data
    - postal service set of zip codes
  - programmers often use queries to look for elements within sets

### Set notation

* Sample Sets
  - elements separated by series of commas enclosed in curly brackets
    - {a, b, c, d, e}
  - sets can be empty:
    - {}
    - ∅
  - sets can have one element
    - {1}
  - limited number [finite set]
    - {1, 2, 3, 4, 5, 6, 7, 8, 9}
  - unlimited number (infinite set)
    - {1, 2, 3, 4, ...}
* Cardinality
  - number of items in a set
  - denoated with symbol often used for absolute values
    - |A|
      - "the cardinality of set A"
  - empty set: {} or ∅
  - element of a set
    - x∈A
      - "x is an element of set A"
* Subset Definition
  - A⊆B
    - "if every element in set A is also an element of set B then A is a subset
      of B"
  - if A⊆B and there is an element of B that is not A, then A is a proper
    subset of B
  - example:
    - B = {2, 4, 6, 8, 10}
    - A = {2, 4, 6}
    - therefore A⊆B
      - A is subset of B or equal to B
    - A∈B: A is proper subset of B
  - Let A = {a, b, c, d}
    - a⊆B
    - f∉A
      - f is not an element of the set A
    - Red ∈ {Red, Orange, Yellow, Green, Blue, Indigo, Violet}
      - the symbol Red is in the set of the colours of the rainbow
    - {Red} ∉ {Red, Orange, Yellow, Green, Blue, Indigo, Violet}
      - the *set* of one element Red is not in the set of the colours of the
        rainbow
* Set of Natural Numbers
  - some sets are denoted by a variable that stands for an arbitrary element of
    the set being defined
  - we understand the set of natural numbers being those that start at 1 and go
    on to infinity; it can be defined as:
    - N = { x∈Z | x>0 }
      - "Define the set N as the set of all arbitary values x that are an
        element of the set of integers Z such that x is greater than 0"
      - qualification is necessary as Z includes both negative and positive
      - this shows the set of all natural numbers [in terms of Z]

### Set operations

* Set Intersection
  - A∩B
    - "A intersects B"
  - {x.x∈A and x∈B}
    - "The result of the intersection of sets A and B is the set of all values
      x, such that x is an element of A, and x is an element of B"
* Set Union
  - A∪B
    - "A union B"
  - {x.x∈A or x∈B or both}
    - "[The result of the union of sets A and B is] the set of all values x,
      where x is an element of A, or x is an element of B, or both."
* Set Difference
  - A-B
    - "Elements in set A minus the elements in set B"
  - {x.x∈A and x∉B}
    - "[The result of the difference of sets A and B is] the set of all values
      x, such that x is an element of set A, and x is not an element of set B."
* Set Complement
  - Ā or A<sup>C</sup>
    - "A complement"
    - A with line over it [I used U+0100], or A raised to the power of C
      - alternatives that come to my mind (not sure the degree of validity,
        will have to double-check later for proper lofi annotations:
        - `A^C` _as power, not as XOR_
        - `A**C` _as in Python and Ruby_
        - `pow(A, C)`
  - {x.x∉A}
    - "A complement is the set of all values x, such that x is not in the set
      A"
  - Anything except for the values that are in set A
* Universe of Discourse
  - _LEFT OFF HERE 7-May-2021, time index `01:38`_
