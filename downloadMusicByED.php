<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT Music.title, DownloadMusic.downloadedDate, DownloadMusic.expiredDate
          FROM DownloadMusic JOIN Music ON DownloadMusic.music_id= Music.music_id WHERE user_id = 3 ORDER BY expiredDate";

$result= mysqli_query($conn, $sql1);


if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."<li>TITLE: {$row['title']}&nbsp &nbsp DOWNLOAD: {$row['downloadedDate']} &nbsp &nbsp EXPIRE: {$row['expiredDate']}<br><br></li>";
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
    <font color="green"><h2> >>> Sort all the downloaded music by expiredDate </h2></font>

    <ol>
      <h3>Download list by expired date</h3>
      <h4><?=$list?></h4><br>
    </ol>

    <p>
      <font color= "green"><h2> >>> Query </h2></font>
      <h4>
        SELECT Music.title, DownloadMusic.downloadedDate, DownloadMusic.expiredDate<br><br>
        FROM DownloadMusic JOIN Music<br><br>
        ON DownloadMusic.music_id= Music.music_id WHERE user_id = 3<br><br>
        ORDER BY expiredDate<br><br>
      </h4>
    </p>


  </body>
</html>
