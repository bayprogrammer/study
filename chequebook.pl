#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

my $config = app->plugin('Config');

get '/' => { text => $config->{greeting} };

app->start;
