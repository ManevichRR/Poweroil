<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 0);
	$host="localhost";
	$username = "wwwbytes_powerm";
	$password = "Asdf1234!";
	$database = "wwwbytes_poweroil";
	$con=mysqli_connect($host,$username,$password, $database);
	$each=array('fullname'=>'', 'email'=>'', 'phone'=>'', 'order'=>array());
	$all=array();
	$new_order=true;
	function neworderbasket($con, $info){
		$each=array('fullname'=>'', 'email'=>'', 'phone'=>'', 'total_amount'=>0, 'order'=>array());
		$sql2="Select * from user_data where facebook_id='".$info[8]."'";
		$res2= mysqli_query($con, $sql2)or die('error fetching user_data '.mysqli_error());;
		$info2= mysqli_fetch_assoc($res2);
		$each['email']=$info2['email'];
		$each['phone']=$info2['phone'];
		//get order status
		$sql3="select * from `transaction_log` where `basket_id`='".$info[2]."'";
		$res3=mysqli_query($con, $sql3) or die('error fetching transaction log '.mysqli_error($con));
		$info3= mysqli_fetch_assoc($res3);
		$each['phone']=$info3['email'];
		$each['status']=$info3['tran_status'];
		$each['billing']=$info3['billing_address'];
		array_push($each['order'], $info);
		return $each;

	}
	$sql="select * FROM order_basket order by order_id desc";
	$res= mysqli_query($con, $sql) or die('error fetching basket '.mysqli_error());


	while($info=mysqli_fetch_array($res)){
		if($new_order==true){
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


	echo $_GET['callback'].json_encode($all);
?>
