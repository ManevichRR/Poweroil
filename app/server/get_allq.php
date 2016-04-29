<?php
header('Access-Control-Allow-Origin: *');
error_reporting(E_ALL);
ini_set('display_errors', 0);
$username = "funqui_marketpla";
$password = "Asdf1234!";
$database = "funqui_poweroilmarketplace";
$con=mysqli_connect($host,$username,$password, $database);
$t=time();
if($_POST['action']=='additem'){
    $sqlu="Insert into item values ( NULL,
    '".$_POST['cat']."',
    '".$_POST['itype']."',
    '".mysqli_real_escape_string($con, $_POST['itext'])."',
    '".$_POST['Nrate']."',
    '".$_POST['discount']."',
    '".mysqli_real_escape_string($con,$_POST['desc'])."',
    '".$_POST['itag']."',
    '".$_POST['profile_pic']."',
    '".$_POST['all_pics']."',
    '".$_POST['icon']."',
    '".$_POST['reward']."',
    '".$t."',
    '".$t."')";
    $rsu=mysqli_query($con, $sqlu) or die ("Error : could not Add new Item" . mysqli_error());
    $item_no = mysqli_insert_id($con);
    echo $_POST['callback'].$item_no;
}
elseif($_POST['action'] =='addtotransactionlog'){
  $t=time();
  $userdata=json_decode($_POST['data']);
  print_r($userdata);
  $sqlu="Select item_id from `order_basket` where `basket_id` ='".$userdata->basketId."'";
  $rs=mysqli_query($con, $sqlu);
  $ts= mysqli_num_rows($rs);
  //
  // if($ts!=count($userdata->cart)){
  //
  // }
  $delivery_add=$userdata->flatnum.' '.$userdata->street.' '.$userdata->bustop.' '.$userdata->area;
  $addedC=0;
  $sql="Insert into `transaction_log` values (NULL, '"
  .mysqli_real_escape_string($con, $userdata->id)."','"
  .mysqli_real_escape_string($con, NULL)."','"
  .mysqli_real_escape_string($con, $userdata->basketId)."','"
  .mysqli_real_escape_string($con, $userdata->cartTotal)."','".$delivery_add."','".$userdata->street."','".$userdata->bustop."','".$userdata->area."','".$userdata->phone."', 'Pending','','".$t."')";
  $rsu=mysqli_query($con, $sql) or die ("Error : could not Add new user" . mysqli_error($con));
  $t_id = mysqli_insert_id($con);
  if($rsu){
      $addedcoupons=false;
      for($i=0; $i < count($userdata->coupons); $i++){
          $coup= $userdata->coupons[$i];
          if($coup->generated_trans=='Reward from your Current Transaction'){
              $addedcoupons=true;
              $sqlc ="Insert into coupon values (NULL, '".$coup->coupon_amount."', '"
              .mysqli_real_escape_string($con, $userdata->id)."','', '".$t_id."','";
              if($coup->applied==true){ $addedC= $addedC+ (int)$coup->coupon_amount; $sqlc.=$t."','".$t."')";        }
              $resc=mysqli_query($con, $sqlc) or die ("Error : could not add first cuopon". mysqli_error($con));
              $c_id=  mysqli_insert_id($con);
             // echo $_POST['callback'].$t_id;
          }
          else{
                $sqlu="Update coupon set `applied_date`='".$t."' where `coupon_id`=$coup->coupon_id";
                $resc=mysqli_query($con, $sqlu) or die ("Error : could not update coupon ". mysqli_error($con));
                $addedC= $addedC+ (int)$coup->coupon_amount;
          }

      }
      if( $addedcoupons==false){
          $sqlc ="Insert into coupon values (NULL, '".$userdata->totalReward."', '"
          .mysqli_real_escape_string($con, $userdata->id)."','', '".$t_id."','','".$t."')";
          $resc=mysqli_query($con, $sqlc) or die ("Error : could not insert coupon". mysqli_error($con));
          $c_id=  mysqli_insert_id($con);
      }

          $to=$userdata->email;
          $subject = "Poweroil Transaction ";
          //$message="Dear ".$_GET['title']." ".$_GET['fname']." ".$_GET['lname'].",<br><br>";
          $message= 'Dear '.$userdata->name.',<br> <br>';
          $message.= 'Thank you for using Poweroil\'s  \'The Marketplace\'. Please, find your transaction details below.';

          $message.='<br><br> <h3> Your Order Details</h3>';
          $message.='<table><tr style="text-align:left;"><th width="20%"><b>Item Desc</b></th> <th width="15%"><b>Quantity</th><th width="15%"><b>Rate</b></th> <th width="15%"><b>Total</b></th></tr>';

          for($i=0; $i<count($userdata->cart); $i++){
              $item=$userdata->cart[$i];
              $message.='<tr><td width="20%">'.$item->item_name.'</td>
              <td width="15%">'.$item->quantity.'</td>
              <td width="15%">'.$item->item_rate.'</td>
              <td width="15%"> &#8358;'.($item->item_rate*$item->quantity).'</td></tr>';
          }
          //echo ($userdata->totalReward);
          $message.='</table>';
          $message.='<br><br> <span style="font-size:14px"> Someone will get in touch with you shortly</span>' ;
          $message.='<br><br> <span style="font-size:14px"> Transaction ID :'.$userdata->basketId.'</span>' ;
          $message.='<br><br> <span style="font-size:14"> Total Reward Used : &#8358;'.$addedC.'</span>';
          $message.='<br><br> <span style="font-size:18px"> Grand Total : &#8358;'.((int)$userdata->cartTotal).'</span>';
          $message.='<br><br> <h3> Your Delivery Address </h3>';
          $message.='<span>'.$userdata->flatnum.', '.$userdata->street.', '.$userdata->bustop.', '.$userdata->area.', Lagos Nigeria</span>';
          $message.='<br> <span style="font-size:14px"> Your Phone Number :'.$userdata->phone.'</span>';
          $message.='<br><br> <span style="font-size:12px; color:#900">Inbox us on Poweroil facebook page in case of you have any questions.</span>' ;
          $headers = "MIME-Version: 1.0" . "\r\n";
          $headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
          $headers .= "Bcc:poweroil.omp@tolaram.com\r\n";
         // $headers .= "Bcc:sholadedokun@gmail.com\r\n";
          $headers .= "From:Poweroil\r\n";
          $a = mail($to, $subject, $message, $headers);
      }

}
elseif($_POST['action'] =='adduser_catchtransaction'){
    $userdata=json_decode($_POST['data']);
     $basketId=uniqid();
  $sql="Select * from `user_data` where `facebook_id`='".$userdata->id."'";
  $rs=mysqli_query($con, $sql)or die ("Error : could not add first cuopon". mysqli_error($con));
  //$ts= mysqli_num_rows($rs);
  $infou=mysqli_fetch_array($rs);
  if($infou[8]=='inactive'){
      $t=time();
    //   $sqlu="Insert into user_data values ( NULL, '"
    //   .mysqli_real_escape_string($con, $userdata->id)."','"
    //   .mysqli_real_escape_string($con, $userdata->name)."','"
    //   .mysqli_real_escape_string($con, $userdata->email)."', '', '', '', '', '".$t."')";
    //   $rsu=mysqli_query($con, $sqlu) or die ("Error : could not Add new user" . mysqli_error($con));
    //   $t_id = mysqli_insert_id($con);
      $sqlc ="Insert into coupon values (NULL, '250', '"
      .mysqli_real_escape_string($con, $userdata->id)."','', 'Welcome Voucher','','".$t."')";
      $resc=mysqli_query($con, $sqlc) or die ("Error : could not add first cuopon". mysqli_error($con));
      if($resc){
          $sqlu="Update `user_data` set `status`='active' where `facebook_id`='".$userdata->id."'";
          $resc=mysqli_query($con, $sqlu) or die ("Error : could not update use status". mysqli_error($con));
      }
  }

  for($i=0; $i<count($userdata->cart); $i++){
      $sqlk="insert into order_basket values ( NULL, '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->item_no)."','"
      .$basketId."', '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->quantity)."',  '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->item_rate)."',  '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->item_discount)."', '"
      .($userdata->cart[$i]->item_rate*$userdata->cart[$i]->quantity)."', '".$t."', '".$userdata->id."')";
      $rsk=mysqli_query($con, $sqlk) or die ("Error : could not Add new transcation".mysqli_error($con));;
  }
  if($rsk){echo $_POST['callback'].$basketId;}
  else{echo $_POST['callback'].'Error Adding transaction';}
}
elseif($_POST['action'] =='update_catchtransaction'){
    $userdata=json_decode($_POST['data']);
    $basketId=$userdata->basketId;
    $sql="delete from `order_basket` where basket_id='".$basketId."'";
    $rs=mysqli_query($con, $sql) or die("Error : couldn't  remove dupliacte orders".mysqli_error($con));
  for($i=0; $i<count($userdata->cart); $i++){
      $sqlk="insert into order_basket values ( NULL, '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->item_no)."','"
      .$basketId."', '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->quantity)."',  '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->item_rate)."',  '"
      .mysqli_real_escape_string($con, $userdata->cart[$i]->item_discount)."', '"
      .($userdata->cart[$i]->item_rate*$userdata->cart[$i]->quantity)."', '".$t."', '".$userdata->id."')";
      $rsk=mysqli_query($con, $sqlk) or die ("Error : could not Add new transcation".mysqli_error($con));;
  }
  if($rsk){echo $_POST['callback'].$basketId;}
  else{echo $_POST['callback'].'Error Adding transaction';}
}
elseif ($_POST['action']=='getallc') {
  $a_json[0]=array('c_id' => '', 'c_name'=>'Select a category' );
  $sqlcheck = "SELECT category_id, category_title, category_descripiton FROM `category` order by category_id";
  $rescheck = mysqli_query($con, $sqlcheck) or die ("Error : could not Select category ". mysqli_error());;
  while($info= mysqli_fetch_array($rescheck)){
    $qobject = array('c_id' => $info[0], 'c_name'=>$info[1], 'c_desc'=>$info[2] );
    array_push($a_json, $qobject);
  }
  echo $_POST['callback'].json_encode($a_json);
}
elseif($_POST['action']=='viewI'){
  //retrieve all the item's data
  $sqlQ = "SELECT * FROM `item` where item_no='".$_POST['data']."' ";
  $resQ=mysqli_query($con, $sqlQ) or die ("Error : could not Select category" . mysqli_error($con));;
  $infoQ= mysqli_fetch_array($resQ);
  //select the category name from the database//
  $sqlQc = "SELECT category_title FROM `category` where category_id='".$infoQ[1]."' ";
  $resQc=mysqli_query($con, $sqlQc) or die ("Error : could not Select category" . mysqli_error($con));
  $infoQc= mysqli_fetch_array($resQc);
  $a_json['item_data']= $infoQ;
  $a_json['category_name']=$infoQc[0];
  echo $_POST['callback'].json_encode($a_json);
}
elseif($_POST['action']=='viewallI'){
  //retrieve all the Categories
  $a_json=array();
  $sqlCAT = "SELECT * FROM `category` order by `category_title` asc";
  $resCAT=mysqli_query($con, $sqlCAT) or die ("Error : could not Select Categories" . mysqli_error($con));
  while($infoCAT= mysqli_fetch_array($resCAT)){
    $a_sub_json['categoryname']= $infoCAT[1];
    $a_sub_json['items']=array();
    //select the item with the category_id//
    $sqlAQ = "SELECT * FROM `item` where `item_category` = $infoCAT[0] order by `item_no` asc";
    $resAQ=mysqli_query($con, $sqlAQ) or die ("Error : could not Select items" . mysqli_error($con));;
    while($infoAQ= mysqli_fetch_assoc($resAQ)){
      $qobject = $infoAQ;
      $qobject['item_quantity']=$qobject['item_lowest_quantity'];
      $qobject['quantity']=0;
      array_push($qobject, $quantity);
      array_push($a_sub_json['items'], $qobject);
    }
    array_push($a_json, $a_sub_json);
  }
 // print_r($a_json);
  echo $_POST['callback'].json_encode($a_json);
}
elseif ($_POST['action']=='getallqinc') {
  $a_json[0]=array('q_id' => '', 'q_text'=>'Select a item' );
  $sqlAQ = "SELECT * FROM `item` where `item_category` = '$data' order by `item_order` asc";
  $resAQ=mysqli_query($con, $sqlAQ) or die ("Error : could not Select items" . mysqli_error($con));
  while($infoAQ= mysqli_fetch_array($resAQ)){
    $qobject = array('q_id' => $infoAQ[0], 'q_text'=>$infoAQ[1] );
    array_push($a_json, $qobject);
  }
  echo $_POST['callback'].json_encode($a_json);
}
elseif ($_POST['action']=='fetchcoupons') {
  $sqlAQ = "SELECT * FROM  `coupon`  where `user_id` = '".$_POST['data']."' AND `applied_date`='' order by `coupon_id` desc";
  $resAQ=mysqli_query($con, $sqlAQ) or die ("Error : could not fetch coupons" . mysqli_error($con));
 // echo $sqlAQ;
 $a_json=array();
   while($infoAQ= mysqli_fetch_assoc($resAQ)){
     array_push($a_json, $infoAQ);
  }
  echo $_POST['callback'].json_encode($a_json);
}
elseif ($_POST['action']=='fetchUsertransactions') {
  $sqlAQ = "SELECT * FROM  `transaction_log`  where `user_id` = '".$_POST['data']."' order by `trans_id` desc";
  $resAQ=mysqli_query($con, $sqlAQ) or die ("Error : could not fetch user transaction" . mysqli_error($con));
  $a_json=array();
  while($infoAQ= mysqli_fetch_assoc($resAQ)){
     array_push($a_json, $infoAQ);
  }
  echo $_POST['callback'].json_encode($a_json);
}
elseif ($_POST['action']=='addnewuser') {
    $sql="Select * from `user_data` where `facebook_id`='".$_POST['id']."' OR `user_id`='".$userdata->id."'";
    $rs=mysqli_query($con, $sql);
    $ts= mysqli_num_rows($rs);
    if($ts<1){
        $t=time();
        $sqlu="Insert into user_data values ( NULL, '"
        .mysqli_real_escape_string($con, $_POST['id'])."','"
        .mysqli_real_escape_string($con, $_POST['name'])."','"
        .mysqli_real_escape_string($con, $_POST['email'])."', '', '', '', '', 'inactive', '".$t."')";
        $rsu=mysqli_query($con, $sqlu) or die ("Error : could not Add new user" . mysqli_error($con));
    }
}
else{
    $sql='Select * from item  order by item_no Desc';
    $rs=mysqli_query($con, $sql) or die ("Error : could not Fetch items" . mysqli_error());
    $total_rows= mysqli_num_rows($rs);
    $info=mysqli_fetch_array($rs);
    $a_json['total_items']= $total_rows;
    $a_json['last_update']=gmdate("F j, Y, g:i a",$info[11]);
    echo $_POST['callback'].json_encode($a_json);
}
 ?>
