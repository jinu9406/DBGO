<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "DELETE FROM User WHERE id = 'gogogo'";
$sql2 = "SELECT id, email FROM User WHERE user_id > 0";
$sql3 = "INSERT INTO User (id, password, email, phoneNumber, voucher)
            VALUES ('gogogo', 1234, 'gogogo@handong.edu', '01056902291', 'Streaming')";
$sql4 = "SELECT id, email FROM User where user_id > 0";

mysqli_query($conn, $sql1);
$result1 = mysqli_query($conn, $sql2);
mysqli_query($conn, $sql3);
$result2 = mysqli_query($conn, $sql4);

if (!$result1 || !$result2) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>User: {$row['id']} ⠀⠀Email: {$row['email']}</li>";
}

while($row = mysqli_fetch_array($result2)) {
  $list2 = $list2."<li>User: {$row['id']} ⠀⠀Email: {$row['email']}</li>";
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
    <font color="green"><h2> >>> Create a user </h2></font>

    <ol>
      <h3>Before</h3>
      <h4><?=$list1?></h4><br>
    </ol>

    <ol>
      <h3>After</h3>
      <h4><?=$list2?></h4><br>
    </ol>


    <p>
      <font color="green"><h2>>>> Query </h2></font>
      <h4>
        INSERT INTO User (id, password, email, phoneNumber, voucher)<br><br>
            VALUES ('gogogo', 1234, 'gogogo@handong.edu', '01056902291', 'Streaming');<br><br>
      </h4>
    </p>

  </body>
</html>
