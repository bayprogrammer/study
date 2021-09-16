<?php

namespace App\Models;

use App\Core\App;

class User
{
    public static function all()
    {
        return App::get('database')->selectAll('users');
    }

    public static function add($name)
    {
        App::get('database')->insert('users', ['name' => $name]);
    }
}
