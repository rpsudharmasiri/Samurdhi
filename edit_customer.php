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

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Samurdhi bank - Edit customer</title>
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

  <link href='js/jquery-ui.min.css' type='text/css' rel='stylesheet' >
    <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

 

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

<script type="text/javascript">
    
      //get vendor phone no. by typing vendor name
        $(document).ready(function(){

            $(document).on('keydown', '.H_ser', function() {
                
                var id = this.id;
                var splitid = id.split('_');
                var index = splitid[1];

                $( '#'+id ).autocomplete({
                    source: function( request, response ) {
                        $.ajax({
                            url: "get_customer.php",
                            type: 'post',
                            dataType: "json",
                            data: {
                                search: request.term,request:1
                            },
                            success: function( data ) {
                                response( data );
                            }
                        });
                    },
                    select: function (event, ui) {
                        $(this).val(ui.item.label); // display the selected text
                        var userid = ui.item.value; // selected id to input

                        // AJAX
                        $.ajax({
                            url: 'get_customer.php',
                            type: 'post',
                            data: {userid:userid,request:2},
                            dataType: 'json',
                            success:function(response){
                                
                                var len = response.length;

                                if(len > 0){
                                    var eid = response[0]['eid'];
                                    var contact = response[0]['contact'];
                                    var email = response[0]['email'];
                                    var name = response[0]['name'];
                                    var address = response[0]['address'];
                                    var transactionpin = response[0]['transactionpin'];
                                    var uname = response[0]['uname'];
                                    var password = response[0]['password'];

                                    document.getElementById('contact_'+index).value = contact;
                                    document.getElementById('email_'+index).value = email;
                                    document.getElementById('c_name_'+index).value = name;
                                    document.getElementById('address_'+index).value = address;
                                    document.getElementById('transactionpin_'+index).value = transactionpin;
                                    document.getElementById('uname_'+index).value = uname;
                                    document.getElementById('password_'+index).value = password;
                                }                               
                            }
                        });

                        return false;
                    }
                });
            });
          });
      //   // END


$.ajax("submit.php")
  .done(function(data) {
      //Ajax request was successful.
  })
  .fail(function(xhr, status, error) {
      //Ajax request failed.
      var errorMessage = xhr.status + ': ' + xhr.statusText
      
})
        
      
    </script>
<!-- Content start -->
    <div class="col-sm-10">
    <div id="page-wrapper" >
        <div class="container-fluid"><!-- Page Heading -->
            <div class="row" id="main" style="margin: 0;">
                <div class="col-sm-12 col-md-12 well" id="content" style="background-color: #ffff; border: 1px solid #f9f6f6;">
                    <h3>Edit customer</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" >


            <div class="col-lg-12" style="background-color: #ffff; padding-top: 40px; padding-bottom: 40px;">

              

                   <form id="edit_form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                   <div class="row" style="margin-top:-20px;">
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
              </div>

            </div>


          </div>

                   
        </div> <!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /content end -->
</div>
</div>
</body>
</html>