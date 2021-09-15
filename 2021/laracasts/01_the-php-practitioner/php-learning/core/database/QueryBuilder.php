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

    public function insertOne($table, $data)
    {
        $fields = $this->fieldList($data);
        $placeholders = $this->placeholderList($data);
        $values = array_values($data);

        $sql = "insert into {$table} (${fields}) values (${placeholders})";

        $statement = $this->pdo->prepare($sql);
        $this->bindValues($statement, $values);
        $statement->execute();
    }

    protected function fieldList($data)
    {
        $fieldKeys = array_keys($data);
        return implode(',', $fieldKeys);
    }

    protected function placeholderList($data)
    {
        $fieldPlaceholders = array_map(fn ($_) => '?', $data);
        return implode(',', $fieldPlaceholders);
    }

    protected function bindValues($statement, $values)
    {
        $index = 0;
        foreach ($values as $value) {
            $type = $this->pdoType($value);
            ++$index;

            $statement->bindValue($index, $value, $type);
        }
    }

    protected function pdoType($value)
    {
        $pdoType = PDO::PARAM_STR;
        switch (gettype($value)) {
            case 'boolean':
                $pdoType = PDO::PARAM_BOOL;
                break;
            case 'integer':
                $pdoType = PDO::PARAM_INT;
                break;
        }

        return $pdoType;
    }
}
