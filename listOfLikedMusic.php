<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "DROP VIEW UserLikeMusic";
$sql2 = "CREATE VIEW UserLikeMusic AS SELECT * FROM LikeMedia WHERE mediaInfo_id = 3";
$sql3 = "SELECT A.user_id, B.title
FROM UserLikeMusic A JOIN Music B
ON B.music_id = A.media_id
WHERE A.user_id = 3";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
$result1 = mysqli_query($conn, $sql3);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User id: {$row['user_id']} ⠀⠀Title: {$row['title']}</li>";
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
    <font color="green"><h2> >>> Show list of music that a user likes </h2></font>

      <?=$list1?>

  </body>
</html>
