<?php
include('login_try.php'); 
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<link rel="stylesheet" href="css/Login.css" type="text/css" />
</head>
<body>
<div id="main">
	<img src="img/logo2.png" width="80px" height="80px" style="margin-left: 110px; margin-bottom: 10px;">
<form name="login" method="post">

<h2 style="margin-left:80px;">User Login</h2>
</br>
<span style="color: red;"><?php echo $error; ?></span></br>
<div id="Input_Contain">
    <input type="text" name="username" placeholder="Enter Username" id="txt"  >
</div>
<div id="Input_Contain">
    <input type="password" placeholder="Enter Password" name="password" id="txt">
</div>
<div id="Input_Contain">
    <input type="radio" value="manager" name="type" checked="checked" style="margin-left: 40px"> Manager
    <input type="radio" value="employee" name="type" style="margin-left: 50px;"> Employee

    
</div>

<div id="Input_Contain" style="margin-top: 20px;">
    <input type="submit"  name="submit" value="Login" id="btn" >
</div>
</div>
</form>
<h5 id="Alright" style="margin-top: 80px;">Copyright © 2019 Samurdhi bank. All Rights Reserved</h5>
</body>
</html>