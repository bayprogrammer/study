<?php require('partials/head.php'); ?>

<h1>TODOs</h1>

<ul>
  <?php foreach ($tasks as $task): ?>
    <li>
      <?php if ($task->completed): ?>
        <strike><?= $task->description; ?></strike>
      <?php else: ?>
        <?= $task->description; ?>
      <?php endif; ?>
    </li>
  <?php endforeach ?>
</ul>

<form method="POST" action="/tasks">
  <input name="description"></input>
  <input value="Add Task" type="submit"></input>
</form>

<h1>Submit Your Name</h1>

<form method="POST" action="/names">
  <input name="name"></input>
  <input value="Register" type="submit"></input>
</form>

<?php require('partials/footer.php'); ?>

<h2>Users</h2>

<ul>
  <?php foreach ($users as $user): ?>
    <li><?= $user->name; ?></li>
  <?php endforeach; ?>
</ul>
