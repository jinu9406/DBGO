<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT user_id, music_id from PlayMusic where user_id = 3";
$sql2 = "SELECT music_id, title, playcount from Music where music_id = 1";
$sql3 = "INSERT INTO PlayMusic (user_id, music_id) VALUES (3, 1)";
$sql4 = "SELECT user_id, music_id from PlayMusic where user_id = 3";
$sql5 = "SELECT music_id, title, playcount from Music where music_id = 1";

$result1 = mysqli_query($conn, $sql1);
$result2 = mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
$result3 = mysqli_query($conn, $sql4);
$result4 = mysqli_query($conn, $sql5);

if (!$result1 || !$result2 || !result3 || !result4) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User id: {$row['user_id']} ⠀⠀Music id: {$row['music_id']}</li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>Music id: {$row['music_id']} ⠀⠀Title: {$row['title']} ⠀⠀Playcount: {$row['playcount']}</li>";
}

while($row = mysqli_fetch_array($result3)) {
  $list3 = $list3."<li>User id: {$row['user_id']} ⠀⠀Music id: {$row['music_id']}</li>";
}

while($row = mysqli_fetch_array($result4)) {
  $list4 = $list4."<li>Music id: {$row['music_id']} ⠀⠀Title: {$row['title']} ⠀⠀Playcount: {$row['playcount']}</li>";
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
    <font color="green"><h2> >>> Play music in a user's playlist </h2></font>

    <ol>
      <h3>Before</h3>
      <h4><?=$list1?></h4>
    </ol>
    <?=$list2?><br><br>

    <ol>
      <h3>After</h3>
      <h4><?=$list3?></h4>
    </ol>
    <?=$list4?><br><br>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        INSERT INTO PlayMusic (user_id, music_id) VALUES (3, 1);
      </h4>
    </p>
  </body>
</html>
