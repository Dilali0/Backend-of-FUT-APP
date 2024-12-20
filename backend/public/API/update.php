<?php


function updateplayer(){
    global $con ;
    $data = json_decode(file_get_contents('php://input'),true);
    $id = intval($data['id']);
    $name = mysqli_real_escape_string($con, $data['nom']);
    $position = mysqli_real_escape_string($con, $data['position']);
    $photo = mysqli_real_escape_string($con, $data['photo']);
    $club = intval($data['club']);
    $Nationality = intval($data['Nationality']);
    $rating = intval($data['rating']);
    $pace_diving = intval($data['pace_diving']);
    $shooting_handling = intval($data['shooting_handling']);
    $passing_kicking = intval($data['passing_kicking']);
    $dribbling_reflexes = intval($data['dribbling_reflexes']);
    $defending_speed = intval($data['defending_speed']);
    $physical_positioning = intval($data['physical_positioning']);
    
    $sql = " UPDATE Player
             SET nom = '$name' , Photo = '$photo' , positionn = '$position' , 
             rating = $rating , club_id = $club , nat_id = $Nationality ,
             diving_pace = $pace_diving , handling_shooting =  $shooting_handling ,
             kicking_passing = $passing_kicking , reflexes_dribbling = $dribbling_reflexes ,
             speed_defending =  $defending_speed , positioning_physical = $physical_positioning
             WHERE Player.id = $id " ;
    if(mysqli_query($con,$sql)){
         json_encode(['message' =>'Player Updated']);
    }else{
         json_encode(['error' => mysqli_error($con)]);
    }

}

?>