<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "DROP VIEW LikeAlbum";
$sql2 = "CREATE VIEW LikeSinger AS SELECT * FROM LikeMedia WHERE mediaInfo_id = 1";
$sql3 = "SELECT A.name, count(B.media_id) as numOfLike
FROM Singer A JOIN LikeSinger B
ON A.singer_id = B.media_id
WHERE B.media_id = 1";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
$result1 = mysqli_query($conn, $sql3);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Name: {$row['name']} ⠀⠀NumOfLike: {$row['numOfLike']}</li>";
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
    <font color="green"><h2> >>> Get number of likes of one singer by LikeMedia </h2></font>

      <?=$list1?>

      <p>
        <font color="green"><h2>>>> Query </h2></font>
        <h4>
          START TRANSACTION;<br><br>
CREATE VIEW LikeSinger AS SELECT * FROM LikeMedia WHERE mediaInfo_id = 1;<br><br>
SELECT A.name, count(B.media_id) as numOfLike<br><br>
FROM Singer A JOIN LikeSinger B<br><br>
ON A.singer_id = B.media_id<br><br>
WHERE B.media_id = 1;<br><br>
COMMIT;<br><br>
        </h4>
      </p>
  </body>
</html>
