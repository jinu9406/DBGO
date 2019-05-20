<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "DROP VIEW UserLikeSinger";
$sql2 = "CREATE VIEW UserLikeSinger AS SELECT * FROM LikeMedia WHERE mediaInfo_id = 1";
$sql3 = "SELECT A.user_id, B.name
FROM UserLikeSinger A JOIN Singer B
ON B.singer_id = A.media_id
WHERE A.user_id = 3";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
$result1 = mysqli_query($conn, $sql3);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User id: {$row['user_id']} ⠀⠀Name: {$row['name']}</li>";
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
    <font color="green"><h2> >>> Show list of singers that a user likes </h2></font>

      <?=$list1?>

      <p>
        <font color="green"><h2>>>> Query </h2></font>
        <h4>
          START TRANSACTION;<br><br>
CREATE VIEW UserLikeSinger AS SELECT * FROM LikeMedia WHERE mediaInfo_id = 1;<br><br>
SELECT A.user_id, B.name<br><br>
FROM UserLikeSinger A JOIN Singer B<br><br>
ON B.singer_id = A.media_id<br><br>
WHERE A.user_id = 3;<br><br>
COMMIT;<br><br>

        </h4>
      </p>

  </body>
</html>
