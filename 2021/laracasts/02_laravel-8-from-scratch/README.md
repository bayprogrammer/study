# Laravel 8 From Scratch

[Laracasts Video Course][1] by [Jeffrey Way][2]

[1]: https://laracasts.com/series/laravel-8-from-scratch
[2]: https://github.com/JeffreyWay

## Table of Contents

### [Section 1, Prerequisites and Setup](#section-1-prerequisites-and-setup-1)

* [X] [01 An Animated Introduction to MVC](#01-an-animated-introduction-to-mvc)
* [X] [02 Initial Environment Setup and Composer](#02-initial-environmental-setup-and-composer)
* [X] [03 The Laravel Installer Tool](#03-the-laravel-installer-tool)
* [X] [04 Why Do We Use Tools](#04-why-do-we-use-tools)

### [Section 2, The Basics](#section-2-The-basics-1)

* [X] [05 How a Route Loads a View](#05-how-a-route-loads-a-view)
* [X] [06 Include CSS and JavaScript](#06-include-css-and-javascript)
* [X] [07 Make a Route and Link to it](#07-make-a-route-and-link-to-it)
* [X] [08 Store Blog Posts as HTML Files](#08-store-blog-posts-as-html-files)
* [X] [09 Route Wildcard Constraints](#09-route-wildcard-constraints)
* [X] [10 Use Caching for Expensive Operations](#10-use-caching-for-expensive-operations)
* [X] [11 Use the Filesystem Class to Read a Directory](#11-use-the-filesystem-class-to-read-a-directory)
* [X] [12 Find a Composer Package for Post Metadata](#12-find-a-composer-package-for-post-metadata)
* [X] [13 Collection Sorting and Caching Refresher](#13-collection-sorting-and-caching-refresher)

### [Section 3, Blade](#section-3-blade-1)

* [X] [14 Blade: The Absolute Basics](#14-blade-the-absolute-basics)
* [X] [15 Blade Layouts Two Ways](#15-blade-layouts-two-ways)
* [X] [16 A Few Tweaks and Consideration](#16-a-few-tweaks-and-consideration)

### [Section 4, Working With Databases](#section-4-working-with-databases-1)

* [X] [17 Environment Files and Database Connections](#17-environment-files-and-database-connections)
* [X] [18 Migrations: The Absolute Basics](#18-migrations-the-absolute-basics)
* [X] [19 Eloquent and the Active Record Pattern](#19-eloquent-and-the-active-record-pattern)
* [X] [20 Make a Post Model and Migration](#20-make-a-post-model-and-migration)
* [X] [21 Eloquent Updates and HTML Escaping](#21-eloquent-updates-and-html-escaping)
* [X] [22 3 Ways to Mitigate Mass Assignment Vulnerabilities](#22-3-ways-to-mitigate-mass-assignment-vulnerabilities)
* [ ] [23 Route Model Binding](#23-route-model-binding)
* [ ] [24 Your First Eloquent Relationship](#24-your-first-eloquent-relationship)
* [ ] [25 Show All Posts Associated With a Category](#25-show-all-posts-associated-with-a-category)
* [ ] [26 Clockwork, and the N+1 Problem](#26-clockwork-and-the-n1-problem)
* [ ] [27 Database Seeding Saves Time](#27-database-seeding-saves-time)
* [ ] [28 Turbo Boost With Factories](#28-turbo-boost-with-factories)
* [ ] [29 View All Posts By An Author](#29-view-all-posts-by-an-author)
* [ ] [30 Eager Load Relationships on an Existing Model](#30-eager-load-relationships-on-an-existing-model)

### [Section 5, Integrate the Design](#section-5-integrate-the-design-1)

* [ ] [31 Convert the HTML and CSS to Blade](#31-convert-the-html-and-css-to-blade)
* [ ] [32 Blade Components and CSS Grids](#32-blade-components-and-css-grids)
* [ ] [33 Convert the Blog Post Page](#33-convert-the-blog-post-page)
* [ ] [34 A Small JavaScript Dropdown Detour](#34-a-small-javascript-dropdown-detour)
* [ ] [35 How to Extract a Dropdown Blade Component](#35-how-to-extract-a-dropdown-blade-component)
* [ ] [36 Quick Tweaks and Clean-Up](#36-quick-tweaks-and-clean-up)

### [Section 6, Search](#section-6-search-1)

* [ ] [37 Search (The Messy Way)](#37-search-the-messy-way)
* [ ] [38 Search (The Cleaner Way)](#38-search-the-cleaner-way)

### [Section 7, Filtering](#section-7-filtering-1)

* [ ] [39 Advanced Eloquent Query Constraints](#39-advanced-eloquent-query-constraints)
* [ ] [40 Extract a Category Dropdown Blade Component](#40-extract-a-category-dropdown-blade-component)
* [ ] [41 Author Filtering](#41-author-filtering)
* [ ] [42 Merge Category and Search Queries](#42-merge-category-and-search-queries)
* [ ] [43 Fix a Confusing Eloquent Query Bug](#43-fix-a-confusing-eloquent-query-bug)

### [Section 8, Pagination](#section-8-pagination-1)

* [ ] [44 Laughably Simple Pagination](#44-laughably-simple-pagination)

### [Section 9, Forms and Authentication](#section-9-forms-and-authentication-1)

* [ ] [45 Build a Register User Page](#45-build-a-register-user-page)
* [ ] [46 Automatic Password Hashing With Mutators](#46-automatic-password-hashing-with-mutators)
* [ ] [47 Failed Validation and Old Input Data](#47-failed-validation-and-old-input-data)
* [ ] [48 Show a Success Flash Message](#48-show-a-success-flash-message)
* [ ] [49 Login and Logout](#49-login-and-logout)
* [ ] [50 Build the Log In Page](#50-build-the-log-in-page)
* [ ] [51 Laravel Breeze Quick Peek](#51-laravel-breeze-quick-peek)

### [Section 10, Comments](#section-10-comments-1)

* [ ] [52 Write the Markup for a Post Comment](#52-write-the-markup-for-a-post-comment)
* [ ] [53 Table Consistency and Foreign Key Constraints](#53-table-consistency-and-foreign-key-constraints)
* [ ] [54 Make the Comments Section Dynamic](#54-make-the-comments-section-dynamic)
* [ ] [55 Design the Comment Form](#55-design-the-comment-form)
* [ ] [56 Activate the Comment Form](#56-activate-the-comment-form)
* [ ] [57 Some Light Chapter Clean Up](#57-some-light-chapter-clean-up)

### [Section 11, Newsletters and APIs](#section-11-newsletters-and-apis-1)

* [ ] [58 Mailchimp API Tinkering](#58-mailchimp-api-tinkering)
* [ ] [59 Make the Newsletter From Work](#59-make-the-newsletter-from-work)
* [ ] [60 Extract a Newsletter Service](#60-extract-a-newsletter-service)
* [ ] [61 Toy Chests and Contracts](#61-toy-chests-and-contracts)

### [Section 12, Admin Section](#section-12-admin-section-1)

* [ ] [62 Limit Access to Only Admins](#62-limit-access-to-only-admins)
* [ ] [63 Create the Publish Post Form](#63-create-the-publish-post-form)
* [ ] [64 Validate and Store Post Thumbnails](#64-validate-and-store-post-thumbnails)
* [ ] [65 Extract Form-Specific Blade Components](#65-extract-form-specific-blade-components)
* [ ] [66 Extend the Admin Layout](#66-extend-the-admin-layout)
* [ ] [67 Create a Form to Edit and Delete Posts](#67-create-a-form-to-edit-and-delete-posts)
* [ ] [68 Group and Store Validation Logic](#68-group-and-store-validation-logic)
* [ ] [69 All About Authorization](#69-all-about-authorization)

### [Section 13, Conclusion](#section-13-conclusion-1)

* [ ] [70 Goodbye and Next Steps](#70-goodbye-and-next-steps)

-----

## Section 1, Prerequisites and Setup

### 01 An Animated Introduction to MVC

### 02 Initial Environment Setup and Composer

We have PHP, MariaDB (MySQL), Composer, and Laravel already installed and ready
to go. We're ready!

```
$ laravel new blog
$ cd blog
$ valet link
$ xdg-open 'http://blog.test'
```

### 03 The Laravel Installer Tool

This is what I use. This is what I used in the previous section. :-D

### 04 Why Do We Use Tools

Optional HTML and CSS Workshop detour is very tempting, but we must push
through on core Laravel for now as the higher priority.

## Section 2, The Basics

### 05 How a Route Loads a View

### 06 Include CSS and JavaScript

The `resources/css` and `resources/js` directories are intended to be used with
a bundling tool. For our early experiments, we will place our `js` and `css`
assets (which do not require a resource bundler or compilation step) direclty
in the `public` directory. They are just static resources.

```
$ touch public/app.css
$ touch public/app.js
```

### 07 Make a Route and Link to it

### 08 Store Blog Posts as HTML Files

- [Filesystem Functions](https://www.php.net/manual/en/ref.filesystem.php)
  - [`file_get_contents`](https://www.php.net/manual/en/function.file-get-contents.php)
  - [`file_exists`](https://www.php.net/manual/en/function.file-exists.php)
- `__DIR__`: path to directory containing current file
- We specify path parameters in a route as Laravel "wildcards", e.g.
  `'/post/{post}'`
- `dd`: Dump, Die
- `ddd`: Dump, Die, Debug (Laravel-style)
- `abort`: Laravel-provided helper, can pass status code integer: `abort(404)`
- `redirect`: Laravel-provided helper, return a redirect: `return redirect('/path')`

### 09 Route Wildcard Constraints

- `where` constraint can be applied to a route to constrain the wildcard to a
  specific validation or pattern, passing it the param you want to constrain
  and a regular expression to use as the constraint.
- `whereAlpha`
- `whereAlphaNumeric`
- `whereNumber`

### 10 Use Caching for Expensive Operations

- `cache()->remember("uniq.key", 3600, function () { /* ... */ })`
  - second arg is time in seconds
  - third arg calculates the data (which will only be re-calculated when the
    cache expires for this key)
  - `use ($var)` allows closure made with `function () {}` to capture a
    variable from the outer scope
    - _side note: why do we call them closures if they don't close over their
      containing evironment?_ :zany-face:
- `now()->addMinutes(20)` - cool!
  - See also `addMinute`, `addHour`, `addHours`, `addDay`, `addDays`, etc.
  - https://carbon.nesbot.com/docs/#api-addsub

Using traditional anonymous function ("closure"):

```php
<?php

$path = ...;
$post = cache()->remember("posts.{$slug}", 3600, function () use ($path) {
    return file_get_contents($path);
});
```

Using arrow function (single expression lambda, a proper closure in a way that
makes my Scheming heart sing):

```php
<?php

$path = ...;
$post = cache()
    ->remember("posts.{$slug}", 3600, fn() => file_get_contents($path));
```

Now, PHP, all you need to give me are multi-expression arrow functions, and I
shall be very _very_ happy. :)

### 11 Use the Filesystem Class to Read a Directory

- `base_path` - return base path for the project
- `app_path`
- `resource_path`
- `ModelNotFoundException` - these are not the droids you're looking for
  - `Illuminate\Database\Eloquent\ModelNotFoundException`
- `File` facade
  - `Illuminate\Support\Facades\File`

### 12 Find a Composer Package for Post Metadata

- yaml frontmatter
- https://github.com/spatie/yaml-front-matter
- https://spatie.be/open-source?search=&sort=-downloads
- `Spatie\YamlFrontMatter\YamlFrontMatter`
- Laravel Collections - more fluent OO interface for working with arrays
  - `collect` - collect an array and wrap it in an Collection object
  - wrapper class provides many useful methods for interacting with a
    collection in clean way (c.f. Ruby's `Enumerable`)

```
$ composer require spatie/yaml-front-matter
```

Wrapping the results from an underlying tech (like `YamlFrontMatter`) in your
own domain model class; creating a useful layer of abstraction that you can
mould to the needs of your application.

Processing posts using `foreach`:

```php
<?php

$files = File::files(resource_path('posts'));

$posts = [];
foreach ($files as $file) {
    $document = YamlFrontMatter::parseFile($file);
    $posts[] = new Post(
        $document->title,
        $document->excerpt,
        $document->date,
        $document->body(),
        $document->slug
    );
}
```

Processing posts using `array_map`:

```php
<?php

$files = File::files(resource_path('posts'));

$posts = array_map(function ($file) {
    $document = YamlFrontMatter::parseFile($file);
    return new Post(
        $document->title,
        $document->excerpt,
        $document->date,
        $document->body(),
        $document->slug
    );
}, $files);
```

Processing posts using Collections:

```php
<?php

$files = File::files(resource_path('posts'));

$posts = collect($files)->map(function ($file) {
    $document = YamlFrontMatter::parseFile($file);
    return new Post(
        $document->title,
        $document->excerpt,
        $document->date,
        $document->body(),
        $document->slug
    );
});
```

We can then use Collections and method chaining to clean things up even
further:

```php
<?php

$posts = collect(File::files(resource_path('posts')))
    ->map(function ($file) {
        return YamlFrontMatter::parseFile($file);
    })
    ->map(function ($document) {
        return new Post(
            $document->title,
            $document->excerpt,
            $document->date,
            $document->body(),
            $document->slug
        );
    });
```

And once we're at that point, we no longer need more than a single expression
per closure, and thus can switch to the arrow functions:

```php
<?php

$posts = collect(File::files(resource_path('posts')))
    ->map(fn ($file) => YamlFrontMatter::parseFile($file))
    ->map(fn ($document) => new Post(
        $document->title,
        $document->excerpt,
        $document->date,
        $document->body(),
        $document->slug
    ));
```

This progression of improvement in how to process a collection is really quite
nice. I'm partial to the Collections way of doing things already though, as
it's very similar to the way we do things in Ruby.

### 13 Collection Sorting and Caching Refresher

- `cache()->rememberForever('posts.all')`
- `cache('posts.all')`, `cache()->get('posts.all')`
- `cache()->forget('posts.all')`

We can manage the cache directly

```php
<?php

cache()->put('foo', 'bar');
cache()->get('foo');  //=> 'bar'
cache('foo');         //=> 'bar'

cache(['foo' => 'baz']);
cache()->get('foo');  //=> 'baz'
cache('foo');         //=> 'baz'

cache(['foo' => 'buzz'], now()->addSeconds(3));
// 1 second later:
cache('foo');         //=> 'buzz'
// 4 seconds later:
cache('foo');         //=> null
```

The next logical step for improvement is to begin using "service providers" to
delgate bootstrapping various components and systems within our app; see
`app/Providers`.

## Section 3, Blade

### 14 Blade: The Absolute Basics

Blade is Laravel's templating engine; it is a superset of baseic PHP, adding
convenient template-friendly sugar on top of the facilities of raw PHP.

Echoing out an HTML-escaped string:

```
{{ $post->title }}
```

Echoing out a raw string:

```
{!! $post->body !!}
```

Which is equivalent to:

```php
<?php echo $post->title; ?>

<!-- and -->

<?= $post->title; ?>
```

The following Blade directive...

```
@foreach ($posts as $post)
    <!-- ... -->
@endforeach
```

...can replace the following vanilla PHP:

```php
<?php foreach ($posts as $post): ?>
    <!-- ... -->
<?php endforeach; ?>
```

There are many other directives, including other equivalents for standard PHP
control structures (as with `@foreach` above), as well as convenient short cuts
for calling functions like `@dd`.

Logs can be found under `storage/logs/laravel.log`. The compiled blade views
can be found under `storage/framework/views`.

### 15 Blade Layouts Two Ways

- Way #1: Layouts:
  - `@yield('content')` directive - similar to that of Ruby on Rails usage,
    specifies named section that another layout may render into
  - `@extends('layout')` directive - allow view to "inherit" from layout
    (coresponds to `layout.blade.php`)
    - inject content into yielded id block with `@section('content')` and
      `@endsection` directives.
  - You yield and more than one named section (not restricted to just one)
- Way #2: Blade Components:
  - `views/components`
    - Any files added to this directory will be automatically avaialable to
      your views as a Blade component.
    - `views/components/layout.blade.php` can be used as a tag in views:
      `<x-layout>...</x-layout>`.
    - The `$slot` variable defines the default slot; otherwise you can name
      slots anything you want and refer to them either via tag attributes or
      via the `<x-slot name="...">` tag.

This Blade component (defined in
`resources/views/components/layout.blade.php`)...

```php
<div>
    {{ $content }}
</div>
```

...can be used like this:

```php
<x-layout content="Hello, world.">
</x-layout>

<x-layout>
    <x-slot name="content">
        Hello, world.
    </x-slot>
</x-layout>
```

Whereas using `$slot`...

```php
<div>
    {{ $slot }}
</div>
```

...we can just use it like so:

```php
<x-layout>
    Hello, world.
</x-layout>
```

Both layouts and components are equally valid ways to structure views in
Laravel; one is no better than the other. Use whichever best fits your needs.

#### Cloning Laravel App to New System

I needed to run the following to boot my Laravel app on a new system:

```
$ cp .env.example .env
$ php artisan key:generate
```

### 16 A Few Tweaks and Consideration

## Section 4, Working With Databases

### 17 Environment Files and Database Connections

- `.env` allows us to set secrets via the environment
- `env('VAR', 'fallback value')`, allows us to pull settings from environment

For local dev for how I have things setup:

```
DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=blog
DB_USERNAME=zebdeos
DB_PASSWORD=
```

Create & run intial migrations for our app's database:

```
$ mysql
mysql> create database blog;
mysql> ^D
$ php artisan migrate
$ mysql
mysql> use blog;
mysql> show tables;
mysql> describe users;
```

### 18 Migrations: The Absolute Basics

```
$ php artisan migrate:rollback
$ php artisan migrate
$ php artisan migrate:fresh
$ mysql -c blog
mysql> insert into users (username, email, password)
         values ('bayprogrammer', 'zebdeos@bayprogrammer.com', 'asldkjfalsdfj');
mysql> ^D
$ php artisan migrate:fresh
```

### 19 Eloquent and the Active Record Pattern

```
$ php artisan migrate:fresh
$ php artisan tinker
>>> $user = new App\Models\User
>>> $user->name = 'bayprogrammer'
>>> $user->email = 'zebdeos@bayprogrammer.com'
>>> $user->password = bcrypt('!password')
>>> ^Z
$ mysql
mysql> select name from users;
Empty set (0.001 sec)
mysql> ^Z
$ fg %1
>>> $user->save()
>>> ^Z
$ fg %2
mysql> select name from users;
+---------------+
| name          |
+---------------+
| bayprogrammer |
+---------------+
1 row in set (0.000 sec)
mysql> ^Z
$ fg %1
>>> $user->name = 'johndoe'
>>> $user->save()
>>> ^Z
$ fg %2
mysql> select name from users;
+---------+
| name    |
+---------+
| johndoe |
+---------+
1 row in set (0.001 sec)
mysql> ^Z
$ fg %1
>>> User::find(1)
>>> User::find(1000)  //=> null
>>> User::findOrFail(1000)  //=> BANG!
>>> User::all()
>>> $user = new User;
>>> $user->name = 'Sally'
>>> $user->email = 'sally@example.com'
>>> $user->password = bcrypt('sally!')
>>> $user->save()
>>> $users = User::all()
>>> $users->pluck('name')
=> Illuminate\Support\Collection {#4128
     all: [
       "johndoe",
       "Sally",
     ],
   }
>>> $users->map(function ($user) { return $user->name; })
>>> $users->map(fn($user) => $user->name)
>>> $users->first()
>>> $users->last()
>>> $users[0]
>>> $users[1]
```

### 20 Make a Post Model and Migration

```
$ php artisan make:migration
$ php artisan make:migration create_posts_table
$ php artisan migrate
$ mysql
mysql> describe posts;
+--------------+---------------------+------+-----+---------+----------------+
| Field        | Type                | Null | Key | Default | Extra          |
+--------------+---------------------+------+-----+---------+----------------+
| id           | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| title        | varchar(255)        | NO   |     | NULL    |                |
| excerpt      | text                | NO   |     | NULL    |                |
| body         | text                | NO   |     | NULL    |                |
| created_at   | timestamp           | YES  |     | NULL    |                |
| updated_at   | timestamp           | YES  |     | NULL    |                |
| published_at | timestamp           | YES  |     | NULL    |                |
+--------------+---------------------+------+-----+---------+----------------+
7 rows in set (0.003 sec)
```

As a general rule of thumb, your migration name should describe what the
migration does.

The model name is the singular version of the table name (`posts -> Post`).

```
$ php artisan make:model Post
$ php artisan tinker
>>> App\Models\Post::all()
>>> App\Models\Post::all()->isEmpty()  //=> true
>>> App\Models\Post::count()           //=> 0
>>> new App\Models\Post
>>> $post = $_
>>> $post->title = 'My First Post'
>>> $post->excerpt = 'Lorem ipsum dolar sit amet.'
>>> $post->body = 'Suscipit omnis accusantium incidunt eum et sunt. Et quod adipisci magni ad ut omnis sint. Dolorum aut eum accusamus et vitae. Ea et sit ut. Magnam quod quo cum reiciendis consequatur eveniet. Voluptatum perferendis sunt natus ea tenetur voluptatem.'
>>> $post->save()
>>> ^D
$ mysql -c blog -e 'select * from posts'
$ php artisan tinker
>>> use App\Models\Post
>>> Post::count()  //=> 1
>>> Post::all()
>>> Post::first()
>>> Post::find(1)
>>> $post = new App\Models\Post
>>> $post->title = 'Eloquent is Amazing'
>>> $post->excerpt = 'Lorem ipsum dolar sit amet.'
>>> $post->body = 'Ut dolorem reprehenderit similique a deleniti. Accusamus delectus quia quia magnam. Enim aut non nostrum eos tempora. Hic est maxime quis ut ducimus. Alias ratione ut fugit exercitationem. Officia rerum quas consequuntur.'
>>> $post->save()
```

### 21 Eloquent Updates and HTML Escaping

```
$ php artisan tinker
>>> $post = App\Models\Post::first()
>>> $post->body = '<p>' . $post->body . '</p>'
>>> $post->save()
>>> $post = App\Models\Post::find(2)
>>> $post->body = '<p>' . $post->body . '</p>'
>>> $post->save()
>>> use App\Models\Post
>>> $post = Post::first()
>>> $post->title = 'My <strong>First</strong> Post'
>>> $post->save()
>>> $post->title = 'My <script>alert("hello")</script> Post'
>>> $post->save()
```

Beware trusting untrusted data!

### 22 3 Ways to Mitigate Mass Assignment Vulnerabilities

```
$ php artisan tinker
>>> use App\Models\Post
>>> $post = new Post
>>> $post->title = 'My Third Post'
>>> $post->excerpt = 'excerpt of post'
>>> $post->body = 'Ut dolorem reprehenderit similique a deleniti. Accusamus delectus quia quia magnam. Enim aut non nostrum eos tempora. Hic est maxime quis ut ducimus. Alias ratione ut fugit exercitationem. Officia rerum quas consequuntur.'
>>> $post->save()
>>> $post = Post::first()
>>> $post->title = 'My <strong>First</strong> Post'
>>> $post->save()
>>> Post::create(['title' => 'My Fourth Post', 'excerpt' => 'excerpt of post', 'body' => 'Ut dolorem reprehenderit similique a deleniti. Accusamus delectus quia quia magnam. Enim aut non nostrum eos tempora. Hic est maxime quis ut ducimus. Alias ratione ut fugit exercitationem. Officia rerum quas consequuntur.'])
=> BANG!
```

**NOTE(zmd):** _LEFT OFF_ time index`01:11`

#### Setup app on yet another computer

```
$ composer install
$ mysql
mysql> create database blog;
mysql> ^D
$ cp .env.example .env
$ nvim .env
$ php artisan key:generate
$ grep '^DB_' .env
DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=blog
DB_USERNAME=zebdeos
DB_PASSWORD=
$ php artisan migrate
$ php artisan tinker
>>> $post = new App\Models\Post
>>> $post->title = 'My First Post'
>>> $post->excerpt = 'Lorem ipsum dolar sit amet.'
>>> $post->body = 'Suscipit omnis accusantium incidunt eum et sunt. Et quod adipisci magni ad ut omnis sint. Dolorum aut eum accusamus et vitae. Ea et sit ut. Magnam quod quo cum reiciendis consequatur eveniet. Voluptatum perferendis sunt natus ea tenetur voluptatem.'
>>> $post->save()
>>> $post = new App\Models\Post
>>> $post->title = 'Eloquent is Amazing'
>>> $post->excerpt = 'Lorem ipsum dolar sit amet.'
>>> $post->body = 'Ut dolorem reprehenderit similique a deleniti. Accusamus delectus quia quia magnam. Enim aut non nostrum eos tempora. Hic est maxime quis ut ducimus. Alias ratione ut fugit exercitationem. Officia rerum quas consequuntur.'
>>> $post->save()
>>> $post = App\Models\Post::first()
>>> $post->body = '<p>' . $post->body . '</p>'
>>> $post->save()
>>> $post = App\Models\Post::find(2)
>>> $post->body = '<p>' . $post->body . '</p>'
>>> $post->save()
>>> $post = Post::first()
>>> $post->title = 'My <strong>First</strong> Post'
>>> $post->save()
>>> $post->title = 'My <script>alert("hello")</script> Post'
>>> $post->save()
>>> ^D
```

### 23 Route Model Binding

### 24 Your First Eloquent Relationship

### 25 Show All Posts Associated With a Category

### 26 Clockwork, and the N+1 Problem

### 27 Database Seeding Saves Time

### 28 Turbo Boost With Factories

### 29 View All Posts By An Author

### 30 Eager Load Relationships on an Existing Model

## Section 5, Integrate the Design

### 31 Convert the HTML and CSS to Blade

### 32 Blade Components and CSS Grids

### 33 Convert the Blog Post Page

### 34 A Small JavaScript Dropdown Detour

### 35 How to Extract a Dropdown Blade Component

### 36 Quick Tweaks and Clean-Up

## Section 6, Search

### 37 Search (The Messy Way)

### 38 Search (The Cleaner Way)

## Section 7, Filtering

### 39 Advanced Eloquent Query Constraints

### 40 Extract a Category Dropdown Blade Component

### 41 Author Filtering

### 42 Merge Category and Search Queries

### 43 Fix a Confusing Eloquent Query Bug

## Section 8, Pagination

### 44 Laughably Simple Pagination

## Section 9, Forms and Authentication

### 45 Build a Register User Page

### 46 Automatic Password Hashing With Mutators

### 47 Failed Validation and Old Input Data

### 48 Show a Success Flash Message

### 49 Login and Logout

### 50 Build the Log In Page

### 51 Laravel Breeze Quick Peek

## Section 10, Comments

### 52 Write the Markup for a Post Comment

### 53 Table Consistency and Foreign Key Constraints

### 54 Make the Comments Section Dynamic

### 55 Design the Comment Form

### 56 Activate the Comment Form

### 57 Some Light Chapter Clean Up

## Section 11, Newsletters and APIs

### 58 Mailchimp API Tinkering

### 59 Make the Newsletter From Work

### 60 Extract a Newsletter Service

### 61 Toy Chests and Contracts

## Section 12, Admin Section

### 62 Limit Access to Only Admins

### 63 Create the Publish Post Form

### 64 Validate and Store Post Thumbnails

### 65 Extract Form-Specific Blade Components

### 66 Extend the Admin Layout

### 67 Create a Form to Edit and Delete Posts

### 68 Group and Store Validation Logic

### 69 All About Authorization

## Section 13, Conclusion

### 70 Goodbye and Next Steps

