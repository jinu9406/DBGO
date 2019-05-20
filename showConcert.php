<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT * from Concert where concert_id=3";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."Title: {$row['title']} ⠀⠀Genre: {$row['genre']}";
  $list2 = $list2."Current Num: {$row['currentNum']} ⠀⠀Limit Num: {$row['numOfLimit']} ⠀⠀DueDate: {$row['dueDate']}";
  $list3 = $list3."Concert Story: {$row['concertStory']}";
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
    <font color="green"><h2> >>> Show a concert's information </h2></font>

      <?=$list1?><br><br>
      <?=$list2?><br><br>
      <?=$list3?>

  </body>
</html>
