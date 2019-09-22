<?php
include('session.php');

// define variables and set to empty values
$acc_Err = $amo_Err = $tra_Err =$date_Err= "";
$acc=$amo=$tra=$date="";
$success_msg = $error_msg = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    //////customer details validation

    // Account number validation
    if (empty($_POST["acc_num"])) {
      $acc_Err = "Account number is required";
    } else {
      $acc = test_input($_POST["acc_num"]);
      if (preg_match ("/[^0-9]/", $acc)) {
        $acc_Err = "Only Numbers allowed";
      }
    }

    // Amount validation
    if (empty($_POST["transaction_amo"])) {
      $amo_Err = "Transaction Amount is required";
    } else {
      $amo = test_input($_POST["transaction_amo"]);
      if (preg_match ("/[^0-9]/", $amo)) {
        $amo_Err = "Only Numbers allowed";
      }
    }

   // Account number validation
   if (empty($_POST["tra_acc"])) {
    $tra_Err = "Transaction account is required";
  } else {
    $tra = test_input($_POST["tra_acc"]);
    if (preg_match ("/[^0-9]/", $amo)) {
      $tra_Err = "Only Numbers allowed";
    }
  }

     // date validation
     if (empty($_POST["date"])) {
      $date_Err = "Date is required";
    } else {
      $date = test_input($_POST["date"]);
    }

        // Account type  validation
    if (empty($_POST["tra_type"])) {
          $type_Err = "Type is required";
        } else {
          $type= test_input($_POST["tra_type"]);
     }
     //calculate new balance
     $tota_balance = test_input($_POST["balance"]);
     if($type=="Saving"){
      $new_balance=$tota_balance+$amo;
     }else if($type=="Withdrawing"){
      $new_balance=$tota_balance-$amo;
     }else if($type=="Transfering"){
      $new_balance=$tota_balance-$amo;
     }
     //end of calculation new balance


if (empty($acc_Err) && empty($amo_Err) && empty($type_Err )) {

      // Check connection
  if($connection === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
  }

  // Escape user inputs for security
  $add_acc= mysqli_real_escape_string($connection, $acc);
  $add_amo = mysqli_real_escape_string($connection, $amo);
  $add_tra = mysqli_real_escape_string($connection, $tra);
  $add_date = mysqli_real_escape_string($connection, $date);
  $add_type = mysqli_real_escape_string($connection, $type);

  $add_new_balance = mysqli_real_escape_string($connection, $new_balance);
// Attempt insert query execution
$sql = "INSERT INTO `transaction`( `acc_no`,`date`, `type`, `amount`, `transfer_acc`) VALUES ('$add_acc', '$add_date','$add_type', '$add_amo', '$add_tra')";
$sql2="UPDATE `account` SET `balance`='$add_new_balance' WHERE `acc_no`='$add_acc'";
if (mysqli_query($connection, $sql)&&mysqli_query($connection, $sql2)) {
  header('location:transaction.php?inserted');
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
  <title>Samurdhi bank - New customer</title>
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
                            url: "get_account.php",
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
                            url: 'get_account.php',
                            type: 'post',
                            data: {userid:userid,request:2},
                            dataType: 'json',
                            success:function(response){
                                
                                var len = response.length;

                                if(len > 0){
                                    var acc_no = response[0]['acc_no'];
                                    var nic = response[0]['nic'];
                                    var opening_date = response[0]['opening_date'];
                                    var type = response[0]['type'];
                                    var balance = response[0]['balance'];

                                    document.getElementById('balance_'+index).value = balance;
                                    document.getElementById('nic_'+index).value = nic;
                                    document.getElementById('opening_'+index).value = opening_date;
                                    document.getElementById('type_'+index).value = type;
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
                <a class="btn btn-default" href="system_dashboard.php" style="float:right; margin-left:2px;"><i class="glyphicon glyphicon-home"> Home</i></a>
                    <h3>New Transaction</h3>
                    <hr>
                    <!-- Form start -->

        <div class="row" >


            <div class="col-lg-12" style="background-color: #ffff; padding-top: 40px; padding-bottom: 40px;">

              

                   <form id="add_employee_form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                   <div class="row" style="margin-top:-20px;">
                   <div class="col-lg-4">
                      <label for="Emploee Name" >Account Number:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $acc_Err;?></span>                  
                      <input type="number" class="form-control H_ser" id="username_1"  value="<?php echo $acc;?>" name="acc_num" value="" placeholder="Account number">
                    </div>
                    <div class="col-lg-8">
                    <style>
                    .empty{
                      background-color:transparent;
                      border:none;
                      outline:none;
                    }
                    .empty:focus{
                        outline: none;
                    }
                    </style>
                    <table class="table" style="margin-top:30px;">
                            <thead>
                            </thead>
                            <tbody>
                                <tr>
                                <td>Account Type</td>
                                <td>:</td>
                                <td> <input type="text" class="form-control empty" id="type_1"  name="type"></td>
                                </tr>
                                <tr>
                                <td>NIC</td>
                                <td>:</td>
                                <td><input type="text" class="form-control empty" id="nic_1"  name="nic"></td>
                                </tr>
                                <tr>
                                <td>Account openeing date</td>
                                <td>:</td>
                                <td><input type="text" class="form-control empty" id="opening_1"  name="open">
                                </td>
                                </tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>
                            </tbody>
                            </table>
                    </div>
                    </div>
                    <div class="row">
                   <div class="col-lg-12">
                   <label>Account balance</label>
                   <input type="text" class="form-control " id="balance_1"  name="balance" readonly placeholder="Account balance" required>
                   </div>
                </div>
                <div class="row">
                   <div class="col-lg-12">
                   <label>Transaction date</label>
                   <input type="date" class="form-control " required  name="date" value="<?php echo date('Y-m-d'); ?>">
                   </div>
                </div>


                   <div class="row">
                   <div class="col-lg-12">
                   <label>Transaction Type</label>
                                        <select name="tra_type" id="cmbType" class="form-control">
                                            <option value="Saving" selected>Saving</option>
                                            <option value="Withdrawing">Withdrawing</option>
                                            <option value="Transfering">Transfering</option>
                                        </select>
                    </div>
                </div>
                <script>
                $(document).ready(function(){
                          $('#cmbType').on('change', function() {
                            if ( this.value == 'Transfering')
                            {
                              $("#tra_acc").animate( { "opacity": "show", top:"200"} , 600 );
                            }
                            else
                            {
                              $("#tra_acc").animate( { "opacity": "hide", top:"200"} , 400 );
                            }
                          });
                      });
                </script>
                

                    <div class="row">
                    <div class="col-lg-12">
                      <label for="Adress">Amount:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $amo_Err;?></span>
                      <input type="number" class="form-control" name="transaction_amo" value="<?php echo $amo;?>" placeholder="Amount" id="Amount">
                    </div>
                    </div>

                    <div class="row" style="display:none;" id="tra_acc">
                    <div class="col-lg-12">
                      <label for="Adress">Transfering Account no:</label>
                      <span class="error-msg" style="color: red;">* <?php echo $tra_Err;?></span>
                      <input type="number" class="form-control" name="tra_acc" value="<?php echo $tra;?>" placeholder="Transfer account number" >
                    </div>
                    </div>
                    
                    <div class="row">
                    <div class="col-lg-6">
                    <button type="submit" class="btn btn-info">Submit</button>
                    <button class="btn btn-danger"><a shref="add_employee.php" style="color: #fff; text-decoration: none;">Reset</a></button>
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