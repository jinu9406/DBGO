<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "DELETE FROM Comment WHERE media_id= 33 AND mediaInfo_id = 2";
  $sql2 = "SELECT * FROM Comment where media_id = 33 AND mediaInfo_id = 2";
  $sql3 = "INSERT INTO Comment (text, user_id, media_id, mediaInfo_id) VALUES('사월인데...', 3, 33, 2)";
  $sql4 = "SELECT * FROM Comment where media_id = 33 AND mediaInfo_id = 2";

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
  $list1 = $list1."<li>COMMENT: {$row['text']} &nbsp &nbsp CREATED: {$row['createdTime']}<br><br></li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>COMMENT: {$row['text']} &nbsp &nbsp CREATED: {$row['createdTime']}<br><br></li>";
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
    <font color="green"><h2> >>> Write comment to one media </h2></font>

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
