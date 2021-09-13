<?php

function dd($data) {
    echo '<pre>';
    die(var_dump($data));
    echo '</pre>';
}

function eligableForNightclub(int $age): bool {
    return $age >= 21;
}
