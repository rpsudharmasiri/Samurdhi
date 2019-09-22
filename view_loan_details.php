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
<?php
                            $RID=$_REQUEST['RID'];

                            //search value
                            $query = "SELECT * FROM loan loa,account aco,customer cus WHERE  loa.account_number='$RID' AND  loa.account_number=aco.acc_no and aco.nic=cus.nic and status='pending'";
                                $result = mysqli_query($connection,$query);
                                while($row=mysqli_fetch_assoc($result))
                                {
                                    $lid=$row['lid'];
                                    $name=$row['name'];
                                    $nic=$row['nic'];
                                    $account_number=$row['account_number'];
                                    $loan_type=$row['loan_type'];
                                    $lan_amount=$row['lan_amount'];
                                    $maturity=$row['maturity'];
                                    $intrest_rate=$row['intrest_rate'];
                                    $requesting_date=$row['requesting_date'];
                                   $guranter1_nic=$row['guranter1_nic'];
                                   $guranter2_nic=$row['guranter2_nic'];
                                   $document1=$row['document1'];
                                   $document2=$row['document2'];
                                   $document3=$row['document3'];
                            }
                            
                            

                            ?>
<!-- Content start -->
    <div class="col-sm-10">
    <div id="page-wrapper" >
        <div class="container-fluid"><!-- Page Heading -->
            <div class="row" id="main" style="margin: 0;">
                <div class="col-sm-12 col-md-12 well" id="content" style="background-color: #ffff; border: 1px solid #f9f6f6;">
                <a class="btn btn-default" href="system_dashboard.php" style="float:right; margin-left:10px;"><i class="glyphicon glyphicon-home"> Home</i></a>
                <a href ="loan_approved.php?RID=<?php echo $lid ?>" class="btn btn-info" style="float:right;">Approve</a>
                    <a href ="loan_reject.php?RID=<?php echo $lid ?>" class="btn btn-warning" style="float:right; margin-right:10px;" >Reject</a>
                    
                    <h3 style="margin-bottom: 20px;">Loan Request form</h3>
                    <hr>

                    <!-- Form start -->
        <div class="row" style="padding-left: 2%;padding-right: 2%;">
        <div class="col-sm-6">
            
        <h5 style="margin-top:20px;">Customer:<b> <?php echo $name ?></b></h4>
        <h5 style="margin-top:20px;">Account No:<b> <?php echo $account_number ?></b></h4>
        <h5 style="margin-top:20px;">NIC:<b> <?php echo $nic ?></b></h4>
        <h5 style="margin-top:20px;">Loan type:<b> <?php echo $loan_type ?></b></h4>
        </div>

        <div class="col-sm-6">
        <h5 style="margin-top:20px;">Request date:<b> <?php echo $requesting_date ?></b></h4>
        <h5 style="margin-top:20px;">Maturity:<b> <?php echo $maturity ?></b></h4>
        
        </div></div>
        <div class="row" style="padding-left: 2%;padding-right: 2%;">
        <h3 style="margin-bottom: 20px;">Amount details</h3>
        <div class="col-sm-12">
        <h5 style="margin-top:20px;">Loan amount:<b> <?php echo $lan_amount ?>.00</b></h4>
        <h5 style="margin-top:20px;">Maturity:<b> <?php echo $maturity ?></b></h4>
        <h5 style="margin-top:20px;">Intrest rate: <b><?php echo $intrest_rate ?></b></h4>
        
        <h5 style="margin-top:20px;">Document 1:<b> <a class="btn btn-default" href="view_document.php?RID=<?php echo $lid ?>" style=" margin-left:2px;"><i class="glyphicon glyphicon-vision"> View </i></a></b>  <?php echo $document1 ?> </h4>
        <h5 style="margin-top:20px;">Document 2:<b> <a class="btn btn-default" href="view_document.php?RID=<?php echo $lid ?>" style=" margin-left:2px;"><i class="glyphicon glyphicon-vision"> View</i></a></b>  <?php echo $document2 ?></h4>
        <h5 style="margin-top:20px;">Document 3:<b> <a class="btn btn-default" href="view_document.php?RID=<?php echo $lid ?>" style=" margin-left:2px;"><i class="glyphicon glyphicon-vision"> View</i></a></b>  <?php echo $document3 ?></h4>
        </div>
        </div>
        <div class="row" style="padding-left: 2%;padding-right: 2%;">
        <h3 style="margin-bottom: 20px;">Guranter details</h3>
        <div class="col-sm-8">
        <table class="table-bordered" width="100%">
        <tr>
        <th>Guranter</th>
        <th>Guranter NIC</th>
        <th style="text-align:center;">Action</th>
        </tr>

        <tr>
        <td>Guranter 1</td>
        <td><?php echo $guranter1_nic ?></td>
        <td style="text-align:center;"> <a class="btn btn-default" href="customer_profile.php?RID=<?php echo $guranter1_nic  ?>" style=" margin-left:2px;"><i class="glyphicon glyphicon-vision"> View </i></a>
        </td>
        <tr>
        <tr>
        <td>Guranter 2</td>
        <td><?php echo $guranter2_nic ?></td>
        <td style="text-align:center;"> <a class="btn btn-default" href="customer_profile.php?RID=<?php echo $guranter1_nic  ?>" style=" margin-left:2px;"><i class="glyphicon glyphicon-vision"> View </i></a>
       
        <tr>
        </table>
        </div>
        <div class="col-sm-6">
        </div>
        </div>
        </div><!-- /.row -->
        </div> <!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /content end -->
</div>
</div>
</body>
</html>