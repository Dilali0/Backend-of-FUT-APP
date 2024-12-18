<?php
require 'config.php';
function getPlayersList(){
     global $con ;
     $query_table = 'SELECT *
               from `Player` 
               Join `Club` on `Club`.club_id = `Player`.club_id
               Join  `Nationality` on `Nationality`.`Nat_id` = `Player`.nat_id where Player.deleted_at is NuLL' ;

     $query_table_players_cunt = 'SELECT COUNT(*) AS Players_count FROM Player ' ;
     $query_table_Club_cunt = 'SELECT COUNT(*) AS Clubs_count FROM Club ' ;
     $query_table_Natio_cunt = 'SELECT COUNT(*) AS Natio_count FROM Nationality ' ;
     $quere_clubs_combo = 'SELECT * FROM Club  ';
     $quere_nat_combo = 'SELECT * FROM Nationality ';

     
     $query_run = mysqli_query($con, $query_table) ;
     $query_cun_table = mysqli_query($con, $query_table_players_cunt) ;
     $query_cun_club = mysqli_query($con, $query_table_Club_cunt) ;
     $query_cun_nation = mysqli_query($con, $query_table_Natio_cunt) ;
     $query_combo_nat = mysqli_query($con,$quere_nat_combo);
     $query_combo_club = mysqli_query($con, $quere_clubs_combo);
     if($query_run){
        if(mysqli_num_rows($query_run) > 0){

              $res1 = mysqli_fetch_all($query_run, MYSQLI_ASSOC);
              $res2 = mysqli_fetch_all($query_cun_table, MYSQLI_ASSOC);
              $res3 = mysqli_fetch_all($query_cun_club, MYSQLI_ASSOC);
              $res4 = mysqli_fetch_all($query_cun_nation, MYSQLI_ASSOC);
              $res5 = mysqli_fetch_all($query_combo_nat, MYSQLI_ASSOC);
              $res6 = mysqli_fetch_all($query_combo_club, MYSQLI_ASSOC);
               $data = [ 'status' => 200 ,
                         'message' => "player list fetch it succesfully",
                         'statsPlayers' =>  $res2,
                         'statsClub' =>  $res3,
                         'statsNatio' =>  $res4,
                         'nationality' =>  $res5,
                         'clubs' => $res6 ,
                         'data' => $res1,
                       ];
               header("HTTP/1.0 200  player list fetch it succesfully");
               return json_encode($data);

        }else{

            $data = [ 'status' => 404 , 'message' => "Not player found" ];
            header("HTTP/1.0 404 Not player found");
            return json_encode($data);
        }
     }else{

        $data = [ 'status' => 500 , 'message' => "Internal serveur error" ];
        header("HTTP/1.0 500 internal serveur error");
        return json_encode($data);
     }
     
}
?>