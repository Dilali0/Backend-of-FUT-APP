<?php
require 'config.php'; 
function addplayer(){
    global $con ;
    $data = json_decode(file_get_contents('php://input'), true);
    $name = mysqli_real_escape_string($con,$data['nom']);
    $position = mysqli_real_escape_string($con,$data['position']);
    $photo = mysqli_real_escape_string($con,$data['photo']);
    $club = mysqli_real_escape_string($con,$data['club']);
    $Nationality = mysqli_real_escape_string($con,$data['Nationality']);
    $rating = mysqli_real_escape_string($con,$data['rating']);
    $pace_diving = mysqli_real_escape_string($con,$data['pace_diving']);
    $shooting_handling = mysqli_real_escape_string($con,$data['shooting_handling']);
    $passing_kicking = mysqli_real_escape_string($con,$data['passing_kicking']);
    $dribbling_reflexes = mysqli_real_escape_string($con,$data['dribbling_reflexes']);
    $defending_speed = mysqli_real_escape_string($con,$data['defending_speed']);
    $physical_positioning = mysqli_real_escape_string($con,$data[' physical_positioning']);
    $sql = "INSERT INTO Player (photo, nom, positionn, statu, rating, club_id, nat_id, diving_pace, handling_shooting, kicking_passing, reflexes_dribbling, speed_defending, positioning_physical, deleted_at)
            VALUES ('$photo', '$name','$position',NULL,'$rating','$club','$Nationality','$pace_diving','$shooting_handling','$passing_kicking','$dribbling_reflexes','$defending_speed','$physical_positioning',NULL)";

    if(mysqli_query($con,$sql)){
        echo json_encode(['message' => 'User created']);
    } else {
        echo json_encode(['error' => mysqli_error($con)]);
    }
}

?>