<?php require('partials/head.php'); ?>

<h1>Tasks</h1>

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

<?php require('partials/footer.php'); ?>
