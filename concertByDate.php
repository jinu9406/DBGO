<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT title, genre, dueDate FROM Concert ORDER BY duedate";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Title: {$row['title']} ⠀⠀Genre: {$row['genre']}
               ⠀⠀Due Date: {$row['dueDate']}</li>";
}

?>


<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title> "Welcome to DBGO Genie" </title>
  <font color="green"><h1> DBGO Genie </h1></font>
</head>
  <body>
    <font color="green"><h2> >>> Sort all concerts by title of concert (A to Z) </h2></font>

    <ol>
      <?=$list1?>
    </ol>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        SELECT title, genre, dueDate FROM Concert ORDER BY dueDate;
      </h4>
    </p>

  </body>
</html>
