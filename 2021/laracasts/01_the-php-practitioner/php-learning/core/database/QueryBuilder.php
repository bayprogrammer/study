<?php

class QueryBuilder
{
    protected $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function selectAll($table)
    {
        $statement = $this->pdo->prepare("select * from {$table}");

        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_CLASS);
    }

    // TODO(zmd): implement insertOne!
    public function insertOne($table, $data)
    {
        // TODO(zmd): calculate $fields, $placeholders, and $values from $data

        $statement = $this->pdo->prepare(
            "insert into {$table} (${fields}) values (${placeholders})"
        );

        $statement->execute($data);
    }
}
