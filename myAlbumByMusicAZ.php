<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT AddMusicMA.myAlbum_id, AddMusicMA.music_id, Music.title, Singer.name
         	FROM AddMusicMA JOIN Music ON AddMusicMA.music_id = Music.music_id JOIN Album ON Music.album_id = Album.album_id JOIN Singer ON Album.singer_id = Singer.singer_id
          	WHERE AddMusicMA.myAlbum_id=7 ORDER BY Music.title";

$result= mysqli_query($conn, $sql1);


if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."<li>MUSIC: {$row['title']} &nbsp &nbsp SINGER: {$row['name']}<br><br></li>";
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
    <font color="green"><h2> >>> Sort a user's MyAlbum by a title of music (A to Z) </h2></font>

    <ol>
      <h3>User's myAlbum</h3>
      <h4><?=$list?></h4><br>
    </ol>

  </body>
</html>
