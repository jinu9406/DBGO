<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');


$sql1 = "INSERT INTO BookConcert(user_id,concert_id) VALUES(3,3);";
$sql2 = "SELECT * from BookConcert where concert_id = 3";
$sql3 = "SELECT concert_id, title, currentNum, numOfLimit from Concert where concert_id = 3";
$sql4 = "DELETE from BookConcert Where user_id=3 and concert_id = 3;";
$sql5 = "SELECT * from BookConcert where concert_id = 3";
$sql6 = "SELECT concert_id, title, currentNum, numOfLimit from Concert where concert_id = 3";


mysqli_query($conn, $sql1);
$result1 = mysqli_query($conn, $sql2);
$result2 = mysqli_query($conn, $sql3);
mysqli_query($conn, $sql4);
$result3 = mysqli_query($conn, $sql5);
$result4 = mysqli_query($conn, $sql6);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User id: {$row['user_id']} ⠀⠀Concert id: {$row['concert_id']}</li>";
}

while($row = mysqli_fetch_array($result3)) {
  $list3 = $list3."<li>User id: {$row['user_id']} ⠀⠀Concert id: {$row['concert_id']}</li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>Concert id: {$row['concert_id']} ⠀⠀Title: {$row['title']}
   ⠀⠀Current Num: {$row['currentNum']} ⠀⠀Limit Num: {$row['numOfLimit']}</li>";
}

while($row = mysqli_fetch_array($result4)) {
  $list4 = $list4."<li>Concert id: {$row['concert_id']} ⠀⠀Title: {$row['title']}
   ⠀⠀Current Num: {$row['currentNum']} ⠀⠀Limit Num: {$row['numOfLimit']}</li>";
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
    <font color="green"><h2> >>> Cancel a previous concert reservation </h2></font>

    <h2>Before</h2>
      <h3>Reservation History</h3>
      <ol>
        <h4><?=$list1?></h4>
      </ol>
      <h3>Concert</h3>
      <?=$list2?><br><br>

      <h2>After</h2>
        <h3>Reservation History</h3>
        <ol>
          <h4><?=$list3?></h4>
        </ol>
        <h3>Concert</h3>
        <?=$list4?>

  </body>
</html>
