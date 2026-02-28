<?php
// 1. SOLUSYON SA CONNECTION ERROR: Pinapayagan ang access mula sa kahit anong port
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

include 'db_config.php';
header('Content-Type: application/json');

$action = $_GET['action'] ?? '';

// --- 1. LOGIN ACTION ---
if ($action == 'login') {
    $data = json_decode(file_get_contents('php://input'), true);
    $inputPassword = $data['password'] ?? '';
    
    // Hahanapin ang admin sa 'admin_users' table mo
    $stmt = $conn->prepare("SELECT password_hash FROM admin_users LIMIT 1");
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        if (password_verify($inputPassword, $row['password_hash'])) {
            echo json_encode(["status" => "success"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Invalid password"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "No admin account found"]);
    }
    exit;
}

// --- 2. FETCH ALL RECORDS ---
if ($action == 'fetch') {
    $result = $conn->query("SELECT * FROM burial_records ORDER BY id DESC");
    $data = [];
    while($row = $result->fetch_assoc()) { $data[] = $row; }
    echo json_encode($data);
    exit;
}

// --- 3. SAVE RECORD ---
if ($action == 'save') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Tugma sa columns sa iyong database: death_date, section, block, lot
    $stmt = $conn->prepare("INSERT INTO burial_records (name, death_date, section, block, lot, lat, lng) VALUES (?, ?, ?, ?, ?, ?, ?)");
    
    $stmt->bind_param("sssssdd", 
        $data['name'], 
        $data['death'], 
        $data['sec'], 
        $data['blk'], 
        $data['lot'], 
        $data['lat'], 
        $data['lng']
    );
    
    if ($stmt->execute()) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => $stmt->error]);
    }
    exit;
}

// --- 4. DELETE RECORD ---
if ($action == 'delete') {
    $id = $_GET['id'] ?? 0;
    $stmt = $conn->prepare("DELETE FROM burial_records WHERE id = ?");
    $stmt->bind_param("i", $id);
    
    if ($stmt->execute()) {
        echo json_encode(["status" => "deleted"]);
    } else {
        echo json_encode(["status" => "error"]);
    }
    exit;
}
?>