<?php
include('session.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Samurdhi bank - Customer</title>
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
                    <h3 style="margin-bottom: 20px;">Customers</h3>
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
echo '<div class="alert alert-success" role="alert">'.'<strong>Success!</strong> Edited successfully..!!.'.'</div>';
  ?>

<!-- /Notifications-->

<table id="example" class="table table-striped table-bordered" style="width:100%;">
 <script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable();
} );</script>       
<thead>
            <tr>
                <th>ID</th>
                <th>Customer name</th>
                <th>Nic</th>
                <th>Contact</th>
                <th>Adress</th>
                <th>Email</th>
                <th>PIN</th>
                <th>User name</th>
                <th>Password</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
<?php

$sql = "SELECT * from customer";
  $result = $connection->query($sql);

  if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {


          ?>
          <tr>
            <td><?php echo $row["cid"] ?></td>
            <td><?php echo $row["name"] ?></td>
            <td><?php echo $row["nic"] ?></td>
            <td><?php echo $row["contact"] ?></td>
            <td><?php echo $row["address"] ?></td>
            <td><?php echo $row["email"] ?></td>
            <td><?php echo $row["transactionpin"] ?></td>
            <td><?php echo $row["uname"] ?></td>
            <td><?php echo $row["password"] ?></td>
            <td align="center"><a href="edit_customer.php?RID=<?php echo $row['nic'];?>" style="text-decoration: none;"><span class="glyphicon glyphicon-edit"></span> </a> | 
              <a href="delete_customer.php?RID=<?php echo $row['nic'];?>" onclick="return confirm('Are you sure?')" style="text-decoration: none;"><span class="far fa-trash-alt"></span> </a> |
              <a href="customer_profile.php?RID=<?php echo $row['nic'];?>" style="text-decoration: none;"><span class="fas fa-low-vision"></span> </a> 
            </td>
          </tr>
        <?php }} ?>
        </tbody>
        <tfoot>
            <tr>
            <th>ID</th>
                <th>Customer name</th>
                <th>Nic</th>
                <th>Contact</th>
                <th>Adress</th>
                <th>Email</th>
                <th>PIN</th>
                <th>User name</th>
                <th>Password</th>
                <th>Action</th>
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