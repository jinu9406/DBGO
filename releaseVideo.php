<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "DELETE FROM Video
  WHERE music_id = (SELECT music_id FROM Music WHERE title = 'AH YEAH')";
  $sql2 = "INSERT INTO Video(title, lengthOfVideo, releasedDate, music_id)
          VALUES ('AH YEAH',191,'2019-05-15',(SELECT music_id FROM Music WHERE title = 'AH YEAH' AND music_id <> 'NULL'))";
  $sql3 = "SELECT * FROM Video ORDER BY video_id DESC";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
$result1 = mysqli_query($conn, $sql3);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>TITLE: {$row['title']} &nbsp &nbsp LENGTH: {$row['lengthOfVideo']} &nbsp &nbsp LIKES: {$row['numOfLike']}<br><br></li>";
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
    <font color="green"><h2> >>> Release a video related to the new music </h2></font>

    <ol>
      <h3>List of Videos</h3>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
