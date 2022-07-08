#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use v5.8;

sub hello {
    my $greeting = shift || 'Hello';
    my $name = shift || 'world';

    print("$greeting, $name.\n");
}

hello();
hello(undef, 'Sam');
hello('Howdy');
hello('Howdy', 'Sam');

sub hello_kw {
    my %args = @_;
    my $greeting = $args{greeting} || 'Hello';
    my $name = $args{name} || 'world';

    print("$greeting, $name.\n");
}

hello_kw();
hello_kw(name => 'Sam');
hello_kw(greeting => 'Howdy');
hello_kw(greeting => 'Howdy', name => 'Sam');

sub sum {
    my ($m, $n) = @_;

    return $m + $n;
}

print(sum(2, 3) . "\n");

sub sum_all {
    my $result = 0;
    for (@_) { $result += $_ }

    return $result;
}

print(sum_all(1, 2, 3, 4, 5) . "\n");

