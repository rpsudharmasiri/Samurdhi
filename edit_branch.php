<?php
include('session.php');

// define variables and set to empty values
$b_nameErr = $city_Err = $bid_Err = "";
$RID=$_REQUEST['RID'];
$success_msg = $error_msg = "";

$b_name=$city=$bid="";
//search value
$query = "SELECT * from branch where bid = '$RID'";
    $result = mysqli_query($connection,$query);
    while($row=mysqli_fetch_assoc($result))
    {
      $bid=$row['bid'];
      $b_name=$row['b_name'];
      $city=$row['city'];
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {

//branch id
if (empty($_POST["bid"])) {
    $bid_Err = "Branch ID is required";
  } else {
    $bid = test_input($_POST["bid"]);
  }

//name validation
if (empty($_POST["branch_name"])) {
    $b_nameErr = "Branch Name is required";
  } else {
    $b_name = test_input($_POST["branch_name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$b_name)) {
      $b_nameErr = "Only letters and white space allowed";
    }
  }

// Adress validation
if (empty($_POST["city"])) {
    $city_Err = "City is required";
  } else {
    $city= test_input($_POST["city"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$city)) {
      $city_Err= "Only letters and white space allowed";
    }
  }



if (empty($b_nameErr) && empty($bid_Err) && empty($city_Err)) {

      // Check connection
  if($connection === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
  }

  // Escape user inputs for security
  $add_b_name = mysqli_real_escape_string($connection, $b_name);
  $add_bid = mysqli_real_escape_string($connection, $bid);
  $add_city = mysqli_real_escape_string($connection, $city);

  // Attempt insert query execution
  $sql = "UPDATE `branch` SET `b_name`='$add_b_name',`city`='$add_city' WHERE `bid`='$add_bid'";
  
  if (mysqli_query($connection, $sql)) {

header('location:branch.php?edit');


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
                    <h3>Edit branch</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" >

            <div class="col-lg-12" style="background-color: #fdfdfd; padding-top: 40px; padding-bottom: 40px;">

                  
                  <!-- Submit Message -->

                   <form id="add_employee_form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                   	<div class="row" style="margin-top:-20px;">
                     <div class="col-lg-3">
                      <label for="Emploee Name" >Branch ID:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $bid_Err;?></span>
                      <input type="text" class="form-control"  name="bid" value="<?php echo $bid;?>">
                    </div>
                    <div class="col-lg-9">
                      <label for="Contact_no">city:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $city_Err;?></span>
                      <input type="text" class="form-control vendor_name"  name="city" value="<?php echo $city;?>">
                    </div>
                    </div>
                    <div class="row">
                   <div class="col-lg-12">
                      <label for="Emploee Name" >branch Name:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $b_nameErr;?></span>                     
                      <input type="text" class="form-control"  name="branch_name" value="<?php echo $b_name;?>">
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