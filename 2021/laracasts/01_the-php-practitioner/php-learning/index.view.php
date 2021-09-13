<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
</head>
<body>

  <ul>
    <?php foreach ($task as $field => $value): ?>
      <li>
        <strong><?= $field ?></strong>
        <?= $value ?>
      </li>
    <?php endforeach ?>
  </ul>

</body>
</html>

