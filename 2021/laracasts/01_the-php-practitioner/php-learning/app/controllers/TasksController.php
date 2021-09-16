<?php

namespace App\Controllers;

use App\Core\App;
use App\Models\Task;

class TasksController
{
    public function index()
    {
        $tasks = Task::all();

        return view('tasks', ['tasks' => $tasks]);
    }

    public function store()
    {
        Task::add($_POST['description'], false);

        return redirect('tasks');
    }
}
