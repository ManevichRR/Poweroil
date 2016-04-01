<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	$host="localhost";
	$username = "wwwbytes_powerm";
	$password = "Asdf1234!";
	$database = "wwwbytes_poweroil";
	$con=mysqli_connect($host,$username,$password, $database);
	$each=array('fullname'=>'', 'email'=>'', 'phone'=>'', 'order'=>array());
	$all=array();
	$new_order=true;
	function neworderbasket($con, $info){
		$each=array('fullname'=>'', 'email'=>'', 'phone'=>'', 'order'=>array());
		$sql2="Select * from user_data where facebook_id='".$info[8]."'";
		$res2= mysqli_query($con, $sql2)or die('error fetching user_data '.mysqli_error());;
		$info2= mysqli_fetch_array($res2);
		$each['email']=$info2[2];
		array_push($each['order'], $info);
		return $each;

	}
	$sql="select * FROM order_basket";
	$res= mysqli_query($con, $sql) or die('error fetching basket '.mysqli_error());


	while($info=mysqli_fetch_array($res)){
		if($new_order==true){
			//echo $info[2];
			$each=neworderbasket($con, $info);
			$new_order=false;
		}
		else{
			$total_order=count($each['order']);
			$previousBorder=$each['order'][$total_order-1][2];
		
			if($previousBorder==$info[2]){
				array_push($each['order'], $info);
				$new_order=false;
			}
			else{
				array_push($all, $each);
				$new_order=true;
				neworderbasket($con, $info);
			}
		}
	}

	print_r ($all);
	//echo $_GET['callback'].json_encode($all);
?>
