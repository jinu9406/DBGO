<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "DELETE FROM downloadMusic WHERE music_id= 1";
  $sql2 = "SELECT * FROM downloadMusic";
  $sql3 = "INSERT INTO DownloadMusic VALUES(3, 1, '2019-05-15 12:38:30', '2019-06-14 12:38:30')";
  $sql4 = "SELECT * FROM downloadMusic";

mysqli_query($conn, $sql1);
$result1 = mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
$result2 = mysqli_query($conn, $sql4);

if (!$result1 || !$result2) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';
$list2= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>USER_ID: {$row['user_id']}&nbsp MUSIC_ID: {$row['music_id']} &nbsp DOWNLOAD: {$row['downloadedDate']} &nbsp EXPIRE: {$row['expiredDate']}<br><br></li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>USER_ID: {$row['user_id']}&nbsp MUSIC_ID: {$row['music_id']} &nbsp DOWNLOAD: {$row['downloadedDate']} &nbsp EXPIRE: {$row['expiredDate']}<br><br></li>";
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
    <font color="green"><h2> >>> Download music </h2></font>

    <ol>
      <h3>Before</h3>
      <h4><?=$list1?></h4><br>
    </ol>

    <ol>
      <h3>After</h3>
      <h4><?=$list2?></h4><br>
    </ol>

  </body>
</html>
