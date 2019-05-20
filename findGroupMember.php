<?php
$conn = mysqli_connect(
  '127.0.0.1',
  'root',
  'Hisnet12!',
  'genie');

$sql1 = "SELECT A.name name1, B.name name2 from Singer A, Singer B where A.name = B.relatedGroup";

$result1 = mysqli_query($conn, $sql1);

if (!$result1) {
    echo "Could not successfully run query from DB: " . mysql_error();
    exit;
}

while($row = mysqli_fetch_array($result1)) {
  $list1 = $list1."<li>Group: {$row['name1']} ⠀⠀Name: {$row['name2']}</li>";
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
    <font color="green"><h2> >>> Find all the members belonging to a group </h2></font>

      <?=$list1?>

      <p>
        <font color="green"><h2>>>> Query </h2></font>
        <h4>
          SELECT A.name name1, B.name name2<br><br>
  from Singer A, Singer B where A.name = B.relatedGroup;<br><br>
        </h4>
      </p>
  </body>
</html>
