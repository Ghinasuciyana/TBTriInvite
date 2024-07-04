<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

include 'config.php';

$name = isset($_POST['name']) ? $_POST['name'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';

if (empty($name) || empty($email) || empty($password)) {
    echo json_encode(['status' => 'error', 'message' => 'Name, email, and password are required']);
    exit;
}

$sql = "SELECT * FROM users WHERE email='$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo json_encode(['status' => 'error', 'message' => 'User with this email already exists']);
    exit;
}

$passwordHash = password_hash($password, PASSWORD_DEFAULT);

$insertSql = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$passwordHash')";
if ($conn->query($insertSql) === TRUE) {
    echo json_encode(['status' => 'success', 'message' => 'Registration successful']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to register: ' . $conn->error]);
}

$conn->close();
?>
