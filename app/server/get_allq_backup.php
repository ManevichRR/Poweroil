<?php
header('Access-Control-Allow-Origin: *');
error_reporting(E_ALL);
ini_set('display_errors', 0);
$username = "wwwbytes_powerm";
$password = "Asdf1234!";
$database = "wwwbytes_poweroil";
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

else if($_POST['action'] =='addtotransactionlog'){
  $t=time();
  $userdata=json_decode($_POST['data']);
  $sqlu="Select item_id from `order_basket` where `basket_id` ='".$userdata->basketId."'";
  $rs=mysqli_query($con, $sqlu);
  $ts= mysqli_num_rows($rs);
  if($ts!=count($userdata->cart)){

  }
  $delivery_add=$userdata->flatnum.' '.$userdata->street.' '.$userdata->bustop.' '.$userdata->area;
  $sql="Insert into `transaction_log` values (NULL, '"
  .mysqli_real_escape_string($con, $userdata->id)."','"
  .mysqli_real_escape_string($con, NULL)."','"
  .mysqli_real_escape_string($con, $userdata->basketId)."','"
  .mysqli_real_escape_string($con, $userdata->cartTotal)."','".$delivery_add."','".$userdata->phone."', 'Pending','','".$t."')";
  $rsu=mysqli_query($con, $sql) or die ("Error : could not Add new user" . mysqli_error($con));
  $t_id = mysqli_insert_id($con);
  if($rsu){echo $_POST['callback'].$t_id;}
}
else if($_POST['action'] =='adduser_catchtransaction'){
    $userdata=json_decode($_POST['data']);
     $basketId=uniqid();
  $sql="Select * from `user_data` where `facebook_id`='".$userdata->id."' OR `user_id`='".$userdata->id."'";
  $rs=mysqli_query($con, $sql);
  $ts= mysqli_num_rows($rs);
  if($ts<1){
      $t=time();
      $sqlu="Insert into user_data values ( NULL, '"
      .mysqli_real_escape_string($con, $userdata->id)."','"
      .mysqli_real_escape_string($con, $userdata->email)."', '', '', '', '', '".$t."')";
      $rsu=mysqli_query($con, $sqlu) or die ("Error : could not Add new user" . mysqli_error($con));
      $t_id = mysqli_insert_id($con);
      $sqlc ="Insert into coupon values (NULL, '100', '"
      .mysqli_real_escape_string($con, $userdata->id)."','', 'First buy','','".$t."')";
      $resc=mysqli_query($con, $sqlc) or die ("Error : could not add first cuopon". mysqli_error($con));
      $c_id=  mysqli_insert_id($con);
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
else if ($_POST['action']=='getallc') {
  $a_json[0]=array('c_id' => '', 'c_name'=>'Select a category' );
  $sqlcheck = "SELECT category_id, category_title, category_descripiton FROM `category` order by category_id";
  $rescheck = mysqli_query($con, $sqlcheck) or die ("Error : could not Select category ". mysqli_error());;
  while($info= mysqli_fetch_array($rescheck)){
    $qobject = array('c_id' => $info[0], 'c_name'=>$info[1], 'c_desc'=>$info[2] );
    array_push($a_json, $qobject);
  }
  echo $_POST['callback'].json_encode($a_json);
}
else if($_POST['action']=='viewI'){
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
else if($_POST['action']=='viewallI'){
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
  $sqlAQ = "SELECT * FROM  `coupon`  where `user_id` = '".$_POST['data']."' order by `coupon_id` desc";
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
