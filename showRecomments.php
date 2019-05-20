<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

  $sql = "SELECT * FROM Comment WHERE parentComment_id = 3";

$result = mysqli_query($conn, $sql);

if (!$result) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

$list= '';

while($row = mysqli_fetch_array($result)) {
  $list = $list."<li>TEXT: {$row['text']} &nbsp &nbsp CREATED: {$row['createdTime']}<br>PARENT COMMENT_ID: {$row['parentComment_id']}<br><br></li>";
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
    <font color="green"><h2> >>> Show recomments of one comment </h2></font>

    <ol>
      <h3>Comment of &nbsp 'Hwasa'</h3>
      <h4><?=$list?></h4><br>
    </ol>

    <p>
      <font color= "green"><h2> >>> Query </h2></font>
      <h4>
        SELECT * FROM Comment WHERE parentComment_id = 3;
      </h4>
    </p>



  </body>
</html>
