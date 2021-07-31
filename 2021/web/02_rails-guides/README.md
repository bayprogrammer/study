# Ruby on Rails Guides (v6.1.x)

- https://guides.rubyonrails.org/index.html

## Table of Contents

### [Start Here](#start-here-1)

#### [Getting Started with Rails](#getting-started-with-rails-1)

https://guides.rubyonrails.org/getting_started.html

* [X] [1 Guide Assumptions](#1-guide-assumptions)
* [X] [2 What is Rails?](#2-what-is-rails)
* [X] [3 Creating a New Rails Project](#creating-a-new-rails-project)
* [X] [4 Hello, Rails](#hello-rails)
* [X] [5 MVC and You](#5-mvc-and-you)
* [X] [6 CRUDit Where CRUDit is Due](#6-crudit-where-crudit-is-due)
* [X] [7 Adding a Second Model](#7-adding-a-second-model)
* [X] [8 Refactoring](#8-refactoring)
* [X] [9 Deleting Comments](#9-deleting-comments)
* [X] [10 Security](#10-security)
* [X] [11 What's Next?](#11-whats-next)
* [X] [12 Configuration Gotchas](#12-configuration-gotchas)

### [Models](#models-1)

#### [Active Record Basics](#active-record-basics-1)

#### [Active Record Migrations](#active-record-migrations-1)

#### [Active Record Validations](#active-record-validations-1)

#### [Active Record Callbacks](#active-record-callbacks-1)

#### [Active Record Associations](#active-record-associations-1)

#### [Active Record Query Interface](#active-record-query-interface-1)

#### [Active Models Basics](#active-model-basics-1)

### [Views](#views-1)

#### [Action View Overview](#action-view-overview-1)

#### [Layouts and Rendering in Rails](#layouts-and-rendering-in-rails-1)

#### [Action View Helpers](#action-view-helpers-1)

#### [Action View Form Helpers](#action-view-form-helpers-1)

### [Controllers](#controllers-1)

#### [Action Controller Overview](#action-controller-overview-1)

#### [Rails Routing from the Outside In](#rails-routing-from-the-outside-in-1)

### [Other Components](#other-components-1)

#### [Active Support Core Extensions](#active-support-core-extensions-1)

#### [Action Mailer Basics](#action-mailer-basics-1)

#### [Action Mailbox Basics](#action-mailbox-basics-1)

#### [Action Text Overview](#action-text-overview-1)

#### [Active Job Basics](#active-job-basics-1)

#### [Active Storage Overview](#active-storage-overview-1)

#### [Action Cable Overview](#action-cable-overview-1)

### [Digging Deeper](#digging-deeper-1)

#### [Rails Internationalization (I18n) API](#rails-internationalization-i18n-api-1)

#### [Testing Rails Applications](#testing-rails-applications-1)

* [X] [1 Why Write Tests for your Rails Applications?](#1-why-write-tests-for-your-rails-applications)
* [X] [2 Introduction to Testing](#2-introduction-to-testing)
* [X] [3 Parallel Testing](#3-parallel-testing)
* [X] [4 The Test Database](#4-the-test-database)
* [X] [5 Model Testing](#5-model-testing)
* [X] [6 System Testing](#6-system-testing)
* [X] [7 Integration Testing](#7-integration-testing)
* [X] [8 Functional Tests for Your Controllers](#8-functional-tests-for-your-controllers)
* [X] [9 Testing Routes](#9-testing-routes)
* [X] [10 Testing Views](#10-testing-views)
* [X] [11 Testing Helpers](#11-testing-helpers)
* [X] [12 Testing Your Mailers](#12-testing-your-mailers)
* [X] [13 Testing Jobs](#13-testing-jobs)
* [X] [14 Testing Action Cable](#14-testing-action-cable)
* [X] [15 Additional Testing Resources](#15-additional-testing-resources)

#### [Securing Rails Applications](#securing-rails-applications-1)

#### [Debugging Rails Applications](#debugging-rails-applications-1)

#### [Configuring Rails Applications](#configuring-rails-applications-1)

#### [The Rails Command Line](#the-rails-command-line-1)

#### [The Asset Pipeline](#the-asset-pipeline-1)

#### [Working with JavaScript in Rails](#working-with-javascript-in-rails-1)

#### [The Rails Initialization Process](#the-rails-initialization-process-1)

#### [Autoloading and Reloading Constants (Zeitwerk Mode)](#autoloading-and-reloading-constant-zeitwerk-mode-1)

#### [Autoloading and Reloading Constants (Classic Mode)](#autoloading-and-reloading-constant-classic-mode-1)

#### [Caching with Rails: An Overview](#caching-with-rails-an-overview-1)

#### [Active Support Instrumentation](#active-support-instrumentation-1)

#### [Using Rails for API-only Applications](#using-rails-for-api-only-applications-1)

#### [Active Record and PostgreSQL](#active-record-and-postgresql-1)

#### [Multiple Databases with Active Record](#multiple-databases-with-active-record-1)

### [Extending Rails](#extending-rails-1)

#### [The Basics of Creating Rails Plugins](#the-basics-of-creating-rails-plugins-1)

#### [Rails on Rack](#rails-on-rack-1)

#### [Creating and Customizing Rails Generators & Templates](#creating-and-customizing-rails-generators--templates-1)

#### [Getting Started with Engines](#getting-started-with-engines-1)

#### [Threading and Code Execution in Rails](#threading-and-code-execution-in-rails-1)

### [Contributions](#contributions-1)

#### [Contributing to Ruby on Rails](#contributing-to-ruby-on-rails-1)

#### [API Documentation Guidelines](#api-documentation-guidelines-1)

#### [Guides Guidelines](#guides-guidelines-1)

### [Policies](#policies-1)

#### [Maintenance Policy](#maintenance-policy-1)

### [Release Notes](#release-notes-1)

#### [Upgrading Ruby on Rails](#upgrading-ruby-on-rails-1)

#### [Version 6.1 - December 2020](#version-61---december-2020-1)

#### [Version 6.0 - August 2019](#version-60---august-2019-1)

#### [Version 5.2 - April 2018](#version-52---april-2018-1)

#### [Version 5.1 - April 2017](#version-51---april-2017-1)

#### [Version 5.0 - June 2016](#version-50---june-2016-1)

#### [Version 4.2 - December 2014](#version-42---december-2014-1)

#### [Version 4.1 - April 2014](#version-41---april-2014-1)

#### [Version 4.0 - June 2013](#version-40---june-2013-1)

#### [Version 3.2 - January 2012](#version-32---january-2012-1)

#### [Version 3.1 - August 2011](#version-31---august-2011-1)

#### [Version 3.0 - August 2010](#version-30---august-2010-1)

#### [Version 2.3 - March 2009](#version-23---march-2009-1)

#### [Version 2.2 - November 2008](#version-22---november-2008-1)

-----

## Start Here

### Getting Started with Rails

#### 1 Guide Assumptions

#### 2 What is Rails?

#### 3 Creating a New Rails Project

```
$ asdf shell ruby 2.7.3
$ asdf shell nodejs 12.22.3
$ rails new blog
$ cd blog
$ asdf local ruby 2.7.3
$ asdf local nodejs 12.22.3
$ asdf shell ruby --unset
$ asdf shell nodejs --unset
```

#### 4 Hello, Rails

```
$ bin/rails server
$ bin/rails generate controller Articles index --skip-routes
```

#### 5 MVC and You

```
$ bin/rails generate model Article title:string body:text
$ bin/rails db:migrate
$ bin/rails console
```

#### 6 CRUDit Where CRUDit is Due

* CRUD:
  * **C**reate
  * **R**ead
  * **U**pdate
  * **D**elete
* Resource:
  * Entity (model) on which a combination of routes, controller actions, and
    views work together to implement its CRUD operations

```
$ bin/rails routes | less -S
$ bin/rails routes -c articles
```

#### 7 Adding a Second Model

```
$ bin/rails generate model Comment commenter:string body:text article:references
$ bin/rails db:migrate
$ bin/rails generate controller Comments
```

#### 8 Refactoring

```
$ bin/rails generate migration AddStatusToArticles status:string
$ bin/rails generate migration AddStatusToComments status:string
$ bin/rails db:migrate
```

We'll need to add the following to the Articles and Comments models:

```ruby
  attribute :status, :string, default: 'public'
```

Note that setting a default value for Rails model is suprising convoluted, see:
https://stackoverflow.com/questions/328525/rails-how-can-i-set-default-values-in-activerecord

#### 9 Deleting Comments

#### 10 Security

- https://github.com/heartcombo/devise
- https://github.com/binarylogic/authlogic
- https://guides.rubyonrails.org/security.html

#### 11 What's Next?

#### 12 Configuration Gotchas

## Models

### Active Record Basics

### Active Record Migrations

### Active Record Validations

### Active Record Callbacks

### Active Record Associations

### Active Record Query Interface

### Active Models Basics

## Views

### Action View Overview

### Layouts and Rendering in Rails

### Action View Helpers

### Action View Form Helpers

## Controllers

### Action Controller Overview

### Rails Routing from the Outside In

## Other Components

### Active Support Core Extensions

### Action Mailer Basics

### Action Mailbox Basics

### Action Text Overview

### Active Job Basics

### Active Storage Overview

### Action Cable Overview

## Digging Deeper

### Rails Internationalization (I18n) API

### Testing Rails Applications

#### 1 Why Write Tests for your Rails Applications?

#### 2 Introduction to Testing

Run all tests (other than system tests):

```
$ bin/rails test
```

Run all tests of a particular kind:

```
$ bin/rails test:models
```

Run tests in specific directory:

```
$ bin/rails test test/controllers
```

Run specific test:

```
$ bin/rails test test/models/article_test.rb:4
$ bin/rails test test/models/article_test.rb -n test_the_truth
```

Display backtrace for errors encountered:

```
$ bin/rails test -b test/models/article_test.rb
```

Test base classes provided by Rails:

* `ActiveSupport::TestCase`
* `ActionMailer::TestCase`
* `ActionView::TestCase`
* `ActiveJob::TestCase`
* `ActionDispatch::IntegrationTest`
* `ActionDispatch::SystemTestCase`
* `Rails::Generators::TestCase`

Minitest documentation can be found here:

* http://docs.seattlerb.org/minitest/

See `-h` for more information on available test subcommand options:

```
$ bin/rails test -h
```

#### 3 Parallel Testing

Specify the number of workers with `parallelize`. By default the test harness
uses forking. Specify `with: threads` option to use threads. Threads option
will be set automatically for Rails apps generated using JRuby or TruffleRuby,
but forking is default otherwise (e.g. when using YARV and not othering adding
the option).

Use `parallelize_setup` and `parallelize_teardown` to specify blocks of code to
work on each worker when relying on forking for test parallelization. These are
not applicatable when using threads instead of process forking.

Specify the number of workers via an environment var (such as for CI/CD
overrides):

```
$ PARALLEL_WORKERS=15 bin/rails test
```

#### 4 The Test Database

Use `bin/rails db:test:prepare` to rebuild test db if migrations have been
edited (vs. just having unapplied migrations).

Fixtures API docs can be found here:

* https://api.rubyonrails.org/v6.1.4/classes/ActiveRecord/FixtureSet.html

Can use ERB within fixture YAML files to do preprocessing and ahead of time
dynamic fixture generation.

#### 5 Model Testing

Model tests don't have a special superclass, they inherit directly from
ActiveSupport::TestCase.

#### 6 System Testing

```
$ bin/rails generate system_test users
```

All system test configuration should go in
`test/application_system_test_case.rb`.

Change the backend to Cabybara using `driven_by`:

```ruby
require 'test_helper'
require 'capybara/poltergeist'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist
end
```

Other examples:

```ruby
driven_by :selenium, using: :chrome  # the default
driven_by :selenium, using: :headless_chrome
driven_by :selenium, using: :firefox
driven_by :selenium, using: :headless_firefox
```

Capybara documentation can be found here:

* https://github.com/teamcapybara/capybara#setup

```
$ bin/rails generate system_test articles
```

Run system tests:

```
bin/rails test:system
bin/rails test:all
```

*Ubuntu-specific note from Zeb*: comment out the `webdrivers` gem in the
`Gemfile`; that gem actually makes things break with Chromium installed via
Snap. Things "just work" without it (at least for Selenium + Chromium)! For the
same for Firefox, just install the `firefox-geckodriver` package via `apt`.

Can create a special `test/module_system_test_case.rb` like so for full stack
testing in the mobile context:

```ruby
require 'test_helper'

class MobileSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [375, 667]
end
```

And then create a test case based on this mobile-specific system test
baseclass:

```ruby
require 'mobile_system_test_case'

class PostsTest < MobileSystemTestCase
  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end
end
```

> ...you can test anything that the user [himself] would do in your application
> such as commenting, deleting articles, publishing draft articles, etc.

*Note from Zeb*: yes, but we need to figure out auth! Basic auth wasn't working
with these system tests and I had to disable it to complete this tutorial.

#### 7 Integration Testing

Integration tests (which inherit from `ActionDispatch::IntegrationTest`) come
with the standard testing helpers plus the ones from these modules:

* [`ActionDispatch::Integration::Runner`](https://api.rubyonrails.org/v6.1.4/classes/ActionDispatch/Integration/Runner.html)
* [`ActionDispatch::Integration::RequestHelper`](https://api.rubyonrails.org/v6.1.4/classes/ActionDispatch/Integration/RequestHelpers.html)
* [`ActionDispatch::Integration::Session`](https://api.rubyonrails.org/v6.1.4/classes/ActionDispatch/Integration/Session.html)

```
$ bin/rails generate integration_test blog_flow
```

#### 8 Functional Tests for Your Controllers

```
$ bin/rails generate test_unit:scaffold article
```

#### 9 Testing Routes

Route tests are stored in `test/controllers` either as separate tests are
integrated into the controller tests.

Special routing assertions can be found here:

* [`ActionDispatch::Assertions::RoutingAssertions`](https://api.rubyonrails.org/v6.1.4/classes/ActionDispatch/Assertions/RoutingAssertions.html)

#### 10 Testing Views

View tests also are stored in `test/controllers` either as separate tests are
integrated into the controller tests.
[`assert_select`](https://github.com/rails/rails-dom-testing/blob/master/lib/rails/dom/testing/assertions/selector_assertions.rb)
will be your friend:

```ruby
assert_select "title", "Welcome to Rails Testing Guide"

assert_select "ul.navigation" do
  assert_select "li.menu_item"
end

assert_select "ol" do |elements|
  elements.each do |element|
    assert_select element, "li", 4
  end
end

assert_select "ol" do
  assert_select "li", 8
end
```

#### 11 Testing Helpers

#### 12 Testing Your Mailers

Mail testing-related documentation can be found here:

* https://api.rubyonrails.org/v6.1.4/classes/ActionMailer/TestHelper.html

#### 13 Testing Jobs

* [ActiveJob::TestHelper](https://api.rubyonrails.org/v6.1.4/classes/ActiveJob/TestHelper.html)

#### 14 Testing Action Cable

* [ActionCable::Connection::TestCase](https://api.rubyonrails.org/v6.1.4/classes/ActionCable/Connection/TestCase.html)
* [ActionCable::Channel::TestCase](https://api.rubyonrails.org/v6.1.4/classes/ActionCable/Channel/TestCase.html)
* [ActionCable::TestHelper](https://api.rubyonrails.org/v6.1.4/classes/ActionCable/TestHelper.html)

#### 15 Additional Testing Resources

* [`travel_to`](https://api.rubyonrails.org/v6.1.4/classes/ActiveSupport/Testing/TimeHelpers.html#method-i-travel_to)
* [`ActiveSupport::Testing::TimeHelpers`](https://api.rubyonrails.org/v6.1.4/classes/ActiveSupport/Testing/TimeHelpers.html)

### Securing Rails Applications

### Debugging Rails Applications

### Configuring Rails Applications

### The Rails Command Line

### The Asset Pipeline

### Working with JavaScript in Rails

### The Rails Initialization Process

### Autoloading and Reloading Constants (Zeitwerk Mode)

### Autoloading and Reloading Constants (Classic Mode)

### Caching with Rails: An Overview

### Active Support Instrumentation

### Using Rails for API-only Applications

### Active Record and PostgreSQL

### Multiple Databases with Active Record

## Extending Rails

### The Basics of Creating Rails Plugins

### Rails on Rack

### Creating and Customizing Rails Generators & Templates

### Getting Started with Engines

### Threading and Code Execution in Rails

## Contributions

### Contributing to Ruby on Rails

### API Documentation Guidelines

### Guides Guidelines

## Policies

### Maintenance Policy

## Release Notes

### Upgrading Ruby on Rails

### Version 6.1 - December 2020

### Version 6.0 - August 2019

### Version 5.2 - April 2018

### Version 5.1 - April 2017

### Version 5.0 - June 2016

### Version 4.2 - December 2014

### Version 4.1 - April 2014

### Version 4.0 - June 2013

### Version 3.2 - January 2012

### Version 3.1 - August 2011

### Version 3.0 - August 2010

### Version 2.3 - March 2009

### Version 2.2 - November 2008
