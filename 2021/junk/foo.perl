#!/usr/bin/env perl

# use strict; use warnings; use utf8; use 5.30.0;
# use feature 'signatures'; no warnings 'experimental::signatures';
use Modern::Perl;
use Experimental::Signatures;

sub hello($who = "world") {
  say("Hello, $who.");
}

hello;
hello 'bob';

my $x = sub { say "FOO" };
$x->();

my $y = \&hello;
$y->();

sub bar {
  #no Modern::Perl::Signatures;

  sub hello2($who = "world") {
    say("Hello, $who.");
  }

  hello2;
  hello 'alice';
}

bar;
