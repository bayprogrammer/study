<?php

class TasksController
{
    public function index()
    {
        $tasks = App::get('database')->selectAll('todos');

        return view('tasks', ['tasks' => $tasks]);
    }

    public function store()
    {
        App::get('database')->insertOne('todos', [
            'description' => $_POST['description'],
            'completed' => false
        ]);

        return redirect('tasks');
    }
}
