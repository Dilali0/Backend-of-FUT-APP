 <?php

require 'config.php';

$query = $pdo->query("SELECT * FROM Club");

$data = [];
while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
    $data[] = $row;
}
echo json_encode($data);
?> 

