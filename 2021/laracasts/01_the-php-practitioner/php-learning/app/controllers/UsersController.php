<?php

namespace App\Controllers;

use App\Core\App;
use App\Models\User;

class UsersController
{
    public function index()
    {
        $users = User::all();

        return view('users', compact('users'));
    }

    public function store()
    {
        User::add($_POST['name']);

        return redirect('users');
    }
}
