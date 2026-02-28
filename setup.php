<?php
include 'db_config.php';
$user = "admin";
$pass = "STAFF2026"; 
$hash = password_hash($pass, PASSWORD_DEFAULT);
$conn->query("INSERT INTO admin_users (username, password_hash) VALUES ('$user', '$hash')");
echo "Admin created! You can now login.";
?>