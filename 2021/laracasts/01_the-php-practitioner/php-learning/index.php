<?php

require 'functions.php';

$customerOneAge = 15;
$customerTwoAge = 51;

if (eligableForNightclub($customerOneAge)) {
    echo "Welcome!";
} else {
    echo "Go away kid!";
}

require 'index.view.php';
