<?php
include 'config.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    echo "Received ID: $id"; // Tambahkan ini untuk debugging

    // Pastikan $id adalah bilangan bulat
    if (!is_numeric($id)) {
        echo "Error: ID must be an integer";
        exit;
    }

    $sql = "DELETE FROM transactions WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Transaction deleted successfully";
    } else {
        echo "Error deleting transaction: " . $conn->error;
    }
} else {
    echo "Error: ID parameter is missing";
}

$conn->close();
?>
