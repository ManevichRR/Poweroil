<?php
ini_set('display_errors', 1);
require_once 'fun_connect.php';
if(isset($_FILES["file"]["type"])){
	$validextensions = array("jpeg", "jpg", "png");
	$temporary = explode(".", $_FILES["file"]["name"]);
	$file_extension = end($temporary);
	if ((($_FILES["file"]["type"] == "image/png") || ($_FILES["file"]["type"] == "image/jpg") || ($_FILES["file"]["type"] == "image/jpeg")
	) && ($_FILES["file"]["size"] < 1000000)&& in_array($file_extension, $validextensions)) {
		if($_FILES["file"]["error"] > 0){ echo "Return Code: " . $_FILES["file"]["error"] . "<br/><br/>";}
		else{
			if (file_exists("upload/" . $_FILES["file"]["name"])) {echo $_FILES["file"]["name"] . " <span id='invalid'><b>already exists.</b></span> ";}
			else{ $t=time();
				$sourcePath = $_FILES['file']['tmp_name']; // Storing source path of the file in a variable
				$targetPath = "upload/".$t.'.'.$file_extension; // Target path where file is to be stored
				move_uploaded_file($sourcePath,$targetPath) ; // Moving Uploaded file
				$sql = "insert into `user_form` values
				  (NULL, '".mysqli_real_escape_string($con, $_POST["name"])."',
				   '".mysqli_real_escape_string($con, $_POST["MFull-name"])."',
					'".mysqli_real_escape_string($con, $_POST["number"])."',
					'".mysqli_real_escape_string($con, $_POST["field"])."',
					'".$targetPath."',
					'".$t."')";
					$rs = mysqli_query($con, $sql) ;
					$p_id = mysqli_insert_id($con);
  					$to='service@alphaandjamnigeria.com, samuel.ajiboye@alphaandjamnigeria.com, nescoadel@yahoo.co.uk';
    				$subject = "Poweroil Mother Day";
					//$message="Dear ".$_GET['title']." ".$_GET['fname']." ".$_GET['lname'].",<br><br>";
					$message.= 'Please,find the details of the user below.<br><br>';
					$message.= '<b>user Name</b> : '.$_POST['name'].'<br>';
					$message.= '<b>User Mother full name</b> : '.$_POST['MFull-name'].'<br>';
					$message.= '<b>User Mother Phone Number</b> : '.$_POST['number'].'<br>';
					$message.= '<b>User Message</b> : '.$_POST['field'].'<br>';
					$message.= '<b>User Mother Picture</b> :<br>';
					$message.= '<img src="http://bytesandbinaries.com/poweroil/'.$targetPath.'"/>';
					$headers = "MIME-Version: 1.0" . "\r\n";
					$headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
					$headers .= "From:Poweroil\r\n";
					$a = mail($to, $subject, $message, $headers);
					// if($a){
				//   $to=$_POST['email'];
				// 	$subject = "LG G4tune Confirmation";
				// 	$message="Dear ".$_POST['name'].",<br><br>";
				// 	$message.= 'Thanks for playing the LG G4Tune Game, you won the '.$_POST['selected']['model'].'; our representative will contact you shortly.<br><br>';
				// 	$headers = "MIME-Version: 1.0" . "\r\n";
				// 	$headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
				// 	$headers .= "From:LG G4tune\r\n";
					// 	$b = mail($to, $subject, $message, $headers);
				//   if($b){ echo $_GET['callback'].'('.json_encode('o').')';}
				echo "PowerOil says a big thank you for sharing your best moment with your mother. Happy Mother's Day from Power Oil";

			}
		}
}
else{ echo "<span id='invalid'>***Invalid file Size or Type***<span>";}
}

?>