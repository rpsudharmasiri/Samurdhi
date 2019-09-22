<?php
include('session.php');

// define variables and set to empty values
$acc_Err = $amo_Err  = $email_Err = $gua2_acc_Err=$gua_acc_Err=$Intrest_err="";
$acc=$amo=$contact=$email=$uname=$pass=$add=$cus_name=$nic=$intrest="";
$success_msg = $error_msg = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {


  //image insert
    move_uploaded_file($_FILES["image"]["tmp_name"],"uploads/" . $_FILES["image"]["name"]);			
    $location=$_FILES["image"]["name"];

    move_uploaded_file($_FILES["image1"]["tmp_name"],"uploads/" . $_FILES["image1"]["name"]);			
    $location2=$_FILES["image1"]["name"];

    move_uploaded_file($_FILES["image2"]["tmp_name"],"uploads/" . $_FILES["image2"]["name"]);			
    $location3=$_FILES["image2"]["name"];
    //end of image insert
    

    // account  validation
    if (empty($_POST["acc_num"])) {
      $acc_Err = "account number is required";
    } else {
      $acc = test_input($_POST["acc_num"]);
      // check if name only Numbers
      if (preg_match ("/[^0-9]/", $acc)) {
        $acc_Err = "Only Numbers allowed";
      }
    }

        // type  validation
      if (empty($_POST["loantype"])) {
          $loan_type_err = "Loan type is required";
      } else {
          $loan_type = test_input($_POST["loantype"]);
      }
        

      // amount  validation
      if (empty($_POST["loan_amount"])) {
        $amo_Err = "Loan amount is required";
      } else {
        $amo = test_input($_POST["loan_amount"]);
        // check if name only Numbers
        if (preg_match ("/[^0-9]/", $amo)) {
          $amo_Err = "Only Numbers allowed";
        }
      }

       // maturity  validation
       if (empty($_POST["Maturity"])) {
        $Maturity_err = "Maturity is required";
        } else {
        $Maturity = test_input($_POST["Maturity"]);
        }

              // Intrest rate  validation
       if (empty($_POST["Intrest"])) {
        $Intrest_err = "Intrest rate is required";
        } else {
        $intrest = test_input($_POST["Intrest"]);
        }

       // guaranter account  validation
      if (empty($_POST["account_number_guranter1"])) {
        $gua_acc_Err = "guaranter account is required";
      } else {
        $gua_acc = test_input($_POST["account_number_guranter1"]);
        // check if name only Numbers
     
      }

      // guaranter account  validation
      if (empty($_POST["account_number_guranter2"])) {
        $gua2_acc_Err = "guranter account is required";
      } else {
        $gua2_acc = test_input($_POST["account_number_guranter2"]);
        // check if name only Numbers
 
      }
      

if (empty($acc_Err) && empty($amo_Err) && empty($gua_acc_Err) && empty($gua2_acc_Err)) {

        // Check connection
    if($connection === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }
      // Escape user inputs for security
  $add_acc= mysqli_real_escape_string($connection, $acc);
  $add_loan_type = mysqli_real_escape_string($connection, $loan_type);
  $add_amo= mysqli_real_escape_string($connection, $amo);
  $add_intrest= mysqli_real_escape_string($connection,$intrest);
  $add_Maturity= mysqli_real_escape_string($connection, $Maturity);
  $add_gua_acc= mysqli_real_escape_string($connection, $gua_acc);
  $add_gua2_acc= mysqli_real_escape_string($connection, $gua2_acc);
  $date=date('Y/m/d');
  $pending="pending";

  $sql = "INSERT INTO `loan`( `account_number`,`loan_type`,`lan_amount`,`due_amount`,`intrest_rate`,`maturity`,`requesting_date`,`guranter1_nic`,`guranter2_nic`,`document1`,`document2`,`document3`,`status`) VALUES ('$add_acc','$add_loan_type','$add_amo','$add_amo','$add_intrest','$add_Maturity','$date','$add_gua_acc','$add_gua2_acc','$location','$location2','$location3','$pending')";

  if (mysqli_query($connection, $sql)) {

    echo "<script>alert('Successfully Added!!!');'</script>";
}

  }else{
    echo "<script>alert(' check!!!');'</script>";
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
  <title>Samurdhi bank - New Loan request</title>
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
    
           //get vendor customer
  $(document).ready(function(){

$(document).on('keydown', '.H_ser', function() {
    
    var id = this.id;
    var splitid = id.split('_');
    var index = splitid[1];

    $( '#'+id ).autocomplete({
        source: function( request, response ) {
            $.ajax({
                url: "get_loan.php",
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
                            url: 'get_loan.php',
                            type: 'post',
                            data: {userid:userid,request:2},
                            dataType: 'json',
                            success:function(response){
                                
                                var len = response.length;

                                if(len > 0){
                                    var acc_no = response[0]['acc_no'];
                                    var nic = response[0]['nic'];
                                    var name = response[0]['name'];
                                    var contact = response[0]['contact'];
                                    var address = response[0]['address'];
                                    var email = response[0]['email'];

                                    document.getElementById('balance_'+index).value = nic;
                                    document.getElementById('balances_'+index).value = name;
                                    document.getElementById('balancess_'+index).value = contact;
                                    document.getElementById('balancesss_'+index).value = address;
                                    document.getElementById('balancessss_'+index).value = email;
                            
                                    
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



    <script type="text/javascript">
    
           //get vendor customer
  $(document).ready(function(){

$(document).on('keydown', '.H_ser', function() {
    
    var id = this.id;
    var splitid = id.split('_');
    var index = splitid[1];

    $( '#'+id ).autocomplete({
        source: function( request, response ) {
            $.ajax({
                url: "get_loan.php",
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
                            url: 'get_loan.php',
                            type: 'post',
                            data: {userid:userid,request:2},
                            dataType: 'json',
                            success:function(response){
                                
                                var len = response.length;

                                if(len > 0){
                                    var acc_no = response[0]['acc_no'];
                                    var nic = response[0]['nic'];
                                    var name = response[0]['name'];
                                    var contact = response[0]['contact'];
                                    var address = response[0]['address'];
                                    var email = response[0]['email'];

                                    document.getElementById('balance_'+index).value = nic;
                                    document.getElementById('balances_'+index).value = name;
                                    document.getElementById('balancess_'+index).value = contact;
                                    document.getElementById('balancesss_'+index).value = address;
                                    document.getElementById('balancessss_'+index).value = email;
                            
                                    
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



<script type="text/javascript">
    
    //get guranter 1
      $(document).ready(function(){

          $(document).on('keydown', '.H_ser1', function() {
              
              var id = this.id;
              var splitid = id.split('_');
              var index = splitid[1];

              $( '#'+id ).autocomplete({
                  source: function( request, response ) {
                      $.ajax({
                          url: "get_guranter1.php",
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
                          url: 'get_guranter1.php',
                          type: 'post',
                          data: {userid:userid,request:2},
                          dataType: 'json',
                          success:function(response){
                              
                              var len = response.length;

                              if(len > 0){
                                  var eid = response[0]['eid'];
                                  var contact = response[0]['contact'];
                                  var name = response[0]['name'];

                                  document.getElementById('contact_'+index).value = contact;
                                  document.getElementById('c_name_'+index).value = name;
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

<script type="text/javascript">
    
    //get guranter 1
      $(document).ready(function(){

          $(document).on('keydown', '.H_ser2', function() {
              
              var id = this.id;
              var splitid = id.split('_');
              var index = splitid[1];

              $( '#'+id ).autocomplete({
                  source: function( request, response ) {
                      $.ajax({
                          url: "get_guranter1.php",
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
                          url: 'get_guranter1.php',
                          type: 'post',
                          data: {userid:userid,request:2},
                          dataType: 'json',
                          success:function(response){
                              
                              var len = response.length;

                              if(len > 0){
                                  var eid = response[0]['eid'];
                                  var contact = response[0]['contact'];
                                  var name = response[0]['name'];

                                  document.getElementById('contactgua_'+index).value = contact;
                                  document.getElementById('c_namegua_'+index).value = name;
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
                    <h3>Loan request</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" >
            <div class="col-lg-12" style="background-color: #ffff; padding-top: 40px; padding-bottom: 40px;">
                   <form id="loan_request_form" method="POST" action="" enctype="multipart/form-data" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                   <div class="row" style="margin-top:-20px;">
                   <div class="col-lg-8">
                   <label for="Emploee Name" >Account Number:</label>
                      <span class="error-msg" style="color: red;">*<?php echo $acc_Err;?></span> </span>                  
                      <input type="number" class="form-control H_ser" id="username_1"  name="acc_num" value="<?php echo $acc;?>" placeholder="Account number">
                     </div>
                    <div class="col-lg-4"> 
                    <label for="Emploee Name" >NIC:</label>
                      <span class="error-msg" style="color: red;">* </span>                     
                      <input type="text" class="form-control H_ser" id="balance_1"  name="nic" value="<?php echo $nic;?>" placeholder="NIC number">
                    </div>
                    </div>

                   <div class="row">
                   <div class="col-lg-6">
                      <label for="Emploee Name" >Customer Name:</label>
                      <span class="error-msg" style="color: red;">* </span>                     
                      <input type="text" class="form-control"  name="cus_name" value="<?php echo $cus_name;?>" placeholder="Customer Name" id="balances_1" readonly>
                    </div>
                    <div class="col-lg-6">
                    <label for="Contact_no">Contact no:</label>
                      <span class="error-msg" style="color: red;">* </span>
                      <input type="text" class="form-control" id="balancess_1"  name="contact_no" value="<?php echo $contact;?>" placeholder="contact no" readonly>
                    </div>
                </div>

                    <div class="row">
                    <div class="col-lg-12">
                      <label for="Adress">Adress:</label>
                      <span class="error-msg" style="color: red;">* </span>
                      <textarea name="add" class="form-control"  placeholder="Adress" id="balancesss_1" readonly><?php echo $add;?></textarea>
                    </div>
                    </div>

                    <div class="row">
                    <div class="col-lg-9">
                      <label for="email">Email:</label>
                      <span class="error-msg" style="color: red;"></span>                     
                      <input type="text" class="form-control" name="email" value="<?php echo $email;?>" placeholder="Email" id="balancessss_1" readonly>
                    </div>
                    </div>

                    

                    <h4 style="margin-top:20px;">Loan details</h4>
                    <hr>
                    <div class="form-group row">
                                    <div class="col-md-12">
                                        <label>Loan Type</label>
                                        <select name="loantype" id="cmbType" class="form-control">
                                            <option value="Self employeement" selected>Self employeement</option>
                                            <option value="Cultivation">Cultivation</option>
                                            <option value="Fhisheries">Fhisheries</option>
                                            <option value="Isuru">Isuru</option>
                                            <option value="Home">Home</option>
                                        </select>
                                    </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-6">
                    <label for="password">Loan amount:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $amo_Err;?></span>                     
                      <input type="text" class="form-control" name="loan_amount" value="<?php echo $amo;?>" placeholder="Loan amount" id="amount">
                    </div>

                    <div class="col-lg-6">
                    <label for="password">Maturity:</label>
                                        <select name="Maturity" id="cmbType" class="form-control">
                                            <option value="12" selected>12 month</option>
                                            <option value="24">24 month</option>
                                            <option value="36">36 month</option>
                                        </select>
                            </div>
                    </div>
                   
                    <div class="row">
                    <div class="col-lg-8">
                    <label for="password">Requesting date:</label>
                      <span class="error-msg" style="color: red;">*</span>                     
                      <input type="date" class="form-control" placeholder="request_date" value="<?php echo date('Y-m-d'); ?>">
                    </div>
                    <div class="col-lg-4">
                    <label for="password">Intrest rate(%):</label>
                      <span class="error-msg" style="color: red;">*<?php echo $Intrest_err; ?></span>                     
                      <input type="text" class="form-control" name="Intrest" value="<?php echo $intrest;?>" placeholder="Intrest rate" id="intrest">
                    </div>
                    </div>
                    <h4 style="margin-top:20px;">Document details</h4>
                    <hr>
                    <table class="table" style="margin-top:30px;">
                            <thead>
                            </thead>
                            <tbody>
                                <tr>
                                <td>Document 1</td>
                                <td>:</td>
                                <td><input type="file" name="image" id="image" /></td>
                                </tr>
                                <tr>
                                <td>Document 2</td>
                                <td>:</td>
                                <td><input type="file" name="image1" id="image1" /></td>
                                </tr>
                                <tr>
                                <td>Document 3</td>
                                <td>:</td>
                                <td><input type="file" name="image2" id="image2" /></td>
                                </tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>
                            </tbody>
                            </table>

                    <h4 style="margin-top:20px;">Guranter details</h4>
                    <hr>
                    <div class="row">
                    <div class="col-lg-6">
                    <strong>Guranter 1,</strong><br><br>
                    <label for="password">NIC:</label>
                      <span class="error-msg" style="color: red;">*<?php echo $gua_acc_Err;?></span>                     
                      <input type="text" class="form-control H_ser1" id="usernames_1" name="account_number_guranter1" value="<?php $gua_acc ?>" placeholder="NIC number">

     
                      <label for="password">Name:</label>
                      <span class="error-msg" style="color: red;">*</span>                     
                      <input type="text" class="form-control" name="name_guranter1"  placeholder="Guranter name" readonly id="c_name_1">

                      <label for="password">Contact no:</label>
                      <span class="error-msg" style="color: red;">*</span>                     
                      <input type="text" class="form-control" name="contact_guranter1"  placeholder="Contact no" readonly id="contact_1">
                    </div>

                    <div class="col-lg-6">
                    <strong>Guranter 2,</strong><br><br>
                    <label for="password">NIC:</label>
                      <span class="error-msg" style="color: red;">*<?php echo $gua2_acc_Err;?></span>       
                      <?php $gua2_acc ?><?php $gua2_acc ?>   
                      <input type="text" class="form-control H_ser2" id="usernamess_1" name="account_number_guranter2" value="<?php $gua2_acc ?>" placeholder="NIC number">

                      
                      <label for="password">Name:</label>
                      <span class="error-msg" style="color: red;">*</span>                     
                      <input type="text" class="form-control" name="name_guranter2"  placeholder="Guranter name" readonly id="c_namegua_1">

                      <label for="password">Contact no:</label>
                      <span class="error-msg" style="color: red;">*</span>                     
                      <input type="text" class="form-control" name="contact_guranter2"  placeholder="Contact no" readonly id="contactgua_1">
                    </div>

                    </div>
                    <div class="row">
                    <div class="col-lg-6">
                    <button type="submit"  class="btn btn-info">submit</button>
                    <button class="btn btn-danger"><a href="loan_request.php" style="color: #fff; text-decoration: none;">Reset</a></button>
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