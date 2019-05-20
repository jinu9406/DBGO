<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$q1 = "DROP VIEW Temp, Chart";
$q2 = "CREATE VIEW Temp AS SELECT music_id, playCount from Music order by playCount DESC limit 2";
$q3 = "UPDATE Music SET playCount = (select max(playCount) from Temp) + 1
WHERE music_id = (select music_id from Temp order by playCount DESC limit 1,1)";
$q4 = "UPDATE Music SET playCount = (SELECT count(*) FROM PlayMusic
WHERE music_id = (select music_id from Temp order by playCount DESC limit 1))
WHERE music_id = (select music_id from Temp order by playCount DESC limit 1)";

mysqli_query($conn, $q1);
mysqli_query($conn, $q2);
mysqli_query($conn, $q3);

$sql1 = "UPDATE AccumulatedChart SET isDeleted = 1 WHERE isDeleted = 0 AND ranking <= 5";
$sql2 = "CREATE VIEW Chart AS SELECT music_id FROM Music ORDER BY playCount DESC limit 5";
$sql3 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 0,1),1)";
$sql4 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 1,1),2)";
$sql5 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 2,1),3)";
$sql6 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 3,1),4)";
$sql7 = "INSERT INTO AccumulatedChart(music_id, ranking) VALUES((select music_id from Chart limit 4,1),5)";
$sql8 = "SELECT AccumulatedChart.ranking, Music.title, Music.playCount
          FROM AccumulatedChart NATURAL JOIN Music
          WHERE AccumulatedChart.isDeleted = 0";

mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
mysqli_query($conn, $sql4);
mysqli_query($conn, $sql5);
mysqli_query($conn, $sql6);
mysqli_query($conn, $sql7);
$result1 = mysqli_query($conn, $sql8);
mysqli_query($conn, $q4);


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
    <font color="green"><h2> >>> Update AccumulatedChart </h2></font>

    <ol>
      <h4><?=$list1?></h4>
    </ol>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        START TRANSACTION;<br><br>
UPDATE AccumulatedChart SET isDeleted = 1 WHERE isDeleted = 0 AND ranking <= 5;<br><br>
CREATE VIEW Chart AS SELECT music_id FROM Music ORDER BY playCount DESC limit 5;<br><br>
INSERT INTO AccumulatedChart(music_id, ranking) VALUES((SELECT music_id FROM Chart LIMIT 0,1),1);<br><br>
INSERT INTO AccumulatedChart(music_id, ranking) VALUES((SELECT music_id FROM Chart LIMIT 1,1),2);<br><br>
INSERT INTO AccumulatedChart(music_id, ranking) VALUES((SELECT music_id FROM Chart LIMIT 2,1),3);<br><br>
INSERT INTO AccumulatedChart(music_id, ranking) VALUES((SELECT music_id FROM Chart LIMIT 3,1),4);<br><br>
INSERT INTO AccumulatedChart(music_id, ranking) VALUES((SELECT music_id FROM Chart LIMIT 4,1),5);<br><br>
COMMIT;<br>
      </h4>
    </p>

  </body>
</html>
