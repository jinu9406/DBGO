<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT Singer.name, Album.title, Album.releasedDate, Album.genre
          From Album Join Singer
          where Album.singer_id=Singer.singer_id and Singer.name = '폴킴'
          order by Album.releasedDate";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Name: {$row['name']} ⠀⠀Title: {$row['title']}
                     ⠀⠀Title: {$row['title']} ⠀⠀releasedDate: {$row['releasedDate']}</li>";
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
    <font color="green"><h2> >>> Sort all the albums of a singer by released date </h2></font>

    <ol>
      <?=$list1?>
    </ol>

  </body>
</html>
