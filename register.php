<?php
include 'db_config.php';

$user = "admin"; // Palitan mo ito ng gusto mong username
$pass = "STAFF2026";   // Palitan mo ito ng gusto mong password

// Ito ang sikreto para maging secure: Password Hashing
$hashed_password = password_hash($pass, PASSWORD_DEFAULT);

$stmt = $conn->prepare("INSERT INTO admin_users (username, password_hash) VALUES (?, ?)");
$stmt->bind_param("ss", $user, $hashed_password);

if ($stmt->execute()) {
    echo "Admin Account Created Successfully!";
} else {
    echo "Error: " . $stmt->error;
}
?>