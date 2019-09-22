<?php
include('session.php');

// define variables and set to empty values
$e_nameErr = $e_add_Err = $contact_Err = $email_Err = $uname_Err=$pass_Err=$tra_Err=$nicErr=$nicErr=$acc_no_Err=$dep_Err="";
$RID=$_REQUEST['RID'];
$success_msg = $error_msg = "";

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