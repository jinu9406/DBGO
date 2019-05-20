<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "DELETE FROM Album
  WHERE singer_id = (SELECT singer_id FROM Singer WHERE name = '위너') AND singer_id <> 'NULL'";
  $sql2 = "INSERT INTO Album
            (title, releasedDate, genre, studio, rating, introduction,singer_id)
           VALUES('WE','2019-05-15','댄스','(주)YG엔터테인먼트', 4.1,
           ' WINNER라는 그룹으로 뭉친 4 멤버들의 또 다른 시작과 묵직한 다짐을 담아냈다..',
         (SELECT singer_id FROM Singer WHERE name = '위너' AND singer_id <> 'NULL'))";
  $sql3 = "SELECT * FROM Album ORDER BY album_id DESC";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
$result1 = mysqli_query($conn, $sql3);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>TITLE: {$row['title']}&nbsp &nbsp RELEASED: {$row['releasedDate']} &nbsp &nbsp RATING: {$row['rating']} &nbsp &nbsp LIKES: {$row['numOfLike']}<br> INTRO: {$row['introduction']}<br><br></li>";
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
    <font color="green"><h2> >>> Release the new singer's album </h2></font>

    <ol>
      <h3>List of Albums</h3>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
