<?php

namespace App\Models;

use App\Core\App;

class Task
{
    public static function all()
    {
        return App::get('database')->selectAll('todos');
    }

    public static function add($description, $completed)
    {
        App::get('database')->insertOne('todos', [
            'description' => $description,
            'completed' => $completed
        ]);
    }
}
