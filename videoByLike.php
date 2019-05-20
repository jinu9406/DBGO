<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT Singer.name, Video.title, Video.numOfLike
          FROM Singer JOIN Album ON Singer.singer_id = Album.singer_id
          JOIN Music ON Album.album_id=Music.album_id
          JOIN Video ON Music.music_id=Video.music_id
          WHERE Singer.singer_id=17 ORDER BY Video.numOfLike DESC";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>SINGER: {$row['name']} &nbsp &nbsp TITLE: {$row['title']} &nbsp &nbsp LIKES: {$row['numOfLike']}<br><br></li>";
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
    <font color="green"><h2> >>Sort all the videos of one singer the number of likes </h2></font>

    <ol>
      <h3>Information of Video</h3>
      <h4><?=$list1?></h4><br>
    </ol>

    <p>
      <font color= "green"><h2> >>> Query </h2></font>
      <h4>
        SELECT Singer.name, Video.title, Video.numOfLike<br><br>
        FROM Singer JOIN Album ON Singer.singer_id = Album.singer_id<br><br>
        JOIN Music ON Album.album_id=Music.album_id JOIN Video ON Music.music_id=Video.music_id<br><br>
        WHERE Singer.singer_id=17 ORDER BY Video.numOfLike<br><br>
      </h4>
    </p>


  </body>
</html>
