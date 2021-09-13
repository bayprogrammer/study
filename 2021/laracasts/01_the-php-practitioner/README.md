# The PHP Practitioner

[Laracasts Video Course][1] by [Jeffrey Way][2]

[1]: https://laracasts.com/series/php-for-beginners
[2]: https://github.com/JeffreyWay

## Table of Contents

* [X] [01 Step 1: Get PHP Installed](#01-step-1-get-php-installed)
* [X] [02 Step 2: Install a Proper Code Editor](#02-step-2-install-a-proper-code-editor)
* [X] [03 Step 3: Variables](#03-step-3-variables)
* [X] [04 Step 4: PHP and HTML](#04-step-4-php-and-html)
* [X] [05 Step 5: Separate PHP Logic From Presentation](#05-step-5-separate-php-logic-from-presentation)
* [X] [06 Step 6: Understanding Arrays](#06-step-6-understanding-arrays)
* [X] [07 Step 7: Associative Arrays](#07-step-7-associative-arrays)
* [X] [08 Step 8: Booleans](#08-step-8-booleans)
* [ ] [09 Step 9: Conditionals](#09-step-9-conditionals)
* [ ] [10 Step 10: Functions](#10-step-10-functions)
* [ ] [11 MySQL 101](#11-mysql-101)
* [ ] [12 Classes 101](#12-classes-101)
* [ ] [13 Intro to PDO](#13-intro-to-pdo)
* [ ] [14 PDO Refactoring and Collaborators](#14-pdo-refactoring-and-collaborators)
* [ ] [15 Hide Your Secret Passwords](#15-hide-your-secret-passwords)
* [ ] [16 Make a Router](#16-make-a-router)
* [ ] [17 Dry Up Your Views](#17-dry-up-your-views)
* [ ] [18 Array Filtering](#18-array-filtering)
* [ ] [19 Forms, Request Types, and Routing](#19-forms-request-types-and-routing)
* [ ] [20 Dynamic Inserts With PDO](#20-dynamic-inserts-with-pdo)
* [ ] [21 Composer Autoloading](#21-composer-autoloading)
* [ ] [22 Your First DI Container](#22-your-first-di-container)
* [ ] [23 Refactoring to Controller Classes](#23-refactoring-to-controller-classes)
* [ ] [24 Switch to Namespaces](#24-switch-to-namespaces)
* [ ] [25 Meet Your Batteries Included Framework: Laravel](#25-meet-your-batteries-included-framework-laravel)

-----

## 01 Step 1: Get PHP Installed

## 02 Step 2: Install a Proper Code Editor

## 03 Step 3: Variables

```
$ php -h
```

Run built-in server:

```
$ cd php-learning
$ php -S localhost:8888
```

## 04 Step 4: PHP and HTML

## 05 Step 5: Separate PHP Logic From Presentation

## 06 Step 6: Understanding Arrays

```php
<?php

$fruits = [
    'apple',
    'blueberry',
    'cherry'
];
```

Loop through an array:

```php
<?php

foreach ($fruits as $fruit) {
    // ...
}
```

Alternative syntax useful for a template-like context:

```php
<?php foreach ($fruits as $fruit): ?>
  <!-- ... -->
<?php endforeach; ?>
```

Push new value on to the array:

```php
<?php

$fruits[] = 'durian';
```

Remove an element from the array using unset:

```php
<?php

unset($fruits[0]);
```

## 07 Step 7: Associative Arrays

Associative arrays consist of any number of key-value pairs separated by `=>`:

```php
<?php

$fruits = [
    'a' => 'apple',
    'b' => 'blueberry',
    'c' => 'cherry'
];
```

We can loop through the array like before, which extracts just the values:

```php
<?php

foreach ($fruits as $fruit) {
    // ...
}
```

Or we can loop through key and value using `=>` syntax which mirrors the
associative array literal, assigning names to each as we see fit:

```php
<?php

foreach ($fruits as $letter => $name) {
    // ...
}
```

Push a new key-value pair on to the array:

```php
<?php

$fruits['d'] = 'durian';
```

Remove a key-value pair using `unset()` like so:

```php
<?php

unset($fruits['a']);
```

To output a representation a non-scalar value (e.g. an array), use the
`var_dump()` function:

```php
<?php

var_dump($fruits);
```

You can wrap that in `<pre>` to retain indentation when displaying in a browser
(vs. console).

Use `die()` in conjunction with `var_dump()` to immediately exit with the debug
output without further processing of your program:

```php
<?php

die(var_dump($fruits));
```

## 08 Step 8: Booleans

`ucwords()` function capitalizes its input:

```php
<?php

ucwords('foo');  //=> Foo
```

## 09 Step 9: Conditionals

## 10 Step 10: Functions

## 11 MySQL 101

## 12 Classes 101

## 13 Intro to PDO

## 14 PDO Refactoring and Collaborators

## 15 Hide Your Secret Passwords

## 16 Make a Router

## 17 Dry Up Your Views

## 18 Array Filtering

## 19 Forms, Request Types, and Routing

## 20 Dynamic Inserts With PDO

## 21 Composer Autoloading

## 22 Your First DI Container

## 23 Refactoring to Controller Classes

## 24 Switch to Namespaces

## 25 Meet Your Batteries Included Framework: Laravel
