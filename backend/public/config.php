<?php
$host = 'mysql'; 
$dbname = 'FUT';
$username = 'user';
$password = 'user_password';
$con = mysqli_connect($host, $username, $password, $dbname);
if(!$con){
    die("Database connection failed" .mysqli_connect_error());
}
// global $pdo ;
// try {
//     $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
//     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
// } catch (PDOException $e) {
//     die("Database connection failed: " . $e->getMessage());
// }
?>
