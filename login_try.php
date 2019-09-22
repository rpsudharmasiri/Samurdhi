<?php
session_start(); // Starting Session
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {

//check user type
$login_type=$_POST['type'];


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

if($login_type=='manager'){
$query = mysqli_query($connection, "SELECT * from manager where password='$password' AND username='$username'");
$rows = mysqli_num_rows($query);
if ($rows == 1) {
    $tracking="INSERT INTO `logintracking`(`user`) VALUES ('$username')";
    mysqli_query($connection, $tracking);
$_SESSION['login_user']=$username; // Initializing Session
$_SESSION['login_type']=$login_type;  
header("location:system_dashboard.php") ;
} else {
$error = "Username or Password is invalid";
}

}
elseif($login_type=='employee'){
    $query = mysqli_query($connection, "SELECT * from employee where password='$password' AND username='$username'");
    $rows = mysqli_num_rows($query);
    if ($rows == 1) {
        $tracking="INSERT INTO `logintracking`(`user`) VALUES ('$username')";
        mysqli_query($connection, $tracking);
    $_SESSION['login_user']=$username; // Initializing Session
    $_SESSION['login_type']=$login_type; 
    header("location:system_dashboard.php") ;
    } else {
    $error = "Username or Password is invalid";
    }
    }


} 

?>