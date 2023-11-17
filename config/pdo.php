<?php 
//database connection
$dsn = 'mysql:host=localhost;port=3301;dbname=sys';
$username = 'root';
$password = '';

try {
    $conn = new PDO($dsn, $username, $password);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}