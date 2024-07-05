<?php
include 'config.php';

$sql = "SELECT * FROM transactions";
$result = $conn->query($sql);

// Jika data ditemukan, kirimkan sebagai JSON
if ($result->num_rows > 0) {
    $transactions = array();
    while ($row = $result->fetch_assoc()) {
        // Mengubah kunci field menjadi lower case
        $formattedRow = array_change_key_case($row, CASE_LOWER);
        $transactions[] = $formattedRow;
    }
    echo json_encode($transactions);
} else {
    echo json_encode([]);
}

$conn->close();
?>
