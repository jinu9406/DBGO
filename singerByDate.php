<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT Singer.singer_id, Singer.name, Singer.debutDate
          from Singer order by Singer.debutDate";

$result1 = mysqli_query($conn, $sql1);


if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Singer id: {$row['singer_id']} ⠀⠀Name: {$row['name']} ⠀⠀Debut Date: {$row['debutDate']}</li>";
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
    <font color="green"><h2> >>> Sort all the singers by debutDate </h2></font>
    <ol>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
