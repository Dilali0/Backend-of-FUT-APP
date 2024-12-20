<?php
function softDelet(){
    global $con ;
    $data = json_decode(file_get_contents('php://input'), true);
    $id = mysqli_real_escape_string($con, $data['idplayer']);

    $sql = "UPDATE Player set deleted_at = CURRENT_DATE() where Player.id = $id";

    if(mysqli_query($con,$sql)){
        json_encode(['message' =>'Player deleted']);
   }else{
        json_encode(['error' => mysqli_error($con)]);
   }


}






?>