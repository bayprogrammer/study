#!/usr/bin/env php
<?php

class Post
{
    public $title;

    public $author;

    public $published;

    public function __construct($title, $author, $published)
    {
        $this->title = $title;
        $this->author = $author;
        $this->published = $published;
    }
}

$posts = [
    new Post('My First Post', 'JW', true),
    new Post('My Second Post', 'JW', true),
    new Post('My Third Post', 'AW', true),
    new Post('My Fourth Post', 'TR', false)
];

// === array_filter ==========================================================

$unpublishedPosts = array_filter($posts, function ($post) {
    return !$post->published;
});

$publishedPosts = array_filter($posts, function ($post) {
    return $post->published;
});

// === array_map =============================================================

$postArrays = array_map(function ($post) {
    return (array) $post;
}, $posts);

$postArraysTitles = array_map(function ($post) {
    return ['title' => $post->title];
}, $posts);

$postTitles = array_map(function ($post) {
    return $post->title;
}, $posts);

// === array_column ==========================================================

// works on both an array of objects or array of arrays
$postTitlesViaArrayColumn = array_column($posts, 'title');
$postTitlesFromArrOfArrViaArrayColumn = array_column($postArrays, 'title');
$postAuthors = array_column($posts, 'author');
$postAuthorsTitleKeys = array_column($posts, 'author', 'title');

// note: does not group values for duplicate keys
$postTitlesAuthorKeys = array_column($posts, 'title', 'author');

var_dump($postTitlesAuthorKeys);
