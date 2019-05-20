<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT R.name name1, S.name name2, S.debutDate
          FROM Singer as R JOIN Singer as S
          ON R.debutDate = S.debutDate AND R.singer_id < S.singer_id";

$result1 = mysqli_query($conn, $sql1);


if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Group: {$row['name1']} ⠀⠀Name: {$row['name2']} ⠀⠀Debut Date: {$row['debutDate']}</li>";
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
    <font color="green"><h2> >>> Show all the singers who have the same debutDate </h2></font>
    <ol>
      <h4><?=$list1?></h4><br>
    </ol>

    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        SELECT R.name name1, S.name name2, S.debutDate<br><br>
          FROM Singer as R JOIN Singer as S<br><br>
          ON R.debutDate = S.debutDate AND R.singer_id < S.singer_id;<br><br>
      </h4>
    </p>

  </body>
</html>
