<?php
session_start();
require "conexion.php";

if (!isset($_SESSION["usuario_id"])) {
header("Location: login.php");
exit;
}

$mensaje = "";
$productos = $conexion->query(
"SELECT * FROM productos ORDER BY categoria,marca"
)->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER["REQUEST_METHOD"] === "POST") {
$id = filter_input(
INPUT_POST, "producto", FILTER_VALIDATE_INT
);
$cantidad = filter_input(
INPUT_POST, "cantidad", FILTER_VALIDATE_INT
);
$direccion = trim($_POST["direccion"] ?? "");

$stmt = $conexion->prepare(
"SELECT id FROM productos WHERE id=?"
);
$stmt->execute([$id]);

if ($stmt->fetch() && $cantidad > 0 &&
$direccion !== "") {
$stmt = $conexion->prepare(
"INSERT INTO pedidos
(usuario_id,producto_id,cantidad,direccion)
VALUES (?,?,?,?)"
);
$stmt->execute([
$_SESSION["usuario_id"],
$id,
$cantidad,
$direccion
]);
$mensaje = "¡Pedido registrado!";
} else {
$mensaje = "Revisa los datos del pedido";
}
}
?>
<link rel="stylesheet" href="estilos.css">

<h1>ATLAS FC SHOP</h1>
<h2>Bienvenido,
<?= htmlspecialchars($_SESSION["nombre"]) ?>
</h2>

<h2>Catálogo y formulario de compra</h2>
<p><?= htmlspecialchars($mensaje) ?></p>

<form method="POST">
<label>Selecciona una marca y producto</label>
<select name="producto" required>
<?php foreach ($productos as $p): ?>
<option value="<?= $p["id"] ?>">
<?= htmlspecialchars(
$p["categoria"]." - ".
$p["marca"]." - ".$p["nombre"]
) ?>
- $<?= $p["precio"] ?>
</option>
<?php endforeach; ?>
</select>

<label>Cantidad</label>
<input type="number" name="cantidad"
min="1" value="1" required>

<label>Dirección de entrega</label>
<input name="direccion"
placeholder="Dirección" required>

<button type="submit">Realizar pedido</button>
</form>

<a href="logout.php">Cerrar sesión</a>

