<?php require('partials/head.php'); ?>

<h1>All Users</h1>

<ul>
  <?php foreach ($users as $user): ?>
    <li><?= $user->name; ?></li>
  <?php endforeach; ?>
</ul>

<h2>Submit Your Name</h2>

<form method="POST" action="/users">
  <input name="name"></input>
  <input value="Register" type="submit"></input>
</form>

<?php require('partials/footer.php'); ?>
