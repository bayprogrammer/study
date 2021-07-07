# Agile Web Development with Rails 6

By Sam Ruby, David Bryan Copeland (with Dave Thomas).

- Copyright (c) 2020 The Pragmatic Programmers, LLC
- [Book Site][1]
- ISBN-13: 978-1-68050-670-9

[1]: https://pragprog.com/titles/rails6/agile-web-development-with-rails-6/

## Table of Contents

### [Front Matter](#front-matter-1)

* [X] [Foreward to the Rails 5 Edition](#forward-to-the-rails-5-edition)
* [X] [Preface to the Rails 6 Edition](#preface-to-the-rails-6-edition)
* [X] [Acknowledgements](#acknowledgements)
* [X] [Introduction](#introduction)

### [Part I: Getting Started](#part-i-getting-started-1)

* [X] [Chapter 1: Installing Rails](#chapter-1-installing-rails)
* [X] [Chapter 2: Instant Gratification](#chapter-2-instant-gratification)
* [X] [Chapter 3: The Architecture of Rails Applications](#chapter-3-the-architecture-of-rails-applications)
* [X] [Chapter 4: Introduction to Ruby](#chapter-4-introduction-to-ruby)

### [Part II: Building an Application](#part-ii-building-an-application-1)

* [X] [Chapter 5: The Depot Application](#chapter-5-the-depot-application)
* [X] [Chapter 6: Task A: Creating the Application](#chapter-6-task-a-creating-the-application)
* [X] [Chapter 7: Task B: Validation and Unit Testing](#chapter-7-task-b-validation-and-unit-testing)
* [ ] [Chapter 8: Task C: Catalog Display](#chapter-8-task-c-catalog-display)
* [ ] [Chapter 9: Task D: Cart Creation](#chapter-9-task-d-cart-creation)
* [ ] [Chapter 10: Task E: A Smarter Cart](#chapter-10-task-e-a-smarter-cart)
* [ ] [Chapter 11: Task F: Add a Dash of Ajax](#chapter-11-task-f-add-a-dash-of-ajax)
* [ ] [Chapter 12: Task G: Check Out!](#chapter-12-task-g-check-out)
* [ ] [Chapter 13: Task H: Entering Additional Payment Details](#chapter-13-task-h-entering-additional-payment-details)
* [ ] [Chapter 14: Task I: Sending Emails and Processing Payments Efficiently](#chapter-14-sending-emails-and-processing-payments-efficiently)
* [ ] [Chapter 15: Task J: Logging In](#chapter-15-task-j-logging-in)
* [ ] [Chapter 16: Task K: Internationalization](#chapter-16-task-k-internationalization)
* [ ] [Chapter 17: Task L: Receive Emails and Respond with Rich Text](#chapter-17-task-l-receive-emails-and-respond-with-rich-text)

### [Part III: Rails in Depth](#part-iii-rails-in-depth-1)

* [ ] [Chapter 18: Finding Your Way Around Rails](#chapter-18-finding-your-way-around-rails)
* [ ] [Chapter 19: Active Record](#chapter-19-active-record)
* [ ] [Chapter 20: Action Dispatch and Action Controller](#chapter-20-action-dispatch-and-action-controller)
* [ ] [Chapter 21: Action View](#chapter-21-action-view)
* [ ] [Chapter 22: Migrations](#chapter-22-migrations)
* [ ] [Chapter 23: Customizing and Extending Rails](#chapter-23-customizing-and-extending-rails)

-----

## Front Matter

### Foreward to the Rails 5 Edition

### Preface to the Rails 6 Edition

### Acknowledgements

### Introduction

## Part I: Getting Started

### Chapter 1: Installing Rails

https://api.rubyonrails.org

```
$ asdf install ruby 2.6.5
$ asdf shell ruby 2.6.5
$ rehash
$ gem install rails --version=6.0.1 --no-document
$ asdf install nodejs 12.22.3
$ asdf shell nodejs 12.22.3
$ rehash
$ npm install -g yarn
$ sudo apt install chromium-chromedriver
```

WARNING: On Ubuntu 20.04 LTS, the above `apt` command ends up installing
Chromium via `snap`, which is crap.

```
$ rails _6.0.1_ --version
```

### Chapter 2: Instant Gratification

```
$ rails _6.0.1_ new demo
$ cd demo
$ asdf local ruby 2.6.5
$ asdf local nodejs 12.22.3
$ asdf reshim ; rehash
$ bin/rails about
$ bin/rails server
```

Generate a controller and some actions:

```
$ bin/rails generate controller Say hello goodbye
```

_Helpers_: methods which make it easier to write templates.

### Chapter 3: The Architecture of Rails Applications

### Chapter 4: Introduction to Ruby

## Part II: Building an Application

### Chapter 5: The Depot Application

### Chapter 6: Task A: Creating the Application

```
$ asdf shell ruby 2.6.5
$ asdf shell nodejs 12.22.3
$ rails _6.0.1_ new depot
$ cd depot
$ asdf local ruby 2.6.5
$ asdf local nodejs 12.22.3
$ bin/rails generate scaffold Product \
    title:string \
    description:text \
    image_url:string \
    price:decimal
$ : ...
$ bin/rails db:migrate
$ bin/rails server
$ bin/rails test
$ bin/rails db:seed
```

### Chapter 7: Task B: Validation and Unit Testing

- https://api.rubyonrails.org/classes/ActiveSupport/TestCase.html
- https://docs.seattlerb.org/minitest/

```
$ bin/rails test:models
$ bin/rails test test/controllers/products_controller_test.rb:19
```

### Chapter 8: Task C: Catalog Display

### Chapter 9: Task D: Cart Creation

### Chapter 10: Task E: A Smarter Cart

### Chapter 11: Task F: Add a Dash of Ajax

### Chapter 12: Task G: Check Out!

### Chapter 13: Task H: Entering Additional Payment Details

### Chapter 14: Task I: Sending Emails and Processing Payments Efficiently

### Chapter 15: Task J: Logging In

### Chapter 16: Task K: Internationalization

### Chapter 17: Task L: Receive Emails and Respond with Rich Text

## Part III: Rails in Depth

### Chapter 18: Finding Your Way Around Rails

### Chapter 19: Active Record

### Chapter 20: Action Dispatch and Action Controller

### Chapter 21: Action View

### Chapter 22: Migrations

### Chapter 23: Customizing and Extending Rails

