#!/usr/bin/php7.4
<?php
require 'autoloads.php';

use VMTools\VM;

$vm = new VM([
    'cpu' => 'x86_64',
    'ram' => '2M',
    'hdd' => '2G',
]);

$vm->start();
