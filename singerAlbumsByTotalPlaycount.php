<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT R.name, S.title, COUNT(T.music_id) as numOfMusic, SUM(T.playCount) as sumOfPlayCount
FROM Singer R JOIN Album S ON R.singer_id = S.singer_id
JOIN Music T ON S.album_id = T.album_id
WHERE R.singer_id = 17
GROUP BY S.title
ORDER BY SUM(T.playCount) DESC";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Name: {$row['name']} ⠀⠀Title: {$row['title']}
                     ⠀⠀NumOfMusic: {$row['numOfMusic']} ⠀⠀SumOfPlayCount: {$row['sumOfPlayCount']}</li>";
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
    <font color="green"><h2> >>> Sort all the albums of a singer by sum of playcount in the album<br>
          and find out how many music are in the albume </h2></font>

    <ol>
      <?=$list1?>
    </ol>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        SELECT R.name, S.title, COUNT(T.music_id) as numOfMusic, SUM(T.playCount) as sumOfPlayCount<br><br>
FROM Singer R JOIN Album S ON R.singer_id = S.singer_id<br><br>
JOIN Music T ON S.album_id = T.album_id<br><br>
WHERE R.singer_id = 17<br><br>
GROUP BY S.title<br><br>
ORDER BY SUM(T.playCount) DESC;<br><br>
    </p>

  </body>
</html>
