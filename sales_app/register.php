<?php
// Include database connection file
include_once("db_connect.php");

// Get the POST data
$name = $_POST['name'];
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];


// Check if the username or email already exists
$query = "SELECT * FROM users WHERE username='$username' OR email='$email'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    // User already exists
    echo json_encode(array("success" => false, "message" => "Username or email already exists"));
} else {
    // Insert new user into the database
    $query = "INSERT INTO users (name,username, password, email, Status,type) VALUES ('$name','$username', '$password', '$email','0','admin')";
    if (mysqli_query($conn, $query)) {
        // User registered successfully
        echo json_encode(array("success" => true, "message" => "User registered successfully"));
    } else {
        // Error registering user
        echo json_encode(array("success" => false, "message" => "Error registering user"));
    }
}
?>
