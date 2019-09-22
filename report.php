<?php 
include('session.php');
?>
<html lang="en">
<head>
   		<title>Reports</title>
           <link rel="stylesheet" href="css/bootstrap.css">
  <link href="css/Montserrat.css" rel="stylesheet" type="text/css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/font-awesome.css">
  <link rel="stylesheet" href="css/style.css">
  <link href="css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
  <script src="js/dash/bootstrap.min.js"></script>
  <script src="js/dash/jquery-1.11.1.min.js"></script>

   <link rel="stylesheet" href="js/tbl/dataTables.bootstrap.min.css">
   <script src="js/tbl/jquery-3.3.1.js"></script>
   <script src="js/tbl/jquery.dataTables.min.js"></script>
   <script src="js/tbl/dataTables.bootstrap.min.js"></script>
</head>
<style>
body{
    background-image:URL("img/logo.png");
    background-position: center;
    background-repeat: no-repeat;

}
</style>

<body>
<div id="cash" style="border:1px solid black; width:100%; margin-top:10px;">
    <h3 style="text-align:center"><b>Samurdhi bank</b></h3>
<h5 style="text-align:center">Weekly report</h5>
<h5 style="text-align:center"><?php echo date("Y/m/d") ?> </h5>

<table class="table table-bordered table-dark">
  <thead>
    <tr>
      <th scope="col">Date</th>
      <th scope="col">Acc no</th>
      <th scope="col">Income / Expense</th>
      <th scope="col">Total</th>
    </tr>
  </thead>
  <tbody>
  <?php
  $addd=mysqli_query($connection,'SELECT SUM(amount) from `transaction` where `type`="Saving"');
  while($row2=mysqli_fetch_array($addd))
      {
      $total2=$row2['SUM(amount)'];
  }


$sql = "SELECT * FROM transaction where `type`='Saving'";

  $result = $connection->query($sql);
  if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {

          ?>
          <tr>
          <td><?php echo $row["date"] ?></td>
            <td><?php echo $row["acc_no"] ?></td>
            
            <td><?php echo $row["acc_no"] ?></td>
            <td></td>
           </tr>
        <?php }} ?>
        <tr>
        <td colspan="3"><b>Total income :</b></td>
            <td align="right"><?php echo $total2 ?></td>
        </tr>

        <?php
  $adddd=mysqli_query($connection,'SELECT SUM(amount) from `transaction` where `type`="Withdrawing"');
  while($row4=mysqli_fetch_array($adddd))
      {
      $total4=$row4['SUM(amount)'];
  }


$sql3 = "SELECT * FROM transaction where `type`='Withdrawing'";

  $result3 = $connection->query($sql3);
  if ($result3->num_rows > 0) {
    // output data of each row
    while($row3 = $result3->fetch_assoc()) {

          ?>
          <tr>
          <td><?php echo $row3["date"] ?></td>
            <td><?php echo $row3["acc_no"] ?></td>
            
            <td><?php echo $row3["acc_no"] ?></td>
            <td></td>
           </tr>
        <?php }} ?>
        <tr>
        <td colspan="3"><b>Total Expences :</b></td>
            <td align="right"><?php echo $total4 ?></td>
        </tr>

  </tbody>
</table>


<br>
</div>
</body>
</html>
