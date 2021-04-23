#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

get '/' => { text => "Hello, world." };

app->start;
