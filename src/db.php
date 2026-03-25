<?php
$host = "db";
$user = "agricoltore";
$password = "nicolone";
$database = "azienda";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Errore connessione: " . $conn->connect_error);
}
?>
