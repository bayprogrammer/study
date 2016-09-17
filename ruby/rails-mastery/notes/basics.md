# Basics

```
$ rbenv install 2.3.1
$ rbenv global 2.3.1
$ gem install rails -v '~>4.2'
$ rbenv rehash
```

## Start new project

Just the basic Rails project. Basically a la Rails Getting Started blog
tutorial (but I want to make a TODO list instead).

```
$ cd ~/rails-mastery
$ rails new todo
$ cd todo
```

## Gemfile

I'm wanting to use some alternative libs (some stuff I'm aiming to learn). I'm
also going to clean up a bunch of comments Rails inserted by default.

```
$ emacs Gemfile
```

Here's what my basic Rails Gemfile ends up looking like at this stage:

```
source 'https://rubygems.org'

gem 'rails', '4.2.7.1'
gem 'thin'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'slim-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'ripper-tags'
end
```

With our Gemfile cleaned up and expanded, let's run Bundler to install our
additional desired gems:

```
$ bundle install
```

Later we will investigate and play with the following other gems:

- gaffe
- foreman
- faraday
- virtus
- pg
- megatron
- rack-test
- capybara

## Boot the app!

Now that our gems are installed, we can try running the app!

```
$ bin/rails server
```

Notice how Rails 4 noticed we have Thin installed and, since it was available,
used it instead of WEBrick (which is what it would have used had we not
installed Thin).

## Slimify Application View

The default generated application layout view was generated as ERB. I'm going
to convert it by hand to slim:

```
$ git mv app/views/layouts/application.html.erb \
         app/views/layouts/application.html.slim
```

Here's what the file looks like once I've converted it:

```
doctype html
html
  head
    title Todo
    = stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
    = javascript_include_tag 'application', 'data-turbolinks-track' => true
    = csrf_meta_tags

  body
    h1 Todo
    == yield
```

I will observe that Slim is definitely more compact than ERB for the equivalent
code, just as it says on the tin.

`==` means to output ruby code expression return value without escaping (such
as when we `yeild` to descendent templates).

`=` means to output ruby code expression return value but escape it.

`-` means to run ruby code but don't output it in the page (useful for looping,
etc.)

Things are fairly logical and the docs are good.

## Hello world

The blog tutorial has you make a welcome controller. Instead I want something I
might keep around for a while, so I'm going to make an About controller -- a
simple way to give information about my app. Let's go ahead and generate the
controller.

```
$ bin/rails generate controller about index
```

Because we have Slim installed, our generated html view templates henceforth
will default to the slim handler.

We can immediately check out our new action at
http://localhost:3000/about/index (it seems our slimifcation of our application
layout also is working, woot!)

## Resource

From the Rails Getting Started Guide:

> A resource is the term used for a collection of similar objects, such as
> articles, people or animals. You can create, read, update and destroy items
> for a resource and these operations are referred to as CRUD operations.

Good for RESTful resource routing (each resource will automatically be mapped
to appropriate default controller actions).

The view template search for a given controller action will follow a pattern
consistent with the inheritance chain for the controller in question.

## Model

```
$ bin/rails g model TodoItem title:string tags:text
```

Note, can't use "Todo" for model name, since my app is called Model, see:

- http://stackoverflow.com/questions/19777093/name-is-already-used-or-reserved-by-ruby-on-rails

```
$ bin/rake db:migrate
```
