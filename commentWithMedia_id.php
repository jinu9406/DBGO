<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql = "SELECT S.name, T.user_id, T.text
          FROM UnitedMedia as R JOIN Singer as S ON R.media_id = S.singer_id
         JOIN Comment as T ON T.mediaInfo_id = R.mediaInfo_id AND T.media_id = R.media_id
          WHERE R.mediaInfo_id = 1 AND S.singer_id = 19";

$result = mysqli_query($conn, $sql);

if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."<li>SINGER: {$row['name']}<br>USER: {$row['user_id']}<br>COMMENT: {$row['text']}<br><br></li>";
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
    <font color="green"><h2> >>> Show one comment and its related media </h2></font>

    <ol>
      <h3>Comment of &nbsp 'MC THE MAX'</h3>
      <h4><?=$list?></h4><br>
    </ol>

    <p>
      <font= color= "green"><h2> >>> Query </h2></font>
      <h4>
        SELECT S.name, T.user_id, T.text<br><br>
        FROM UnitedMedia as R JOIN Singer as S<br><br>
        ON R.media_id = S.singer_id JOIN Comment as T<br><br>
        ON T.mediaInfo_id = R.mediaInfo_id AND T.media_id = R.media_id<br><br>
        WHERE R.mediaInfo_id = 1 AND S.singer_id = 19<br><br>
      </h4>
    </p>



  </body>
</html>
