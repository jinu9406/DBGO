<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "UPDATE Music SET
          lyrics = '우리 딱 약속해 난 친구는 못 해 깨끗하게 아예 가끔 참 야속해 사랑 빼면 원래 우린 남이야'
           WHERE music_id = 42";
  $sql2 = "SELECT * FROM Music WHERE music_id = 42";

mysqli_query($conn, $sql1);
$result1 = mysqli_query($conn, $sql2);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>TITLE: {$row['title']}<br> LYRICS: {$row['lyrics']}<br><br></li>";
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
    <font color="green"><h2> >>> Add lyrics to the new music </h2></font>

    <ol>
      <h3>List of Musics</h3>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
