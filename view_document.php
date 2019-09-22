<?php
include('session.php');
$RID=$_REQUEST['RID'];

$sql = "SELECT * FROM loan where lid=$RID";

  $result = $connection->query($sql);

  if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $id=$row['lid']; 
?>



    <?php if($row['document1'] != ""): ?>
	<img src="uploads/<?php echo $row['document1']; ?>" width="400px" height="400px" style="border:1px solid #333333;">
    <img src="uploads/<?php echo $row['document2']; ?>" width="400px" height="400px" style="border:1px solid #333333;">
    <img src="uploads/<?php echo $row['document3']; ?>" width="400px" height="400px" style="border:1px solid #333333;">
	<?php else: ?>
	<img src="images/default.png" width="100px" height="100px" style="border:1px solid #333333;">
	<?php endif; ?>
    <?php } }?>