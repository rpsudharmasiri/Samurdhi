 <?php 
include('session.php');
//Request Value
$RID=$_REQUEST['RID'];	
//Query
$sql="DELETE FROM `branch` WHERE bid='$RID'"; 

if ($connection->query($sql) === TRUE) {
    header('location:branch.php?Deleted');
} else {
    echo "Error deleting record: " . $conn->error;
}

?>