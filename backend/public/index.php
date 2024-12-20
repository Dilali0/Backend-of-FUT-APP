<?php 
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: *"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

$_REQUEST = $_SERVER["REQUEST_METHOD"];
include('./API/readPlayers.php');
include('./API/create.php');
include('./API/update.php');
include('./API/softdelet.php');

if($_REQUEST == 'GET'){

    $players = getPlayersList();
    echo $players ;

}else if($_REQUEST == 'POST' ){
   $addPlayer = addplayer();
   echo  $addPlayer ;
}else if($_REQUEST == 'PUT' ){
   $updatePlayer =  updateplayer();
   echo $updatePlayer ;
}else if($_REQUEST == 'DELETE'){
   $softdelet = softDelet();
   echo  $softdelet ;
}
?>