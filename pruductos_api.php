<?php
require "conexion.php";

header("Content-Type: application/json; charset=utf-8");

$categoria = $_GET["categoria"] ?? "";

$permitidas = [
"Ropa",
"Cosméticos",
"Calzado",
"Celulares"
];

if (!in_array($categoria, $permitidas, true)) {
http_response_code(400);
echo json_encode(["error" => "Categoría inválida"]);
exit;
}

$stmt = $conexion->prepare(
"SELECT id, nombre, marca, precio
FROM productos
WHERE categoria = ?
ORDER BY id"
);

$stmt->execute([$categoria]);

echo json_encode(
$stmt->fetchAll(PDO::FETCH_ASSOC),
JSON_UNESCAPED_UNICODE
);
?>

