<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql1 = "DELETE FROM Singer where name = 'Winner'";
  $sql2 = "INSERT INTO Singer(name, type, genre,debutDate, introduction,nationality)
          VALUES('Winner','group','댄스','2014-04-12','위너는 대한민국의 YG엔터인먼트에 소속된 가수이다.','대한민국')";
  $sql3 = "SELECT * FROM Singer ORDER BY singer_id DESC";


mysqli_query($conn, $sql1);
mysqli_query($conn, $sql2);
$result1 = mysqli_query($conn, $sql3);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list1= '';

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>NAME: {$row['name']} &nbsp &nbsp DEBUT: {$row['debutDate']} &nbsp &nbsp LIKES: {$row['numOfLike']}<br><br></li>";
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
    <font color="green"><h2> >>> Create a new singer </h2></font>

    <ol>
      <h3>List of Singers</h3>
      <h4><?=$list1?></h4><br>
    </ol>

    <p>
      <font color= "green"><h2> >>> Query </h2></font>
      <h4>
        INSERT INTO Singer(name, type, genre,debutDate, introduction,nationality)<br><br>
        VALUES('Winner','group','댄스','2014-04-12','위너는 대한민국의 YG엔터인먼트에 소속된 가수이다.','대한민국');<br><br>
      </h4>
    </p>


  </body>
</html>
