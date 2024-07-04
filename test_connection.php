<?php
include 'config.php';

if ($conn) {
    echo json_encode(array('message' => 'Database connection successful'));
} else {
    echo json_encode(array('error' => 'Database connection failed'));
}

$conn->close();
?>
