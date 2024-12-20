<?php
$host = 'mysql'; 
$dbname = 'FUT';
$username = 'user';
$password = 'user_password';
$con = mysqli_connect($host, $username, $password, $dbname);
if(!$con){
    die("Database connection failed" .mysqli_connect_error());
}
?>
