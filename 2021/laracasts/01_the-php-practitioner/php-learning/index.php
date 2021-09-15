<?php

require 'vendor/autoload.php';
require 'core/bootstrap.php';

$uri = trim($_SERVER['REQUEST_URI'], '/');

Router::load('routes.php')->direct(Request::uri(), Request::method());
