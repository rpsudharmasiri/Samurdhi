<?php 
include('session.php');
//Request Value
$RID=$_REQUEST['RID'];	
//Query
$sql="DELETE FROM `customer` WHERE nic='$RID'"; 

if ($connection->query($sql) === TRUE) {
    header('location:customer.php?Deleted');
} else {
    echo "Error deleting record: " . $connection->error;
}

?>