<?php
include('session.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Samurdhi bank - Dashboard</title>
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
<body>
</head>
<div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>
<div id="wrapper">
<!-- include sidebar -->
<?php include('sidebar.php'); 
$date=date('Y-m-d');
?>
<!-- / include sidebar -->

<!-- Content start -->
    <div class="col-sm-10">
    <div id="page-wrapper">
        <div class="container-fluid"><!-- Page Heading -->
                 <h4 style="float:right;"> <?php 
                  echo "Today's date is : "; 
                  $today = date("Y/m/d"); 
                  echo $today; 
                  ?> </h4>
            <div class="row" id="main" >
                <div class="col-sm-12 col-md-12 well" id="content" style="background-color: #ffff; border: 1px solid #f9f6f6; ">
                <div class="row">
                   <div class="col-lg-12" style="padding-top:40px;">
                   <h3 >Welcome <strong style="color:#293a4a;"><?php echo $_SESSION['login_type'] ?> !</strong></h3>
                   
                   <div class="col-lg-3" style="background-color: #fbfbfb; text-align:center; color:#af4b4b; cursor:pointer;">
                   <span class="fab fa-paypal" style="font-size:50px; padding-top:40px;"></span>
                    <h4>My wallet(income)</h4>
                    <?php
                    $addd=mysqli_query($connection,'SELECT SUM(amount) from `transaction`');
                    while($row2=mysqli_fetch_array($addd))
                        {
                        $total2=$row2['SUM(amount)'];
                    }
                        ?>

                    <h5 style="color: black;"><strong><?php echo $total2 ?>.00</strong>
                   </div>
                   <div class="col-lg-1" ></div>
                   <div class="col-lg-3" style="background-color: #fbfbfb; text-align:center; color:#af4b4b; cursor:pointer;">
                   <span class="fab fa-" style="font-size:50px; padding-top:40px;">S</span>
                    <?php
                    
                   $query = mysqli_query($connection, "SELECT * from transaction WHERE date='$date'");
                    $rows = mysqli_num_rows($query);
                    ?>
                    <h4>Transactions(Today)</h4>
                    <h5 style="color: black;"><strong><?php echo $rows; ?></strong></h5>
                    </div>
                    <div class="col-lg-1" ></div>
                    <div class="col-lg-3" style="background-color: #fbfbfb; text-align:center; color:#af4b4b; cursor:pointer;">
                   <span class="fab fa-paypal" style="font-size:50px; padding-top:40px;"></span>
                    <h4>Pending loans</h4>
                    <?php
                   $query2 = mysqli_query($connection, "SELECT * from loan WHERE status='pending'");
                    $rows2 = mysqli_num_rows($query2);
                    ?>
                    <h5 style="color: black;"><strong><?php echo $rows2 ?></strong></h5>
                    </div>
                   </div>

                   </div>
                   </div>
                    
                    <h3 class="day-message"></h3>
                </div>
            </div><!-- /.row -->
        </div> <!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /content end -->
</div>
</div>

</body>
</html>