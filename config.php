<?php
$servername = "localhost";
$username = "root"; // Ganti sesuai konfigurasi MySQL Anda
$password = ""; // Ganti sesuai konfigurasi MySQL Anda
$dbname = "triinvite"; // Nama database

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
