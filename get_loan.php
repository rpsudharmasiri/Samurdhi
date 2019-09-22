<?php
    $host = "localhost"; /* Host name */
    $user = "root"; /* User */
    $password = ""; /* Password */
    $dbname = "samurdhi"; /* Database name */

    $con = mysqli_connect($host, $user, $password,$dbname);
    // Check connection
    if (!$con) {
     die("Connection failed: " . mysqli_connect_error());
    }

$request = $_POST['request'];   // request

// Get username list
if($request == 1){
    $search = $_POST['search'];

    $query = "SELECT * FROM account WHERE acc_no like'%".$search."%'";
    $result = mysqli_query($con,$query);
    
    while($row = mysqli_fetch_array($result) ){
        $response[] = array("value"=>$row['acc_no'],"label"=>$row['acc_no']);
    }

    // encoding array to json format
    echo json_encode($response);
    exit;
}

// only fill other texr boxes
if($request == 2){
    $userid = $_POST['userid'];
    $sql = "SELECT * FROM account acc,customer cus WHERE acc.nic=cus.nic AND acc_no=".$userid;

    $result = mysqli_query($con,$sql);

    $users_arr = array();

    while( $row = mysqli_fetch_array($result) ){
        $userid = $row['acc_no'];
        $nic = $row['nic'];
        $name = $row['name'];
        $contact = $row['contact'];
        $address = $row['address'];
        $email = $row['email'];
        

        $users_arr[] = array("acc_no" => $userid, "nic" => $nic,"name" => $name,"contact" => $contact,"address" => $address,"email" => $email);
    }

    // encoding array to json format
    echo json_encode($users_arr);
    
    exit;
}
