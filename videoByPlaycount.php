<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT Singer.name, Video.title, Video.playCount
          FROM Singer JOIN Album ON Singer.singer_id = Album.singer_id
          Join Music ON Album.album_id=Music.album_id
          Join Video on Music.music_id=Video.music_id
          WHERE Singer.singer_id=17 ORDER BY Video.playCount DESC";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>SINGER: {$row['name']} &nbsp &nbsp TITLE: {$row['title']} &nbsp &nbsp PLAY COUNT: {$row['playCount']}<br><br></li>";
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
    <font color="green"><h2> >>Sort all the videos of one singer by a playcount </h2></font>

    <ol>
      <h3>Information of Video</h3>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
