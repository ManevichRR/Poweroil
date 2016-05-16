<?php
error_reporting(-1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
date_default_timezone_set('UTC');

// Report all errors
//error_reporting(E_ALL);

try {
    // Initialize Composer autoloader
    if (!file_exists($autoload = __DIR__ . '/vendor/autoload.php')) {
        throw new \Exception('Composer dependencies not installed. Run `make install --directory app/api`');
    }
    require_once $autoload;

    // Initialize Slim Framework
    if (!class_exists('\\Slim\\Slim')) {
        throw new \Exception(
            'Missing Slim from Composer dependencies.'
            . ' Ensure slim/slim is in composer.json and run `make update --directory app/api`'
        );
    }

    // Run application
    $app = new \Api\Application();
    $app->post('/upload', 'uploadPicture');
    $app->post('/vote_user', 'voteUser');
    $app->get('/users', 'getUsers');
    $app->get('/get_image', 'getImage');
    $app->get('/user', 'getUser');
    //$app->get('/user/:id', 'getUser');
    $app->run();

} catch (\Exception $e) {
    if (isset($app)) {
        $app->handleException($e);
    } else {
        http_response_code(500);
        header('Content-Type: application/json');
        echo json_encode(array(
            'status' => 500,
            'statusText' => 'Internal Server Error',
            'description' => $e->getMessage(),
        ));
    }
}

/*function getConnection()
{
    $dbhost="127.0.0.1";
    //$dbport="8889";
    $dbuser="root";
    $dbpass="";
    $dbname="indomie_contest";
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;
}*/

function getConnection()
{
    $dbhost="localhost";
    //$dbport="8889";
    $dbuser="getcentr_indomie";
    $dbpass="indomie";
    $dbname="getcentr_indomie";
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;
}

function getUsers(){
  $sql = "SELECT * FROM Users ORDER BY id";
  try{
    $db = getConnection();
    $stmt = $db->query($sql);
    $users = $stmt->fetchAll(PDO::FETCH_OBJ);
    $db = null;
    echo json_encode($users);
  }catch(PDOException $e){
    echo '{"error":{"text":'. $e->getMessage() .'}}';
  }
}

function getUser(){
  $id = $_GET["user_id"];
  $sql = "SELECT * FROM Users WHERE id = $id";
  try{
    $db = getConnection();
    $stmt = $db->query($sql);
    $user = $stmt->fetchAll(PDO::FETCH_OBJ);
    $db = null;
    echo json_encode($user);
  }catch(PDOException $e){
    echo '{"error":{"text":'. $e->getMessage() .'}}';
  }
}

function addUser($name, $reason, $image_url, $timestamp) {
  $sql = "INSERT INTO Users (Name, Reason, Image, TimestampValue) VALUES (:name, :reason, :image, :timestampvalue)";
  try {

    $db = getConnection();
    $stmt = $db->prepare($sql);
    $stmt->bindParam("name", $name);
    $stmt->bindParam("reason", $reason);
    $stmt->bindParam("image", $image_url);
    $stmt->bindParam("timestampvalue", $timestamp);
    $stmt->execute();
    $id = $db->lastInsertId();
    $db = null;
    //echo json_encode($id);
    echo $image_url;
  } catch(PDOException $e) {
    echo '{"error":{"text":'. $e->getMessage() .'}}';
  }
}

function voteUser(){
  $id = $_POST["user_id"];
  $sql = "UPDATE Users SET `Votes` = `Votes` + 1 WHERE `ID` = :id";

  try{
    $db = getConnection();
    $stmt = $db->prepare($sql);
    $stmt->bindParam("id", $id);
    $stmt->execute();
    echo "success";
  }catch(PDOException $e){
    echo '{"error":{"text":'. $e->getMessage() .'}}';
  }
}

function showHome()
{
  echo "string";
}

function getImage(){
  $path = $_GET["user_location"];
  $filePath = __DIR__ . "/assets/headers/" . $path;

  header('Set-Cookie: fileDownload=true; path=/');
  header('Cache-Control: max-age=60, must-revalidate');
  //header("Content-type: text/csv");
  header('Content-Type:' . mime_content_type ($filePath));
  header('Content-Disposition: attachment; filename="'.basename($filePath).'"');
  header('Content-Length: ' . filesize($filePath));
  readfile($filePath);

  /*header('Content-Description: File Transfer');
  header('Content-Type: application/octet-stream');
  header('Content-Disposition: attachment;  filename="'.basename($filePath).'"');
  header('Expires: 0');
  header('Cache-Control: must-revalidate');
  header('Pragma: public');
  header('Content-Length: ' . filesize($filePath));
  readfile($filePath);*/
}

function cartoonImage($file_path){
  exec("bash " . __DIR__ . "/cartoon.sh " . $file_path . " " .  $file_path);
}

function uploadPicture()
{
  $file_path = __DIR__ . "/assets/headers/";

  $name = $_POST["name"];
  $reason = $_POST["reason"];
  $x1 = $_POST["x1"];
  $y1 = $_POST["y1"];
  $x2 = $_POST["x2"];
  $y2 = $_POST["y2"];

  $w = $_POST["width"];
  $h = $_POST["height"];

  $date = new DateTime();
  $timestamp = $date->getTimestamp();



  $temp = explode(".", $_FILES["file"]["name"]);
  $newfilename = str_replace(" ", "", $name) . '.' . end($temp);

  $file_path = $file_path . $timestamp . $newfilename;//basename( $_FILES['file']['name']);
  if(move_uploaded_file($_FILES['file']['tmp_name'], $file_path)) {
    list($max_width, $max_height) = getimagesize($file_path);

    //$im = @imagecreatefromjpeg($file_path);
    $info = pathinfo($file_path);
    $extension = strtolower($info['extension']);
    switch ($extension) {
        case 'jpg':
          $im = imagecreatefromjpeg($file_path);
          break;
        case 'jpeg':
          $im = imagecreatefromjpeg($file_path);
          break;
        case 'png':
          $im = imagecreatefrompng($file_path);
          break;
        case 'gif':
          $im = imagecreatefromgif($file_path);
          break;
        default:
          $im = imagecreatefromjpeg($file_path);
    }

    //we want to translate the points from the img element that this image is in, to the real size of the image
    /*$new_x1 = ($x1 * $max_width)/$w;
    $new_y1 = ($y1 * $max_height)/$h;

    $new_x2 = ($x2 * $max_width)/$w;
    $new_y2 = ($y2 * $max_height)/$h;



    $width = $new_x2 - $new_x1;
    $height = $new_y2 - $new_y1;*/

    $to_crop_array = array('x' => $x1 , 'y' => $y1, 'width' => $x2, 'height'=> $y2);
    $thumb_im = imagecrop($im, $to_crop_array);

    imagejpeg($thumb_im, $file_path, 100);

    $final_im = $timestamp . $newfilename;
    //illustrateImage($file_path);
    addUser($name, $reason, $final_im, $timestamp);

    cartoonImage($file_path);
    //$stmt = $dbConnection->prepare("UPDATE `Users` SET `Header` = :header WHERE `Email` = :email");
    //$stmt->bindParam(':email', $user);
    //$stmt->bindParam(':header', $headername);

    //$stmt->execute(array(":email" => $user, ":header" => $headername));
    //echo "success";
  } else{
      echo "fail";
  }
}
