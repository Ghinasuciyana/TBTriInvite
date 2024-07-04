<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'config.php';

// Menerima data dari POST request
$category = isset($_POST['category']) ? $_POST['category'] : '';
$namaMempelaiWanita = isset($_POST['namaMempelaiWanita']) ? $_POST['namaMempelaiWanita'] : '';
$orangTuaWanita = isset($_POST['orangTuaWanita']) ? $_POST['orangTuaWanita'] : '';
$anakKeWanita = isset($_POST['anakKeWanita']) ? $_POST['anakKeWanita'] : '';
$namaMempelaiPria = isset($_POST['namaMempelaiPria']) ? $_POST['namaMempelaiPria'] : '';
$orangTuaPria = isset($_POST['orangTuaPria']) ? $_POST['orangTuaPria'] : '';
$anakKePria = isset($_POST['anakKePria']) ? $_POST['anakKePria'] : '';
$tanggalAkad = isset($_POST['tanggalAkad']) ? $_POST['tanggalAkad'] : '';
$jamAkad = isset($_POST['jamAkad']) ? $_POST['jamAkad'] : '';
$tanggalResepsi = isset($_POST['tanggalResepsi']) ? $_POST['tanggalResepsi'] : '';
$jamResepsi = isset($_POST['jamResepsi']) ? $_POST['jamResepsi'] : '';
$namaDikhitan = isset($_POST['namaDikhitan']) ? $_POST['namaDikhitan'] : '';
$namaOrangTua = isset($_POST['namaOrangTua']) ? $_POST['namaOrangTua'] : '';
$tanggalAcara = isset($_POST['tanggalAcara']) ? $_POST['tanggalAcara'] : '';
$jamAcara = isset($_POST['jamAcara']) ? $_POST['jamAcara'] : '';
$lokasiAcara = isset($_POST['lokasiAcara']) ? $_POST['lokasiAcara'] : '';

// Validasi data
if (empty($category)) {
    echo json_encode(['status' => 'error', 'message' => 'Category is required']);
    exit;
}

// Menentukan tabel tujuan dan kolom berdasarkan kategori
$tableName = '';
$insertSql = '';

switch ($category) {
    case 'Wedding':
        $tableName = 'wedding_data';
        $insertSql = "INSERT INTO $tableName (namaMempelaiWanita, orangTuaWanita, anakKeWanita, 
                      namaMempelaiPria, orangTuaPria, anakKePria, tanggalAkad, jamAkad, 
                      tanggalResepsi, jamResepsi, lokasiAcara) 
                      VALUES ('$namaMempelaiWanita', '$orangTuaWanita', '$anakKeWanita', 
                              '$namaMempelaiPria', '$orangTuaPria', '$anakKePria', 
                              '$tanggalAkad', '$jamAkad', '$tanggalResepsi', '$jamResepsi', 
                              '$lokasiAcara')";
        break;
    case 'Khitan':
        $tableName = 'khitan_data';
        $insertSql = "INSERT INTO $tableName (namaDikhitan, namaOrangTua, tanggalAcara, jamAcara, lokasiAcara) 
                      VALUES ('$namaDikhitan', '$namaOrangTua', '$tanggalAcara', '$jamAcara', '$lokasiAcara')";
        break;
    default:
        echo json_encode(['status' => 'error', 'message' => 'Invalid category']);
        exit;
}

if ($conn->query($insertSql) === TRUE) {
    echo json_encode(['status' => 'success', 'message' => 'Form data saved successfully']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to save form data: ' . $conn->error]);
}

$conn->close();
?>
