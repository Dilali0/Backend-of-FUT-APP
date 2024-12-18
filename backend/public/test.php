<?php 
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: "); 
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

$_REQUEST = $_SERVER["REQUEST_METHOD"];
include('./readPlayers.php');
include('./create.php');

if($_REQUEST == 'GET'){

    $players = getPlayersList();
    echo $players ;

}else if($_REQUEST == 'POST'){
   $addplayer = addplayer();
   echo  $addplayer ;
}
?>