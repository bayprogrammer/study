<?php

$app['database']->insertOne('todos', [
    'description' => $_POST['description'],
    'completed' => false
]);

header('Location: /');
die();
