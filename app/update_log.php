<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 0);
	$host="localhost";
	$username = "funqui_marketpla";
    $password = "Asdf1234!";
    $database = "funqui_poweroilmarketplace";
	$con=mysqli_connect($host,$username,$password, $database);
	$userdata=json_decode($_GET['all']);
	print_r($userdata);
	$sql="update transaction_log set `tran_status`='".mysqli_real_escape_string($con, $_GET['status'])."' where `basket_id`='".mysqli_real_escape_string($con, $_GET['basket_id'])."'";
    $res= mysqli_query($con, $sql) or die('error fetching basket '.mysqli_error());
    if($res){
       echo $_GET['callback'].'Updated';
	   $to=$userdata->email;
	   $subject = "Poweroil Transaction Update";
	   //$message="Dear ".$_GET['title']." ".$_GET['fname']." ".$_GET['lname'].",<br><br>";
	   $message= 'Dear '.$userdata->name.', <br> <br>';
	   if( $_GET['status'] == 'En-route' ){
		   $message.= 'We are pleased to inform you that your order is currently En-route, please ensure you are available at the delivery address you supplied.';
	   }
	   else if( $_GET['status'] == 'Delivered' ){
		   $message.= 'Thank you for choosing Poweroil, your order has been delivered.';
	   }
	   else if( $_GET['status'] == 'Delayed' ){
		   $message.= 'We are sorry, your order is currently being delayed. Our team is currently working to deliver it to you swiftly.';
	   }
	//    $message.='<br><br> <h3> Your Order Details</h3>';
	//    $message.='<table><tr style="text-align:left;"><th width="20%"><b>Item Desc</b></th> <th width="15%"><b>Quantity</th><th width="15%"><b>Rate</b></th> <th width="15%"><b>Total</b></th></tr>';
	//    for($i=0; $i<count($userdata->order); $i++){
	// 	   $item=$userdata->order[$i];
	// 	   $message.='<tr><td width="20%">'.$item->item_name.'</td>
	// 	   <td width="15%">'.$item->quantity.'</td>
	// 	   <td width="15%">'.$item->item_rate.'</td>
	// 	   <td width="15%"> &#8358;'.($item->item_rate*$item->quantity).'</td></tr>';
	//    }
	//    $message.='</table>';
	//    $message.='<br><br> <span style="font-size:14px"> Transaction ID :'.$userdata->basketId.'</span>' ;
	//    $message.='<br><br> <span style="font-size:18px"> Grand Total : &#8358;'.$userdata->cartTotal.'</span>';
	//    $message.='<br><br> <h3> Your Delivery Address </h3>';
	//    $message.='<span>'.$userdata->flatnum.', '.$userdata->street.', '.$userdata->bustop.', '.$userdata->area.', Lagos Nigeria</span>';
	//    $message.='<br> <span style="font-size:14px"> Your Phone Number :'.$user_data->phone.'</span>';
	   $message.='<br><br> <span style="font-size:12px; color:#900">For more information please send an email to poweroil.omp@tolaram.com.</span>' ;
	   $headers = "MIME-Version: 1.0" . "\r\n";
	   $headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
	   $headers .= "Bcc:poweroil.omp@tolaram.com\r\n";
	   //$headers .= "Bcc:sholadedokun@gmail.com\r\n";
	   $headers .= "From:Poweroil\r\n";
	   $a = mail($to, $subject, $message, $headers);
   }
?>
