<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT Singer.name, Singer.genre
          From Singer
          Where Singer.genre ='발라드'";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Genre: {$row['genre']} ⠀⠀Name: {$row['name']}</li>";
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
    <font color="green"><h2> >>> Find all the singers who have a specific genre </h2></font>
    <ol>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
