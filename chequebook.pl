#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use Mojo::Pg;

my $config = app->plugin('Config');

helper pg => sub { state $pg = Mojo::Pg->new($config->{postgres}) };

get '/' => sub ($c) {
  #
  # $ psql
  # =# \d
  # =# create table greetings ( greeting text );
  # =# \d greetings
  # =# insert into greetings (greeting) values ('Hello, world.'), ('Howdy folks');
  # =# \q
  #

  # my $greeting = $c->pg->db->query('SELECT VERSION() as version')->hash->{version};

  # my $greeting = $c->pg->db
  #   ->query('SELECT greeting FROM greetings LIMIT 1')
  #   ->hash
  #   ->{greeting};

  my $greeting = $c->pg->db
    ->query('SELECT greeting FROM greetings')
    ->hashes
    ->[-1]
    ->{greeting};
  $c->render(text => $greeting);
};

app->start;
