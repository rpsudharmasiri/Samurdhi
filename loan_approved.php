<?php   
include('session.php');
$RID=$_REQUEST['RID'];
//search value
$query = "SELECT * FROM loan  WHERE  lid='$RID'";
    $result = mysqli_query($connection,$query);
    while($row=mysqli_fetch_assoc($result))
    {
        $lan_amount=$row['lan_amount'];
        $maturity=$row['maturity'];
        $intrest_rate=$row['intrest_rate'];

        $intrest_per_loan=($lan_amount*$intrest_rate)/100;
        $intrest_per_month=$intrest_per_loan/$maturity;

        $loan_month=$lan_amount/$maturity;
        $total=$loan_month+$intrest_per_month;



}

  // Attempt insert query execution
  $date = date('Y-m-d');
  $approve='Approved';  
 $sql = "UPDATE `loan` SET `status`='$approve',`granted_date`='$date' WHERE `lid`='$RID'";


 for ($x = 1; $x <= $maturity; $x++) {
    $cal=$x .'months';
    $date1 = date("Y-m-d", strtotime(" +$cal"));
    $sql2="INSERT INTO `loan_payment`(`lid`, `payment_date`, `month_payment`,`payment_status`) VALUES ('$RID','$date1','$total','Not paid')";
    mysqli_query($connection, $sql2);
    } 


  if ( mysqli_query($connection, $sql)) {

    header('location:loan_status.php?approved');


  } else {
      echo "Error: " . $sql . "<br>" . mysqli_error($connection);
  }


?>