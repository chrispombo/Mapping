<?php
$host = "localhost";
$user = "root";
$pass = "";
$dbname = "funeraltoril_db";

$conn = new mysqli($host, $user, $pass, $dbname);

$conn = new mysqli("localhost", "root", "", "funeraltoril_db");

if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }
?>