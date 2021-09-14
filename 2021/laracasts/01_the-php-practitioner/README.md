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
* [X] [09 Step 9: Conditionals](#09-step-9-conditionals)
* [X] [10 Step 10: Functions](#10-step-10-functions)
* [X] [11 MySQL 101](#11-mysql-101)
* [X] [12 Classes 101](#12-classes-101)
* [X] [13 Intro to PDO](#13-intro-to-pdo)
* [X] [14 PDO Refactoring and Collaborators](#14-pdo-refactoring-and-collaborators)
* [X] [15 Hide Your Secret Passwords](#15-hide-your-secret-passwords)
* [X] [16 Make a Router](#16-make-a-router)
* [X] [17 Dry Up Your Views](#17-dry-up-your-views)
* [X] [18 Array Filtering](#18-array-filtering)
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

Boolean literals:

```php
<?php

$condition = true
// ...
$condition = false
```

`if`/`else` conditional (else optional if unneeded):

```php
<?php

if ($condition) {
    // do things if $condition is truthy value
} else {
    // do things if $condition is falsy
}
```

Alternative `if` syntax (useful for template-like PHP):

```php
<?php if ($condition): ?>
  <!-- ... -->
<?php else: ?>
  <!-- ... -->
<?php endif; ?>
```

Ternary operator:

```php
<?php

echo $condition ? 'truthy' : 'falsy';
```

Invert truthy value:

```php
<?php

if (!$condition) {
    // do if $condition was falsy
} else {
    // do if $conditoin was truthy
}
```

## 10 Step 10: Functions

```php
<?php

function name($param1, $param2) {
    // function body
}

// call function with arguments
name('foo', 'bar');
```

## 11 MySQL 101

```
mysql> show databases;
mysql> create database mytodo;
mysql> use mytodo;
mysql> show tables;
mysql> create table todos (description text, completed boolean);
mysql> show tables;
mysql> describe todos;
mysql> drop table todos;
mysql> show tables;
mysql> create table todos (description text NOT NULL, completed boolean NOT NULL);
mysql> show tables;
mysql> describe todos;
mysql> drop table todos;
mysql> create table todos (id integer PRIMARY KEY AUTO_INCREMENT, description text NOT NULL, completed boolean NOT NULL);
mysql> show tables;
mysql> describe todos;
mysql> insert into todos (description, completed) values('Go to the store', false);
mysql> select * from todos;
mysql> insert into todos (description, completed) values('finish up screencast', false);
mysql> update todos set completed=1 where id=1;
mysql> select * from todos;
mysql> select * from todos where id=1;
```

## 12 Classes 101

Function within a class is a method. The special `__construct()` method defines
the class' constructor method. The `$this` special variable refers to the
current instance of the class. We can use that instance variable to set and
access member properties.

```php
<?php

class Fruit {
    protected $name;
    public $deliciousnessScore;

    public function __construct($name, $deliciousnessScore)
    {
        $this->name = $name;
        $this->deliciousnessScore = $deliciousnessScore;
    }

    // can have method with same name as property
    public function name()
    {
        return $this->name;
    }

    public function formattedName()
    {
        return ucwords($this->name);
    }
}

$apple = new Fruit('apple', 7);
$apple->name();  //=> 'apple'
$apple->formattedName();  //=> 'Apple'
$apple->deliciousnessScore;  //=> 7
```

## 13 Intro to PDO

_PDO_ stands for "PHP Data Objects", and is a built-in class provided by PHP
for working with databases.

_DSN_: the connection string needed by `PDO` to know how to connect to the
database.

In PHP we can use `try` blocks to run code and catch exceptions thrown in that
context.

```php
<?php

try {
  $pdo = new PDO('mysql:host=localhost;dbname=mytodo', 'zebdeos', '');
} catch (PDOException $e) {
  // handle exception $e
  die("Could not connect to database: {$e->getMessage()}");
}
```

```
$ mysql
mysql> use mytodo;
mysql> show tables;
mysql> describe todos;
mysql> insert into todos (description, completed) values('Clean house', false);
mysql> insert into todos (description, completed) values('Contribute to open source project', false);
mysql> update todos set completed=1 where id=4;
```

We can prepare a statement, execute it, then fetch the results:

```php
<?php

$statement = $pdo->prepare('select * from todos');

$statement->execute();

// fetch as combined indexed array and associative array
dd($statement->fetchAll());

// fetch results into a generic object
dd($statement->fetchAll(PDO::FETCH_OBJ));

// fetch results into instances of a specific class
dd($statement->fetchAll(PDO::FETCH_CLASS, 'Task');
```

Do not use deprecated DB functions such as `mysql_connect()`. Best practice is
to use PDO.

Be careful with `fetchAll()`; use alternatives to fetch individual results or
to page through results using a cursor to avoid out-of-memory issues.

### Notes on MariaDB Connection Troubleshooting

Could not connect at first. MariaDB says it's socket is at
`/run/mysqld/mysqld.sock`:

```
$ mysql -e 'select @@socket'
/run/mysqld/mysqld.sock
```

The default according to the
[relevant docs](https://www.php.net/manual/en/ref.pdo-mysql.php#pdo-mysql.configuration)
is `/tmp/mysql.sock`.

Since I'm using PHP from Homebrew, but MariaDB from the system package manager,
it looks like I need to specify the socket path via configuration system-wide.
`phpinfo()` says the system `php.ini` file for this instance of PHP is located
at `/home/linuxbrew/.linuxbrew/etc/php/8.0`.

```
$ nvim /home/linuxbrew/.linuxbrew/etc/php/8.0/php.ini
```

Updated `php.ini`:

```
# ...

[Pdo_mysql]
; Default socket name for local MySQL connects.  If empty, uses the built-in
; MySQL defaults.
pdo_mysql.default_socket=/run/mysqld/mysqld.sock

# ...
```

Since I'm using a custom unit file to manage `php-fpm`, I also need to restart
it after updating the `php.ini` config:

```
$ sudo systemctl restart homebrew-php-fpm
```

These links were handy in figuring this out:

* https://www.php.net/manual/en/configuration.changes.modes.php
* https://www.php.net/manual/en/pdo.construct.php
* https://www.php.net/manual/en/ref.pdo-mysql.php
* https://stackoverflow.com/questions/39791715/mysql-connection-via-unix-socket-works-with-mysqli-but-not-with-pdo

## 14 PDO Refactoring and Collaborators

_Refactoring_: improving the structure of the code without changing it's
observable behavior.

We can use the `static` modifier for a new method to make it accessible via the
class directly, rather than through a specific instance. (This would be a
"class method" in Ruby parlance.) We all such static methods directly on the
class, like so:

```php
<?php

class Foo
{
    public static function bar()
    {
        return 'baz';
    }
}

Foo::bar();  //=> 'baz'
```

Can optionally provide _type hints_ in PHP.

You can return a value from a file which is required, and then assign that
returned value to a variable in another file (still in global scope until we
get to namespaces, but it's centralizing the global defines to the entry point
file).

`array_map()` allows you to pass a lambda and array and process each array
element as an argument to that lambda (c.f. Ruby's `Array#map`, etc.).

```php
<?php

$fruits = [
    'apple',
    'blueberry',
    'cherry',
    'durian'
];

array_map(function ($fruit) {
    return ucwords($fruit);
}, $fruits)
```

## 15 Hide Your Secret Passwords

## 16 Make a Router

The `$_SERVER` superglobal has a key, `REQUEST_URI`, whose value we can use to
route URIs to controllers.

```php
<?php

echo $_SERVER['REQUEST_URI'];
```

The `trim()` function can be passed an optional second argument to specify
which character to trim from the beginning and end of string (by default it
trims whitespace).

Write code, see it fail, make it work. _(This is what SICP calls "the power of
wishful thinking", and is closely related to TDD.)_

We can instance a class from a static method using `self` or `static`:

```php
<?php

// is it Ruby? Is it Perl? No... it's PHP!
class Foo
{
    public $name;

    public static function new($name)
    {
        return new static($name);
    }

    public function __construct($name)
    {
        $this->name = $name;
    }
}

$f1 = new Foo("Bob");     //=> Foo {#... +name: "Bob", }
$f2 = Foo::new("Sally");  //=> Foo {#... +name: "Sally", }

$f1->name;                //=> "Bob"
$f2->name;                //=> "Sally"
```

## 17 Dry Up Your Views

## 18 Array Filtering

There are a multitude of array-related functions in the PHP core library:

- https://www.php.net/manual/en/ref.array.php

A handful will be used very frequently:

- [`array_filter`](https://www.php.net/manual/en/function.array-filter.php)
- [`array_map`](https://www.php.net/manual/en/function.array-map.php)
- [`array_column`](https://www.php.net/manual/en/function.array-column.php)

## 19 Forms, Request Types, and Routing

## 20 Dynamic Inserts With PDO

## 21 Composer Autoloading

## 22 Your First DI Container

## 23 Refactoring to Controller Classes

## 24 Switch to Namespaces

## 25 Meet Your Batteries Included Framework: Laravel
