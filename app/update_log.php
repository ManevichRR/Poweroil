<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 0);
	$host="localhost";
	$username = "wwwbytes_powerm";
	$password = "Asdf1234!";
	$database = "wwwbytes_poweroil";
	$con=mysqli_connect($host,$username,$password, $database);
	$sql="update transaction_log set `tran_status`='".mysqli_real_escape_string($con, $_GET['status'])."' where `basket_id`='".mysqli_real_escape_string($con, $_GET['basket_id'])."'";
    echo($sql);
    $res= mysqli_query($con, $sql) or die('error fetching basket '.mysqli_error());
    if($res){
       echo $_GET['callback'].'Updated';
   }
?>
