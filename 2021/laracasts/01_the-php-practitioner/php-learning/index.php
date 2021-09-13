<?php

require 'functions.php';

try {
  $pdo = new PDO('mysql:host=localhost;dbname=mytodo', 'zebdeos', '');
} catch (PDOException $e) {
  die('Could not connect.');
}

require 'index.view.php';
