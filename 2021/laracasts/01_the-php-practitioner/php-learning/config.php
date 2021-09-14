<?php

// NOTE(zmd): normally this would not be included in the repo, but created
//   (perhaps from a template) individually for each user or deploy of the
//   project.
return [
    'database' => [
        'name' => 'mytodo',
        'username' => 'zebdeos',
        'password' => '',
        'connection' => 'mysql:host=localhost',
        'options' => [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ]
    ]
];
