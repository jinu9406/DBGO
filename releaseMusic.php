<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "DELETE FROM Music WHERE album_id = (SELECT album_id FROM Album WHERE title = 'WE')";
  $sql2 = "INSERT INTO Music(title, album_id)
VALUES ('AH YEAH', (SELECT album_id FROM Album WHERE title = 'WE' AND album_id <> 'NULL'))";
  $sql3 = "SELECT * FROM Music
  WHERE album_id = (SELECT album_id FROM Album WHERE title = 'WE' AND album_id <> 'NULL')";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
$result1 = mysqli_query($conn, $sql3);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>TITLE: {$row['title']} &nbsp &nbsp LIKES: {$row['numOfLike']} &nbsp &nbsp ALBUM: {$row['album_id']}<br><br></li>";
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
    <font color="green"><h2> >>> Add music to the new album </h2></font>

    <ol>
      <h3>List of Musics</h3>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
