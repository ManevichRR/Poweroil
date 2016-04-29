<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 0);
	$host="localhost";
    $username = "funqui_marketpla";
    $password = "Asdf1234!";
    $database = "funqui_poweroilmarketplace";
	$con=mysqli_connect($host,$username,$password, $database);
	$eachorder=array('fullname'=>'', 'email'=>'', 'phone'=>'', 'order'=>array(), 'coupons'=>array());
	$all=array();
	$new_order=true;
	function neworderbasket($con, $info){
		$each=array('name'=>'', 'email'=>'', 'phone'=>'', 'total_amount'=>0, 'order'=>array(), 'coupons'=>array(), 'totalcoupons'=>0, 'unusedcoupon'=>0);
		$sql2="Select * from `user_data` where `facebook_id`='".$info[8]."'";
		$res2= mysqli_query($con, $sql2)or die('error fetching user_data '.mysqli_error());
		while($info2= mysqli_fetch_assoc($res2)){

			$each['email']=$info2['email'];
			$each['phone']=$info2['phone'];
			$each['name']=$info2['Fullname'];

			//get all coupons for user
			//get order status
			array_push($each['order'], $info);
			$sql3="select * from `transaction_log` where `basket_id`='".$info[2]."'";
			$res3=mysqli_query($con, $sql3) or die('error fetching transaction log '.mysqli_error($con));
			while ($info3= mysqli_fetch_assoc($res3)) {
				$each['phone']=$info3['phone'];
				$each['status']=$info3['tran_status'];
				$each['area']=$info3['area_name'];
				$each['billing']=$info3['billing_address'];
			$sqlc="select * from `coupon` where (user_id='".$info[8]."' AND `generated_trans`='".$info3['trans_id']."') OR (user_id='".$info[8]."' AND `generated_trans`='Welcome Voucher' AND `applied_date`!='')";
			//echo($sqlc);
			$resc=mysqli_query($con, $sqlc)or die('error fetching attached coupon '.mysqli_error($con));
			while($info4=mysqli_fetch_assoc($resc)){
				if($info4['applied_date']!=''){
	                $each['totalcoupons']=$each['totalcoupons']+$info4['coupon_amount'];
					array_push($each['coupons'], $info4);
				}
	            else{
	                $each['unusedcoupon']=$each['unusedcoupon']+$info4['coupon_amount'];
	            }
			}
		}
		}
		return $each;
	}
	$sql="select * FROM order_basket order by basket_id desc";
	$res= mysqli_query($con, $sql) or die('error fetching basket '.mysqli_error());
	while($info=mysqli_fetch_array($res)){
		if($new_order==true){
			$eachorder=neworderbasket($con, $info);
			$new_order=false;
		}
		else{
			$total_order=count($eachorder['order']);
			$previousBorder=$eachorder['order'][$total_order-1][2];
			if($previousBorder==$info[2]){
				array_push($eachorder['order'], $info);
				$new_order=false;
			}
			else{
				array_push($all, $eachorder);
				//$new_order=true;
				$eachorder=neworderbasket($con, $info);
			}
		}
	}
	echo $_GET['callback'].json_encode($all);
?>
