<?php
include 'connect.php';

header("Content-Type: application/json");

$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'GET') {
    // Fetch all users
    $result = mysqli_query($conn, "SELECT * FROM users");
    $users = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode($users);
} elseif ($method == 'POST') {
    // Create a new user
    $data = json_decode(file_get_contents('php://input'), true);
    $name = mysqli_real_escape_string($conn, $data['name']);
    $email = mysqli_real_escape_string($conn, $data['email']);

    $sql = "INSERT INTO users (name, email) VALUES ('$name', '$email')";
    if (mysqli_query($conn, $sql)) {
        echo json_encode(['message' => 'User created']);
    } else {
        echo json_encode(['error' => mysqli_error($conn)]);
    }
    
} elseif ($method == 'PUT') {
    // Update a user
    $data = json_decode(file_get_contents('php://input'), true);
    $id = intval($data['id']);
    $name = mysqli_real_escape_string($conn, $data['name']);
    $email = mysqli_real_escape_string($conn, $data['email']);

    $sql = "UPDATE users SET name = '$name', email = '$email' WHERE id = $id";
    if (mysqli_query($conn, $sql)) {
        echo json_encode(['message' => 'User updated']);
    } else {
        echo json_encode(['error' => mysqli_error($conn)]);
    }
} elseif ($method == 'DELETE') {
    // Delete a user
    parse_str(file_get_contents('php://input'), $data);
    $id = intval($data['id']);

    $sql = "DELETE FROM users WHERE id = $id";
    if (mysqli_query($conn, $sql)) {
        echo json_encode(['message' => 'User deleted']);
    } else {
        echo json_encode(['error' => mysqli_error($conn)]);
    }
} else {
    echo json_encode(['message' => 'Invalid request method']);
}
?>
