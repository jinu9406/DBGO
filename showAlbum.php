<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

    $sql1 = "SELECT * FROM Album WHERE album_id=1";

    $result= mysqli_query($conn, $sql1);


if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."TITLE: {$row['title']}<br><br> RELEASED: {$row['releasedDate']}<br><br>
  GENRE: {$row['genre']}<br><br> RATING: {$row['rating']} <br><br>LIKES: {$row['numOfLike']} <br><br>INTRO: {$row['introduction']}";
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
    <font color="green"><h2> >>> Show an album's information </h2></font>

    <ol>
      <h3>Show an album's information</h3>
      <h4><?=$list?></h4><br>
    </ol>

  </body>
</html>
