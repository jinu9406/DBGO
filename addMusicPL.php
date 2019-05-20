<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "DELETE FROM AddMusicPL WHERE user_id = 3 AND music_id = 1";
$sql2 = "SELECT * from AddMusicPL NATURAL JOIN Music where user_id = 3";
$sql3 = "INSERT INTO AddMusicPL(user_id, music_id) VALUES(3,1)";
$sql4 = "SELECT * from AddMusicPL NATURAL JOIN Music where user_id = 3";

mysqli_query($conn, $sql1);
$result1 = mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
$result2 = mysqli_query($conn, $sql4);

if (!$result1 || !$result2) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User id: {$row['user_id']} ⠀⠀Music id: {$row['music_id']}
   ⠀⠀Title: {$row['title']}</li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>User id: {$row['user_id']} ⠀⠀Music id: {$row['music_id']}
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
    <font color="green"><h2> >>> Add new music in a user's playlist </h2></font>

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
        INSERT INTO AddMusicPL(user_id, music_id) VALUES(3,1);
      </h4>
    </p>

  </body>
</html>
