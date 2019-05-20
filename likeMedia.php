<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "DELETE FROM LikeMedia WHERE user_id = 3 AND media_id = 2 AND mediaInfo_id = 1";
$sql2 = "SELECT name, numOfLike FROM Singer WHERE singer_id = 2";
$sql3 = "INSERT INTO LikeMedia(user_id, media_id, mediaInfo_id)
VALUES(3, 2, (SELECT mediaInfo_id FROM MediaInfo where mediaInfoType = 'Singer'))";
$sql4 = "SELECT name, numOfLike FROM Singer WHERE singer_id = 2";

mysqli_query($conn, $sql1);
$result1 = mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
$result2 = mysqli_query($conn, $sql4);

if (!$result1 || !$result2) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Name: {$row['name']} ⠀⠀NumOfLike: {$row['numOfLike']}</li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>Name: {$row['name']} ⠀⠀NumOfLike: {$row['numOfLike']}</li>";
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
    <font color="green"><h2> >>> Give a like to a singer belonging to media </h2></font>

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
        INSERT INTO LikeMedia(user_id, media_id, mediaInfo_id)<br><br>
        VALUES(3, 2, (SELECT mediaInfo_id FROM MediaInfo where mediaInfoType = 'Singer'));<br><br>
      </h4>
    </p>

  </body>
</html>
