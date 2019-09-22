<?php
include('session.php');

// define variables and set to empty values
$e_nameErr = $e_add_Err = $contact_Err = $email_Err = $uname_Err=$pass_Err="";

$e_name=$add=$contact=$email=$uname=$pass="";

$success_msg = $error_msg = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

//name validation
if (empty($_POST["emp_name"])) {
    $e_nameErr = "employee Name is required";
  } else {
    $e_name = test_input($_POST["emp_name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$e_name)) {
      $e_nameErr = "Only letters and white space allowed";
    }
  }

// Adress validation
if (empty($_POST["add"])) {
    $e_add_Err = "adress is required";
  } else {
    $add= test_input($_POST["add"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$add)) {
      $e_add_Err= "Only letters and white space allowed";
    }
  }

// contact validation
    if (empty($_POST["contact_no"])) {
    $contact_Err = "Contact is required";
  } else {
    $contact = test_input($_POST["contact_no"]);
    // check if name only Numbers
    if (preg_match ("/[^0-9]/", $contact)) {
      $contact_Err = "Only Numbers allowed";
    }
  }

// email validation
    if (empty($_POST["email"])) {
      $email_Err = "Email is required";
    } else {
      $email = test_input($_POST["email"]);
      // check if e-mail address is well-formed
      if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $email_Err = "Invalid email format";
      }
  }

  // user name validation
    if (empty($_POST["uname"])) {
    $uname_Err = "user name is required";
  } else {
    $uname = test_input($_POST["uname"]);
  }

    // password  validation
    if (empty($_POST["pass"])) {
    $pass_Err = "password is required";
  } else {
    $pass = test_input($_POST["pass"]);
  }


if (empty($e_nameErr) && empty($contact_Err) && empty($e_add_Err) && empty($email_Err)  && empty($uname_Err)  && empty($pass_Err)) {

      // Check connection
  if($connection === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
  }

  // Escape user inputs for security
  $add_e_name = mysqli_real_escape_string($connection, $e_name);
  $add_address = mysqli_real_escape_string($connection, $add);
  $add_contact_no = mysqli_real_escape_string($connection, $contact);
  $add_email = mysqli_real_escape_string($connection, $email);
  $add_uname = mysqli_real_escape_string($connection, $uname);
  $add_pass = mysqli_real_escape_string($connection, $pass);

  // Attempt insert query execution
  $sql = "INSERT INTO `employee`(`name`, `adress`, `contact`, `email`, `username`, `password`) VALUES ('$add_e_name', '$add_address', '$add_contact_no', '$add_email','$add_uname','$add_pass')";
  
  if (mysqli_query($connection, $sql)) {

header('location:employee.php?inserted');


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
                <div class="col-sm-12 col-md-12 well" id="content" style="background-color: #ffff; border: 1px solid #f9f6f6;">
                <a class="btn btn-default" href="system_dashboard.php" style="float:right; margin-left:2px;"><i class="glyphicon glyphicon-home"> Home</i></a>
                    <h3>New employee</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" >

            <div class="col-lg-12" style="background-color: #ffff; padding-top: 40px; padding-bottom: 40px;">

                  
                  <!-- Submit Message -->

                   <form id="add_employee_form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                   <div class="row" >
                   <div class="col-lg-6">
                      <label for="Emploee Name" >Employee Name:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $e_nameErr;?></span>                     
                      <input type="text" class="form-control"  name="emp_name" value="<?php echo $e_name;?>" placeholder="Employee Name">
                    </div>
                    <div class="col-lg-6">
                    <label for="Contact_no">Contact no:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $contact_Err;?></span>
                      <input type="text" class="form-control vendor_name"  name="contact_no" value="<?php echo $contact;?>" placeholder="Contact no">
                    </div>
                    </div>

                    <div class="row">
                    <div class="col-lg-12">
                      <label for="Adress">Adress:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $e_add_Err;?></span>
                      <textarea name="add" class="form-control" placeholder="Adress"><?php echo $add;?></textarea>
                    </div>
                    </div>

                    <div class="row">
                    <div class="col-lg-6">
                      <label for="email">Email:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $email_Err;?></span>                     
                      <input type="text" class="form-control" name="email" value="<?php echo $email;?>" placeholder="Email">
                    </div>
                    <div class="col-lg-6">
                      <label for="uname">user name:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $uname_Err;?></span>                     
                      <input type="text" class="form-control" name="uname"  value="<?php echo $uname;?>" placeholder="User name">
                    </div>
                    </div>

                    <div class="row">
                    <div class="col-lg-6">
                      <label for="password">password:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $pass_Err;?></span>                     
                      <input type="password" class="form-control" name="pass" value="<?php echo $pass;?>" placeholder="Password">
                    </div>
                    </div>

                    <div class="row">
                    <div class="col-lg-6">
                    <button type="submit" class="btn btn-info">Submit</button>
                    <button class="btn btn-danger"><a href="add_employee.php" style="color: #fff; text-decoration: none;">Reset</a></button>
                    </div>
                    </div>
                  </form>

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