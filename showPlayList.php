<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT AddMusicPL.user_id, AddMusicPL.music_id, Music.title, Music.playcount
          from AddMusicPL natural join Music
          Where AddMusicPL.user_id=3";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User id: {$row['user_id']} ⠀⠀Music id: {$row['music_id']}
               ⠀⠀Title: {$row['title']} ⠀⠀Playcount: {$row['playcount']}</li>";
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
    <font color="green"><h2> >>> Show a user's playlist </h2></font>

    <ol>
      <?=$list1?>
    </ol>

  </body>
</html>
