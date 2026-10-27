<?php
try {
$conexion = new PDO(
"mysql:host=localhost;dbname=urban_shop;charset=utf8mb4",
"root",
"",
[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
);
} catch (PDOException $e) {
exit("Error de conexión con MySQL");
}
?>