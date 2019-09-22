 <?php 
include('session.php');
//Request Value
$RID=$_REQUEST['RID'];	
//Query
$sql="DELETE FROM `employee` WHERE eid='$RID'"; 

if ($connection->query($sql) === TRUE) {
    header('location:employee.php?Deleted');
} else {
    echo "Error deleting record: " . $conn->error;
}

?>