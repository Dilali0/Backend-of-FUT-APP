<?php
function addplayer() {
    global $con;
    $data = json_decode(file_get_contents('php://input'), true);
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

    $sql = "INSERT INTO Player (
        photo, nom, positionn, statu, rating, club_id, nat_id,
        diving_pace, handling_shooting, kicking_passing,
        reflexes_dribbling, speed_defending, positioning_physical, deleted_at
    ) VALUES (
        '$photo', '$name', '$position', NULL, $rating, $club, $Nationality,
        $pace_diving, $shooting_handling, $passing_kicking,
        $dribbling_reflexes, $defending_speed, $physical_positioning, NULL
    )";

    if (mysqli_query($con, $sql)) {
        echo json_encode(['message' => 'Player created']);
    } else {
        echo json_encode(['error' => mysqli_error($con)]);
    }
}
?>
