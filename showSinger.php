<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT * from Singer where name='폴킴'";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."Name: {$row['name']} ⠀⠀Type: {$row['type']}
   ⠀⠀Nationality: {$row['nationality']} ⠀⠀Debut date: {$row['debutDate']}";
  $list2 = $list2."Introduction: {$row['introduction']}";
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
    <font color="green"><h2> >>> Show a singer's information </h2></font>

      <?=$list1?><br><br>
      <?=$list2?>
  </body>
</html>
