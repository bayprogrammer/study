<?php

function dd($data)
{
    echo '<pre>';
    die(var_dump($data));
    echo '</pre>';
}

function eligableForNightclub(int $age): bool
{
    return $age >= 21;
}

function connectToDb()
{
  try {
    return new PDO('mysql:host=localhost;dbname=mytodo', 'zebdeos', '');
  } catch (PDOException $e) {
    die("Could not connect to database: {$e->getMessage()}");
  }
}

function fetchAllTasks($pdo)
{
  $statement = $pdo->prepare('select * from todos');

  $statement->execute();

  return $statement->fetchAll(PDO::FETCH_CLASS, 'Task');
}
