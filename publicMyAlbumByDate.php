<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT myAlbum_id, title, isPrivate, createdDate FROM MyAlbum WHERE isPrivate = 0 ORDER BY createdDate";

$result1 = mysqli_query($conn, $sql1);


if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>MyAlbum id: {$row['myAlbum_id']} ⠀⠀Title: {$row['title']}
   ⠀⠀isPrivate: {$row['isPrivate']} ⠀⠀CreatedDate: {$row['createdDate']}</li>";
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
    <font color="green"><h2> >>> Sort all the public MyAlbums by createdDate </h2></font>

    <ol>
      <h4><?=$list1?></h4><br>
    </ol>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        SELECT * FROM MyAlbum WHERE isPrivate = 0 ORDER BY createdDate;
      </h4>
    </p>

  </body>
</html>
