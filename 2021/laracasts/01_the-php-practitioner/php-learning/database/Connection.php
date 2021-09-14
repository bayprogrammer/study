<?php

class Connection
{
    public static function make()
    {
        try {
            return new PDO('mysql:host=localhost;dbname=mytodo', 'zebdeos', '');
        } catch (PDOException $e) {
            die("Could not connect to database: {$e->getMessage()}");
        }
    }
}
