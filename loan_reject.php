<?php   
include('session.php');
$RID=$_REQUEST['RID'];
$reject="rejected";
$sql = "UPDATE `loan` SET `status`='$reject' WHERE `lid`='$RID'";
if(mysqli_query($connection, $sql)){

   header('location:loan_status.php?Rejected');

}

?>