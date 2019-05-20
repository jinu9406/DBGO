<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT R.name, T.album_id, S.title, SUM(T.playCount)
          FROM Singer AS R JOIN Album AS S ON R.singer_id = S.singer_id JOIN Music AS T ON S.album_id = T.album_id
          WHERE S.genre = '발라드' GROUP BY T.album_id ORDER BY SUM(T.playCount) DESC";

$result= mysqli_query($conn, $sql1);


if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."<li>SINGER: {$row['name']} &nbsp &nbsp TITLE: {$row['title']} &nbsp &nbsp PLAY COUNT: {$row['SUM(T.playCount)']}<br><br></li>";
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
    <font color="green"><h2> >>> Find all the albums whose genre are same and sort them by a playcount </h2></font>

    <ol>
      <h3>List of musics</h3>
      <h4><?=$list?></h4><br>
    </ol>

  </body>
</html>
