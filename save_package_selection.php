<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

// Include your database configuration file
include 'config.php';

// Retrieve data from POST request
$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode(['status' => 'error', 'message' => 'No data provided']);
    exit;
}

// Extract data
$selectedPackage = isset($data['selectedPackage']) ? $data['selectedPackage'] : '';
$selectedPackagePrice = isset($data['selectedPackagePrice']) ? $data['selectedPackagePrice'] : '';
$packageDescription = isset($data['packageDescription']) ? $data['packageDescription'] : '';

// Validate data (you can add more validation if necessary)
if (empty($selectedPackage) || !is_numeric($selectedPackagePrice)) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data provided']);
    exit;
}

// Insert into database
$tableName = 'selected_packages'; // Adjust table name as needed
$insertSql = "INSERT INTO $tableName (selectedPackage, selectedPackagePrice, packageDescription) 
              VALUES ('$selectedPackage', '$selectedPackagePrice', '$packageDescription')";

if ($conn->query($insertSql) === TRUE) {
    echo json_encode(['status' => 'success', 'message' => 'Selected package saved successfully']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to save selected package: ' . $conn->error]);
}

$conn->close();
?>
