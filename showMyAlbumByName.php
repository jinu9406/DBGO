<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT * FROM MyAlbum WHERE user_id = 3 ORDER BY title";

$result= mysqli_query($conn, $sql1);


if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."<li>TITLE: {$row['title']}<br>INTRO: {$row['introduction']}<br>CREATED DATE: {$row['createdDate']}<br><br></li>";
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
    <font color="green"><h2> >>> Show a user's MyAlbums sorted by name </h2></font>

    <ol>
      <h3>User's myAlbum</h3>
      <h4><?=$list?></h4><br>
    </ol>

  </body>
</html>
