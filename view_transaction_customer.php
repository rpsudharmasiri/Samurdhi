<?php
include('session.php');
$RID=$_REQUEST['RID'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Samurdhi bank - Transations</title>
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
<div class="row" style="margin-right:15px;">
    <div class="col-sm-2">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color: #293a4a; color: white;">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="color: white;" href="system_dashboard.php">
                <h4><img src="img/logo.png" alt="LOGO" width="40px" height="40px"> Samurdhi bank</h4>
            </a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
                        
            <li >
                <a href="customer_logout.php" style="text-decoration:none; color:white;"><?php echo $_SESSION['login_user']; ?> | <b class="far fa-share-square"></b> </a>
               
            </li>
        </ul>
</div>
<?php
$date=date('Y-m-d');
?>

<!-- Content start -->
    <div class="col-sm-12">
    <div id="page-wrapper" >
        <div class="container-fluid"><!-- Page Heading -->
            <div class="row" id="main" style="margin: 0;">
                <div class="col-sm-12 col-md-12 well" id="content" style="background-color: #ffff; border: 1px solid #f9f6f6;">
                <a class="btn btn-default" href="customer_dashboard.php" style="float:right; margin-left:2px;"><i class="glyphicon glyphicon-home"> Home</i></a>
                    <h3 style="margin-bottom: 20px;">Transactions</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" style="padding-left: 2%;padding-right: 2%;">


<table id="example" class="table table-striped table-bordered" style="width:100%;">
      
<thead>
            <tr>
                <th>ID</th>
                <th>Transction date</th>
                <th>Account No</th>
                <th>Transaction type</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
<?php

$sql = "SELECT * FROM transaction  WHERE acc_no =$RID";

  $result = $connection->query($sql);

  if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {

          ?>
          <tr>
            <td><?php echo $row["tid"] ?></td>
            <td><?php echo $row["date"] ?></td>
            <td><?php echo $row["acc_no"] ?></td>
            <td><?php echo $row["type"] ?></td>
            <td><?php echo $row["amount"] ?></td>
            
          </tr>
        <?php }} ?>
        </tbody>
    </table>

            </div><!-- /.row -->
        </div> <!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /content end -->
</div>
</div>
</body>
</html>