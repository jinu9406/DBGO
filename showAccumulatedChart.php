<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sq11 = "DROP VIEW Chart";
$sql2 = "UPDATE AccumulatedChart SET isDeleted = 1 WHERE isDeleted = 0 AND ranking <= 5";
$sql3 = "CREATE VIEW Chart AS SELECT music_id FROM Music ORDER BY playCount DESC limit 5";
$sql4 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 0,1),1)";
$sql5 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 1,1),2)";
$sql6 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 2,1),3)";
$sql7 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 3,1),4)";
$sql8 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 4,1),5)";
$sql9 = "SELECT AccumulatedChart.ranking, Music.title, Music.playCount
            FROM AccumulatedChart NATURAL JOIN Music
            WHERE AccumulatedChart.isDeleted = 0";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
mysqli_query($conn, $sql4);
mysqli_query($conn, $sql5);
mysqli_query($conn, $sql6);
mysqli_query($conn, $sql7);
mysqli_query($conn, $sql8);
$result1 = mysqli_query($conn, $sql9);


if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Ranking: {$row['ranking']} ⠀⠀Title: {$row['title']}
   ⠀⠀Playcount: {$row['playCount']}</li>";
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
    <font color="green"><h2> >>> Show AccumulatedChart </h2></font>

    <ol>
      <h4><?=$list1?></h4><br>
    </ol>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        SELECT AccumulatedChart.ranking, Music.title, Music.playCount<br><br>
          FROM AccumulatedChart NATURAL JOIN Music<br><br>
          WHERE AccumulatedChart.isDeleted = 0;<br><br>
      </h4>
    </p>
  </body>
</html>
