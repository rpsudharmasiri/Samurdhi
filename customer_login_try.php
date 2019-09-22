<?php
session_start(); // Starting Session
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {

// Define $username and $password
$username=$_POST['username'];
$password=$_POST['password'];
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
$connection = mysqli_connect("localhost", "root", "");
// To protect MySQL injection for Security purpose
$username = stripslashes($username);
$password = stripslashes($password);
$username = mysqli_real_escape_string($connection, $username);
$password = mysqli_real_escape_string($connection, $password);
// Selecting Database
$db = mysqli_select_db($connection, "samurdhi");
// SQL query to fetch information of registerd users and finds user match.

$query = mysqli_query($connection, "SELECT * from customer where password='$password' AND uname='$username'");
$rows = mysqli_num_rows($query);


if ($rows == 1) {
$tracking="INSERT INTO `logintracking`(`user`) VALUES ('$username')";
mysqli_query($connection, $tracking);

while($row=mysqli_fetch_assoc($query))
    {
        $nic=$row['nic'];
    }
    

$_SESSION['login_user']=$username; // Initializing Session
$_SESSION['password']=$password; // Initializing Session
$_SESSION['nic']=$nic; // Initializing Session
header("location:customer_dashboard.php") ;
} else {
$error = "Username or Password is invalid";
}

} 

?>