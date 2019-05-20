<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "INSERT INTO AddMusicMA(myAlbum_id, music_id) VALUES(7,2)";
$sql2 = "SELECT * from AddMusicMA NATURAL JOIN Music where myAlbum_id = 7";
$sql3 = "DELETE FROM AddMusicMA WHERE myAlbum_id = 7 AND music_id = 2";
$sql4 = "SELECT * from AddMusicMA NATURAL JOIN Music where myAlbum_id = 7";

mysqli_query($conn, $sql1);
$result1 = mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
$result2 = mysqli_query($conn, $sql4);

if (!$result1 || !$result2) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>MyAlbum id: {$row['myAlbum_id']} ⠀⠀Music id: {$row['music_id']}
   ⠀⠀Title: {$row['title']}</li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>MyAlbum id: {$row['myAlbum_id']} ⠀⠀Music id: {$row['music_id']}
   ⠀⠀Title: {$row['title']}</li>";
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
    <font color="green"><h2> >>> Delete music in a user's MyAlbum </h2></font>

    <ol>
      <h3>Before</h3>
      <h4><?=$list1?></h4><br>
    </ol>

    <ol>
      <h3>After</h3>
      <h4><?=$list2?></h4><br>
    </ol>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
          DELETE FROM AddMusicMA WHERE myAlbum_id = 7 AND music_id = 2;
      </h4>
    </p>

  </body>
</html>
