#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use Mojo::Pg;

my $config = app->plugin('Config');

helper pg => sub { state $pg = Mojo::Pg->new($config->{postgres}) };

get '/' => sub ($c) {
  # my $greetings_h = $c->pg->db->query('SELECT greeting FROM greetings')->hashes;
  # $c->stash(greetings => [map {$_->{'greeting'}} @$greetings_h]);
  my $greetings_a = $c->pg->db->query('SELECT greeting FROM greetings')->arrays->flatten;
  $c->stash(greetings => $greetings_a);
  $c->render('index');
};

# $ curl -X POST 'http://localhost:3000/greetings?greeting=Perl+is+fun'
post '/greetings' => sub ($c) {
  my $new_greeting = $c->req->query_params->param('greeting');
  $c->pg->db->insert('greetings', {greeting => $new_greeting});
  $c->render(text => "Added '$new_greeting'.");
};

app->start;

__DATA__

@@index.html.ep

<ul>
% for my $greeting (@$greetings) {
  <li><%= $greeting %></li>
% }
</ul>
