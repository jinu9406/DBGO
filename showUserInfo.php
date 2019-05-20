<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT * FROM User WHERE user_id = 3";
  $result= mysqli_query($conn, $sql1);

  $list='';

  if (!$result) {
      echo "Could not successfully run query from DB: " . mysql_error();
      exit;
  }

  while($row= mysqli_fetch_array($result)){
    $list= $list."<li>ID: {$row['id']}<br>LEVEL: {$row['level']}<br>VOUCHER: {$row['voucher']}</li>";
  }

?>
<!--user id=3인 user select. id= gogogo-->

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title> "Welcome to DBGO Genie" </title>
  <font color="green"><h1> DBGO Genie </h1></font>
</head>
  <body>
    <font color="green"><h2> >>> Show one user's information </h2></font>

    <ol>
      <h3>User 3's information</h3>
      <h4><?=$list?></h4><br>
    </ol>

  </body>
</html>
