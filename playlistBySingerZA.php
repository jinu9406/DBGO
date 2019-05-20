<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT AddMusicPL.user_id, AddMusicPL.music_id, Singer.name
         	FROM AddMusicPL JOIN Music ON AddMusicPL.music_id = Music.music_id JOIN Album ON Music.album_id = Album.album_id JOIN Singer ON Album.singer_id = Singer.singer_id
          	WHERE AddMusicPL.user_id=3 ORDER BY Singer.name DESC";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User id: {$row['user_id']} ⠀⠀Music id: {$row['music_id']}
               ⠀⠀Name: {$row['name']}</li>";
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
    <font color="green"><h2> >>> Sort a user's playlist by a name of singer (Z to A) </h2></font>

    <ol>
      <?=$list1?>
    </ol>

  </body>
</html>
