<?php
include('session.php');
// define variables and set to empty values
$e_nameErr = $e_add_Err = $contact_Err = $email_Err = $uname_Err=$pass_Err=$tra_Err=$nicErr=$nicErr=$acc_no_Err=$dep_Err="";
$RID=$_REQUEST['RID'];
$success_msg = $error_msg = "";
$get="";

//search value
$query = "SELECT * from customer where nic = '$RID'";
    $result = mysqli_query($connection,$query);
    while($row=mysqli_fetch_assoc($result))
    {
        $e_name=$row['name'];
        $add=$row['address'];
        $contact=$row['contact'];
        $email=$row['email'];
        $uname=$row['uname'];
        $tran=$row['transactionpin'];
        $pass=$row['password'];
        $nic=$row['nic'];
}



if ($_SERVER["REQUEST_METHOD"] == "POST") {

    //////customer details validation
    // nic validation
    if (empty($_POST["nic"])) {
      $nicErr = "NIC is required";
    } else {
      $nic = test_input($_POST["nic"]);
    }

//name validation
if (empty($_POST["cus_name"])) {
    $e_nameErr = "Customer Name is required";
  } else {
    $e_name = test_input($_POST["cus_name"]);
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

  // contact validation
  if (empty($_POST["tran"])) {
    $tra_Err = "Tranaction pin is required";
  } else {
    $tran= test_input($_POST["tran"]);
    // check if name only Numbers
    if (preg_match ("/[^0-9]/", $tran)) {
      $tra_Err = "Only Numbers allowed";
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



if (empty($e_nameErr) && empty($contact_Err) && empty($e_add_Err) && empty($email_Err)  && empty($uname_Err)  && empty($pass_Err)){

      // Check connection
  if($connection === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
  }

  // Escape user inputs for security
  $add_nic= mysqli_real_escape_string($connection, $nic);
  $add_e_name = mysqli_real_escape_string($connection, $e_name);
  $add_address = mysqli_real_escape_string($connection, $add);
  $add_contact_no = mysqli_real_escape_string($connection, $contact);
  $add_email = mysqli_real_escape_string($connection, $email);
  $add_tra= mysqli_real_escape_string($connection, $tran);
  $add_uname = mysqli_real_escape_string($connection, $uname);
  $add_pass = mysqli_real_escape_string($connection, $pass);


  // Attempt update
  $sqlacc = "UPDATE `customer` SET `name`='$add_e_name',`contact`='$add_contact_no',`address`='$add_address',`email`='$add_email',`transactionpin`='$add_tra',`uname`='$add_uname',`password`='$add_pass' WHERE `nic`='$add_nic'";
  
  if (mysqli_query($connection, $sqlacc)) {
 
 header('location:customer.php?edit');
 
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
                    <h3 style="margin-bottom: 20px;">Customers profile</h3>
                    <hr>
                    <!-- Form start -->

            <div class="row" style="padding-left: 2%;padding-right: 2%;">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
    <li><a data-toggle="tab" href="#menu1">Edit customer</a></li>
    <li><a data-toggle="tab" href="#menu2">Accounts</a></li>
    <li><a data-toggle="tab" href="#menu3">Loans</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Edit customer</h3>
      <hr>
      <div class="row">
        <div class="col-sm-3">
        <span class="fas fa-user-circle" style="font-size:220px;color:grey; margin:auto;"></span>
         </div>
        <div class="col-sm-9">
        <table class="table" style="margin-top:30px;">
  <thead>
  </thead>
  <tbody>
    <tr>
      <td>Name</td>
      <td>:</td>
      <td><?php echo $e_name;?></td>
    </tr>
    <tr>
    <td>NIC</td>
      <td>:</td>
      <td><?php echo $nic;?></td>
    </tr>
    <tr>
    <td>Adress</td>
      <td>:</td>
      <td><?php echo $add;?></td>
    </tr>
    <tr>
    <td>Email</td>
      <td>:</td>
      <td><?php echo $email;?></td>
    </tr>
    <tr>
    <td>Contact No</td>
      <td>:</td>
      <td><?php echo $contact;?></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
</tr>
  </tbody>
</table>
        </div>
        </div>
    </div>


    <div id="menu1" class="tab-pane fade">
      <h3>Edit customer</h3>
      <form id="edit_form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

<div class="row" style="margin-top:10px;">
<div class="col-lg-8">
   <label for="Emploee Name" >NIC:</label>
   <span class="error-msg" style="color: red;">* <?php echo $nicErr;?></span>                     
   <input type="text" class="form-control H_ser" id="username_1"  name="nic" value="<?php echo $nic;?>" placeholder="NIC number" readonly>
 </div>
 </div>

<div class="row">
<div class="col-lg-6">
   <label for="Emploee Name" >Customer Name:</label>
   <span class="error-msg" style="color: red;">* <?php echo $e_nameErr;?></span>                     
   <input type="text" class="form-control"  name="cus_name" value="<?php echo $e_name;?>" placeholder="Customer Name" id="c_name_1" readonly>
 </div>
 <div class="col-lg-6">
 <label for="Contact_no">Contact no:</label>
   <span class="error-msg" style="color: red;">* <?php echo $contact_Err;?></span>
   <input type="text" class="form-control" id="contact_1"  name="contact_no" value="<?php echo $contact;?>" placeholder="contact no" >
 </div>
</div>

 <div class="row">
 <div class="col-lg-12">
   <label for="Adress">Adress:</label>
   <span class="error-msg" style="color: red;">* <?php echo $e_add_Err;?></span>
   <textarea name="add" class="form-control"  placeholder="Adress" id="address_1"><?php echo $add;?></textarea>
 </div>
 </div>

 <div class="row">
 <div class="col-lg-9">
   <label for="email">Email:</label>
   <span class="error-msg" style="color: red;"> <?php echo $email_Err;?></span>                     
   <input type="text" class="form-control" name="email" value="<?php echo $email;?>" placeholder="Email" id="email_1">
 </div>
 <div class="col-lg-3">
 <label for="password">Transaction pin:</label>
   <span class="error-msg" style="color: red;">* <?php echo $tra_Err;?></span>                     
   <input type="text" class="form-control" name="tran" value="<?php echo $tran;?>" placeholder="Transaction pin" id="transactionpin_1">
 
   </div>
 </div>

 <div class="row">
 <div class="col-lg-6">
 <label for="uname">user name:</label>
   <span class="error-msg" style="color: red;">* <?php echo $uname_Err;?></span>                     
   <input type="text" class="form-control" name="uname"  value="<?php echo $uname;?>" placeholder="User name" id="uname_1">

 </div>

 <div class="col-lg-6">
 <label for="password">password:</label>
   <span class="error-msg" style="color: red;">* <?php echo $pass_Err;?></span>                     
   <input type="text" class="form-control" name="pass" value="<?php echo $pass;?>" placeholder="Password" id="password_1">
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
    <div id="menu2" class="tab-pane fade">
      <h3>Accounts</h3>
      <hr>
      <div class="row">
        <div class="col-lg-10">
        <table class="table  table-bordered" style="margin-top:10px;" style="width:100%;" align="center">
            <thead>
            <th>Account opening date</th>
            <th>Account type</th>
            <th>Account number</th>
            <th>Balance</th>
            <th>Action</th>
            </thead>
            <tbody>
            <?php 
               $sql2 = "SELECT * from account where nic='$RID'";
              $result2 = $connection->query($sql2);

              if ($result2->num_rows > 0) {
                // output data of each row
                while($row2 = $result2->fetch_assoc()) {

          ?>
              <tr>
                <td><?php echo $row2["opening_date"] ?></td>
                <td><?php echo $row2["type"] ?></td>
                <td><?php echo $row2["acc_no"] ?></td>
                <td><?php echo $row2["balance"] ?></td>
                <td><a href="view_transaction.php?RID=<?php echo $row2["acc_no"] ?>"><span class="fas fa-low-vision"> View transactions</span></a></td>
              </tr>
              <?php $get=$row2["acc_no"];;}} ?>
              </tbody>
            </table>
        </div>
        </div>
      </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Loans</h3>
      <hr>
      <div class="row">
        <div class="col-lg-10">
        <?php 
         if ($get==''){
          ?>
          <h5>No data found</h5>
          <?php }else{?>
        <table class="table  table-bordered" style="margin-top:10px;" style="width:100%;" align="center">
            <thead>
            <th>Account_number</th>
                <th>loan type</th>
                <th>loan amount</th>
                <th>Due amount</th>
                <th>maturity</th>
                <th>requesting date</th>
                <th>Action</th>
            </thead>
            <tbody>
            <?php 
           
            
               $sql3 = "SELECT * from loan  where status='Approved' AND account_number=$get;";
              $result3 = $connection->query($sql3);

              if ($result3->num_rows > 0) {
                // output data of each row
                while($row3 = $result3->fetch_assoc()) {

          ?>
              <tr>
              <td><?php echo $row3["account_number"] ?></td>
            <td><?php echo $row3["loan_type"] ?></td>
            <td><?php echo $row3["lan_amount"] ?></td>
            <td><?php echo $row3["due_amount"] ?></td>
            <td><?php echo $row3["maturity"] ?></td>
            <td><?php echo $row3["requesting_date"] ?></td>
            <td align="center"><a href="loan_summary.php?RID=<?php echo $row3['lid'];?>" style="text-decoration: none;"><span class="fas fa-low-vision"></span> </a> </td>
          </tr>
              <?php }}?>
                <tr>
              <tr>
              </tbody>
            </table>
            <?php 
            } 
            ?>
        </div>
        </div>
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