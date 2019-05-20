<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "SELECT * FROM Video WHERE title = '나만,봄'";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>TITLE: {$row['title']} &nbsp &nbsp LENGTH: {$row['lengthOfVideo']} &nbsp &nbsp LIKES: {$row['numOfLike']}<br><br></li>";
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
    <font color="green"><h2> >>> Show one video's infromation </h2></font>

    <ol>
      <h3>Information of Video</h3>
      <h4><?=$list1?></h4><br>
    </ol>

  </body>
</html>
