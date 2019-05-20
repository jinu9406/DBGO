<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT * FROM Music WHERE album_id = 1 ORDER BY playCount DESC";

$result= mysqli_query($conn, $sql1);


if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."<li>TITLE: {$row['title']} &nbsp &nbsp LIKES: {$row['numOfLike']}<br><br></li>";
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
    <font color="green"><h2> >>> Sort all the music in an album by number of likes </h2></font>

    <ol>
      <h3>Musics in the Almub (사춘기집)</h3>
      <h4><?=$list?></h4><br>
    </ol>

  </body>
</html>
