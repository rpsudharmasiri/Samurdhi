<?php
include('session.php');

// define variables and set to empty values
$b_nameErr = $city_Err = $bid_Err = "";
$RID=$_REQUEST['RID'];
$success_msg = $error_msg = "";

$b_name=$city=$bid="";
//search value
$query = "SELECT * from loan_payment pay,loan loan where id= '$RID' and pay.lid=loan.lid";
    $result = mysqli_query($connection,$query);
    while($row=mysqli_fetch_assoc($result))
    {
      $id=$row['id'];
      $month_payment=$row['month_payment'];
      $payment_date=$row['payment_date'];
      $due_amount=$row['due_amount'];
      $lid=$row['lid'];
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {



    //branch id
if (empty($_POST["lid"])) {
    $lid_Err = "lID is required";
  } else {
    $lid = test_input($_POST["lid"]);
  }

     //branch id
if (empty($_POST["due_amount"])) {
    $due_amount_Err = "due_amount is required";
  } else {
    $due_amount = test_input($_POST["due_amount"]);
  }

//branch id
if (empty($_POST["pid"])) {
    $pid_Err = "PID is required";
  } else {
    $pid = test_input($_POST["pid"]);
  }

//name validation
if (empty($_POST["pay_date"])) {
    $pay_date_err = "Paying date is required";
  } else {
    $pay_date = test_input($_POST["pay_date"]);
  }

// Adress validation
if (empty($_POST["month_payment"])) {
    $month_payment_Err = "Amount is required";
  } else {
    $month_payment= test_input($_POST["month_payment"]);
  }



if (empty($pay_date_err) && empty($pid_Err) && empty($month_payment_Err)) {

      // Check connection
  if($connection === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
  }

  // Escape user inputs for security
  $add_pid = mysqli_real_escape_string($connection, $pid);
  $add_pay_date = mysqli_real_escape_string($connection, $pay_date);
  $add_month = mysqli_real_escape_string($connection, $month_payment);
  $status = 'paid';
  $new_due_amount=$due_amount-$add_month;

  // Attempt insert query execution
 $sql = "UPDATE `loan_payment` SET `payment_status`='$status',`paid date`='$add_pay_date' WHERE `id`='$add_pid'";

  $sql2 = "UPDATE `loan` SET  `due_amount`='$new_due_amount' WHERE `lid`='$lid'";
  if (mysqli_query($connection, $sql2) && mysqli_query($connection, $sql)) {

header('location:list_of_loans.php?edit');


  } else {
      echo "Error: " . $sql . "<br>" . mysqli_error($connection);
  }

}else{
    echo "Please Fill all the required fields";
  }
}
// To protect MySQL injection for Security purpose
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Samurdhi bank - Edit branch</title>
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
  <style>
    .form-control {
    height: calc(3.5rem + 2px);
    padding: 0.70rem 0.75rem;
    font-size: 1.2rem;
    line-height: 1.5;
    color: #495057;
    border-radius: 0;
    }
    label {
        font-size: 1.2rem;
    }
    .row{
        margin-top:10px;
    }
      </style>
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
            
                <div class="col-sm-12 col-md-12 well" id="content" style="background-color: #fdfdfd; border: 1px solid #f9f6f6;">
                <a class="btn btn-default" href="system_dashboard.php" style="float:right; margin-left:2px;"><i class="glyphicon glyphicon-home"> Home</i></a>
                    <h3>Loan payment</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" >

            <div class="col-lg-12" style="background-color: #fdfdfd; padding-top: 40px; padding-bottom: 40px;">

                  
                  <!-- Submit Message -->

                   <form id="add_employee_form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                   <input type="text" class="form-control"  name="lid" value="<?php echo $lid;?>" style="display:none;">
                   <input type="text" class="form-control"  name="due_amount" value="<?php echo $due_amount;?>" style="display:none;">

                   	<div class="row" style="margin-top:-20px;">
                     <div class="col-lg-4">
                      <label for="Emploee Name" >Payment ID:</label>
                      <span class="error-msg" style="color: red;">* </span>
                      <input type="text" class="form-control"  name="pid" value="<?php echo $id;?>" readonly>
                    </div>
                    <div class="col-lg-4">
                      <label for="Contact_no">Payment date:</label>
                      <span class="error-msg" style="color: red;">* </span>
                      <input type="date" class="form-control vendor_name"  name="payent" value="<?php echo $payment_date;?>" readonly>
                    </div>
                    <div class="col-lg-4">
                      <label for="Contact_no">Paying date:</label>
                      <span class="error-msg" style="color: red;">* </span>
                      <input type="date" class="form-control vendor_name"  name="pay_date" value="<?php echo date('Y-m-d')?>" readonly>
                    </div>
                    </div>
                    <div class="row">
                   <div class="col-lg-6">
                      <label for="Emploee Name" >Monthly payment Amount:</label>
                      <span class="error-msg" style="color: red;">* </span>                     
                      <input type="text" class="form-control"  name="month_payment" value="<?php echo $month_payment;?>.00" readonly>
                    </div>
                    </div>
                    <div class="row">
                   <div class="col-lg-12">
                    <button type="submit" class="btn btn-info">Submit</button>
                    <button class="btn btn-danger"><a href="add_branch.php" style="color: #fff; text-decoration: none;">Reset</a></button>
                  </form>
                  </div>
              </div>
                </div>
              </div>

            </div>


          </div>

                    <!-- /Form end -->
                </div>
            </div><!-- /.row -->
        </div> <!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /content end -->
</div>
</div>
</body>
</html>