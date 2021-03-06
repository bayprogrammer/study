# Clojure for the Brave and True

By Daniel Higginbotham

- Copyright (c) 2015 by Daniel Higginbotham
- [Book Site][1]
- [Hard Copy][2]
- ISBN-10: 1-59327-591-9
- ISBN-13: 978-1-59327-591-4

[1]: https://www.braveclojure.com/
[2]: https://nostarch.com/clojure

## Table of Contents

### [Front Matter](#front-matter-1)

* [X] [Foreword by Alan Dipert](#foreword-by-alan-dipert)
* [X] [Acknowledgments](#acknowledgments)
* [X] [Introduction](#introduction)

### [Part I: Environment Setup](#part-i-environment-setup-1)

* [X] [Chapter 1: Building, Running, and the REPL](#chapter-1-building-running-and-the-repl)
* [ ] [Chapter 2: How to Use Emacs, an Excellent Clojure Editor](#chapter-2-how-to-use-emacs-an-excellent-clojure-editor)

### [Part II: Language Fundamentals](#part-ii-language-fundamentals-1)

* [X] [Chapter 3: Do Things: A Clojure Crash Course](#chapter-3-do-things-a-clojure-crash-course)
* [X] [Chapter 4: Core Functions in Depth](#chapter-4-core-functions-in-depth)
* [X] [Chapter 5: Functional Programming](#chapter-5-functional-programming)
* [X] [Chapter 6: Organizing Your Project: A Librarian’s Tale](#chapter-6-organizing-your-project-a-librarians-tale)
* [X] [Chapter 7: Clojure Alchemy: Reading, Evaluation, and Macros](#chapter-7-clojure-alchemy-reading-evaluation-and-macros)
* [ ] [Chapter 8: Writing Macros](#chapter-8-writing-macros)

### [Part III: Advanced Topics](#part-iii-advanced-topics-1)

* [ ] [Chapter 9: The Sacred Art of Concurrent and Parallel Programming](#chapter-9-the-sacred-art-of-concurrent-and-parallel-programming)
* [ ] [Chapter 10: Clojure Metaphysics: Atoms, Refs, Vars, and Cuddle Zombies](#chapter-10-clojure-metaphysics-atoms-refs-vars-and-cuddle-zombies)
* [ ] [Chapter 11: Mastering Concurrent Processes with core.async](#chapter-11-mastering-concurrent-processes-with-core-async)
* [ ] [Chapter 12: Working with the JVM](#chapter-12-working-with-the-jvm)
* [ ] [Chapter 13: Creating and Extending Abstractions with Multimethods, Protocols, and Records](#chapter-13-creating-and-extending-abstractions-with-multimethods-protocols-and-records)

### [Back Matter](#back-matter-1)

* [ ] [Appendix A: Building and Developing with Leiningen](#appendix-a-building-and-developing-with-leiningen)
* [ ] [Appendix B: Boot, the Fancy Clojure Build Framework](#appendix-b-boot-the-fancy-clojure-build-framework)
* [ ] [Farewell!](#farewell)

-----

## Front Matter

### Foreword by Alan Dipert

### Acknowledgments

### Introduction

## Part I: Environment Setup

### Chapter 1: Building, Running, and the REPL

### Chapter 2: How to Use Emacs, an Excellent Clojure Editor

## Part II: Language Fundamentals

### Chapter 3: Do Things: A Clojure Crash Course

> > It is better to have 100 functions operate on one data structure
> > than 10 functions on 10 data structures.
>
> —Alan Perlis

> <em>Regular expressions</em> are tools for performing pattern matching
> on text. The literal notation for a regular expression is to place the
> expression in quotes after a hash mark:
>
> ```clojure
> #"regular-expression"
> ```

`loop` makes it easy to create and immediately invoke a (potentially
recursive) anonymous lambda with initial bindings; `loop` with `recur`
is pretty nifty.

```
((fn   [n  ] n) 8)  ;=> 8
 (loop [n 8] n)     ;=> 8
```

### Chapter 4: Core Functions in Depth

* Programming to abstractions
  * Sequence and collection abstractions
    * Sequence abstraction
      - About operating on members individually
    * Collection abstraction
      - About data structures as whole
    * vectors, maps, lists, and sets all take part in both abstractions.
  * Sequences
  * Lazy Sequences
* Sequences: vectors, maps, and sets
* Functions to work with sequences:
  * `concat`
  * `conj`
  * `distinct`
  * `drop`
  * `filter`
  * `group-by`
  * `identity`
  * `into`
  * `map`
  * `reduce`
  * `some`
  * `sort-by`
  * `sort`
  * `take`
* Functions to create new functions:
  * `apply`
  * `complement`
  * `partial`
* Clojure defines core collection functions in terms of *sequence
  abstraction*, not of specific data structures
  * Core sequence operations:
    * `first`
    * `rest`
    * `cons`
  * data structures *implement* the sequence abstraction

> ...it's powerful to focus on what we can *do* with a data structure
> and ignore, as much as possible, its implementation.

> If you want an exercise that will really blow your hair back, try
> implementing `map` using `reduce`, and then do the same for `filter`
> and `some` after you read about them later in this chapter.

Accessing a lazy seq's members is knon as *realizing* the seq.

> You can think of a lazy seq as consisting of two parts: a recipe for
> how to realize the elements of a sequence and the elements that have
> been realized so far.

> You'll often see two functions [(e.g. `into` & `conj`)] that do the
> same thing, except one takes a rest parameter (`conj`) and opne takes
> a seqable data structure (`into`)

### Chapter 5: Functional Programming

* pure function:
  * *referential transparency:* function that returns the same result
    for the same input (which is why `rand` is not pure)
  * causes no (externally observable) side-effects (which is why
    `println` is not pure)
* function composition:
  * combining functions such that the value from one is passed to the
    next as an argument
  * fp encouraging building up more complex functions in terms of
    combining simple ones
* functions can derive from functions
  * `partial` (partially apply)
  * `comp` (compose)
  * `memoize` (cache)

Suggested article on Clojure's persistent vector data structure: https://hypirion.com/musings/understanding-persistent-vector-pt-1

Downloaded `pegthing` from: https://github.com/flyingmachine/pegthing

> When you take the time to construct a rich data structure, it's easier
> to perform useful operations.

### Chapter 6: Organizing Your Project: A Librarian’s Tale

Can get to a private variable via teh `@#'some/private-var` syntax; not
advisable most of the time.

The following:

```clojure
(require '[the-divine-cheese-code.visualization.svg :as svg])
```

is equivilant to:

```clojure
(require 'the-divine-cheese-code.visualization.svg)
(alias 'svg 'the-divine-cheese-code.visualization.svg)
```

both leading to our ability to do the following later:

```clojure
(svg/points heists)
```

`use` (which is not recommended for production) does a `require` and
`refer` on the same namespace at once, and optionally can also use the
`:as` keyword to do an `alias`:

```clojure
(use '[the-divine-cheese-code.visualization.svg :as svg])
(= svg/points points)  ;=> true

(= svg/latlng->point latlng->point)  ;=> true
```

`use` accepts the same options as `refer`: `:only`, `:exclude`, `:as`,
and `:rename`.

For all the deets on `require` and friends:
https://clojure.org/reference/libs

With the `ns` macro, which automatically refers `clojure.core`, you can
exclude functions from `clojure.core` like so:

```clojure
(ns the-divine-cheese-code.core
  (:refer-clojure :exclude [println]))
```

The `ns` _references_ you can use are: `(:refer-clojure)`, `(:require)`,
`(:use)`, `(:import)`, `(:load)`, `(:gen-class)`; these correspond more
or less to the associated functions (`:require` for `require`, etc.)

The following:

```clojure
(ns the-divine-cheese-code.core
  (:require the-divine-cheese-code.visualization.svg))
```

is equivilant to:

```clojure
(ns the-divine-cheese-code.core)
(require 'the-divine-cheese-code.visualization.svg)
```

Like using `:as` to `alias` a namespace, etc.

`ns` cheat sheet: https://gist.github.com/ghoseb/287710/

### Chapter 7: Clojure Alchemy: Reading, Evaluation, and Macros

Elements of Clojure's evaluation model: _reader_, _evaluator_, _macro
expander_.

> Homoiconic languages empower you to reason about your code as a set of
> data structures that you can manipulate programatically.

*Reader form*: textual representation of Clojure data structures.

Reading and evaluating are independent functions that can occur separately.

*Reader macro*: set of rules for transforming text into data structures.

*Macro characters*: `'`, `#`, and `@`.

Reader macros are different from regular macros.

> Special forms, like `if`, are always used in the context of an operation;
> they're always teh first element in a list

> A *local binding* is any association between a symbol and a value that wasn't
> created by `def`.

*Special forms*: fundamental behavior provided by Clojure which cannot be
implemented with functions (they don't follow the same evaluation rules).

Some special forms include: `if`, `quote`, `def`, `let`, `loop`, `fn`, `do`,
and `recur`.

> ...macros enable *syntactic abstraction*.

`->` is known as _threading_ or _stabby_ macro.

### Chapter 8: Writing Macros

## Part III: Advanced Topics

### Chapter 9: The Sacred Art of Concurrent and Parallel Programming

### Chapter 10: Clojure Metaphysics: Atoms, Refs, Vars, and Cuddle Zombies

### Chapter 11: Mastering Concurrent Processes with core.async

### Chapter 12: Working with the JVM

### Chapter 13: Creating and Extending Abstractions with Multimethods, Protocols, and Records

## Back Matter

### Appendix A: Building and Developing with Leiningen

### Appendix B: Boot, the Fancy Clojure Build Framework

### Farewell!

