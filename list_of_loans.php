<?php
include('session.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Samurdhi bank - Loan</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
<body>
</head>
<div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>
<div id="wrapper">
<!-- include sidebar -->
<?php include('sidebar.php'); ?>
<!-- / include sidebar -->

<!-- Content start -->
    <div class="col-sm-10">
    <div id="page-wrapper" >
        <div class="container-fluid"><!-- Page Heading -->
            <div class="row" id="main" style="margin: 0;">
                <div class="col-sm-12 col-md-12 well" id="content" style="background-color: #ffff; border: 1px solid #f9f6f6;">
                    <h3 style="margin-bottom: 20px;">Loans</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" style="padding-left: 2%;padding-right: 2%;">

<!-- Notifications-->
 <?php if(isset($_GET['Deleted']))
echo '<div class="alert alert-danger" role="alert"  style="width90%;">'.'<strong>Success!</strong> Deleted successfully..!!.'.'</div>';
  ?>

 <?php if(isset($_GET['inserted']))
echo '<div class="alert alert-success" role="alert">'.'<strong>Success!</strong> Inserted successfully..!!.'.'</div>';
  ?>

 <?php if(isset($_GET['edit']))
echo '<div class="alert alert-success" role="alert">'.'<strong>Success!</strong> Payment completed successfully..!!.'.'</div>';
  ?>

<!-- /Notifications-->
</div>
<table id="example" class="table table-bordered">
 <script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable();
} );</script>       
<thead>
            <tr>
                <th>Account_number</th>
                <th>loan type</th>
                <th>loan amount</th>
                <th>Due amount</th>
                <th>maturity</th>
                <th>requesting date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
<?php

$sql = "SELECT * from loan where status='Approved'";
  $result = $connection->query($sql);

  if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {


          ?>
          <tr>
            <td><?php echo $row["account_number"] ?></td>
            <td><?php echo $row["loan_type"] ?></td>
            <td><?php echo $row["lan_amount"] ?></td>
            <td><?php echo $row["due_amount"] ?></td>
            <td><?php echo $row["maturity"] ?></td>
            <td><?php echo $row["requesting_date"] ?></td>
            <td align="center"><a href="loan_summary.php?RID=<?php echo $row['lid'];?>" style="text-decoration: none;"><span class="fas fa-low-vision"></span> </a> </td>
          </tr>
        <?php }} ?>
        </tbody>
        <tfoot>
            <tr>
                <th>Account_number</th>
                <th>loan type</th>
                <th>loan amount</th>
                <th>Due amount</th>
                <th>maturity</th>
                <th>requesting date</th>
                <th>Status</th>
            </tr>
        </tfoot>
    </table>
            </div><!-- /.row -->
        </div> <!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /content end -->
</div>
</div>
</body>
</html>