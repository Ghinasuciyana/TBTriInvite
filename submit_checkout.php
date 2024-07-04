<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

include 'config.php';

// Ambil data dari request POST jika ada
$selectedPackage = isset($_POST['selectedPackage']) ? $_POST['selectedPackage'] : null;
$packagePrice = isset($_POST['packagePrice']) ? $_POST['packagePrice'] : null;
$paymentMethod = isset($_POST['paymentMethod']) ? $_POST['paymentMethod'] : null; // Metode pembayaran

// Periksa apakah data yang diperlukan telah tersedia
if ($selectedPackage !== null && $packagePrice !== null && $paymentMethod !== null) {
    // Masukkan data ke dalam tabel transactions
    $sql = "INSERT INTO transactions (selectedPackage, packagePrice, payment_method)
            VALUES ('$selectedPackage', '$packagePrice', '$paymentMethod')";

    if ($conn->query($sql) === TRUE) {
        $response = [
            'status' => 'success',
            'message' => 'Data successfully saved'
        ];
        echo json_encode($response);
    } else {
        $response = [
            'status' => 'error',
            'message' => 'Failed to save data: ' . $conn->error
        ];
        echo json_encode($response);
    }
} else {
    // Jika salah satu data tidak tersedia
    $response = [
        'status' => 'error',
        'message' => 'Incomplete data received'
    ];
    echo json_encode($response);
}

$conn->close();
?>
