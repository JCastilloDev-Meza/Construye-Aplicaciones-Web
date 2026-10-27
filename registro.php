<?php
require "conexion.php";
$mensaje = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
$nombre = trim($_POST["nombre"]);
$correo = trim($_POST["correo"]);
$clave = $_POST["clave"];

if ($nombre === "" ||
!filter_var($correo, FILTER_VALIDATE_EMAIL) ||
strlen($clave) < 8) {
$mensaje = "Verifica tus datos (mínimo 8 caracteres de contraseña)";
} else {
try {
$sql = "INSERT INTO usuarios
(nombre,correo,contrasena)
VALUES (?,?,?)";
$stmt = $conexion->prepare($sql);
$stmt->execute([
$nombre,
$correo,
password_hash($clave, PASSWORD_DEFAULT)
]);
header("Location: login.php");
exit;
} catch (PDOException $e) {
$mensaje = "No se pudo registrar el correo";
}
}
}
?>
<link rel="stylesheet" href="estilos.css">
<h1>ATLAS FC SHOP - Registro</h1>
<p><?= htmlspecialchars($mensaje) ?></p>
<form method="POST">
<input name="nombre" placeholder="Nombre" required>
<input type="email" name="correo"
placeholder="Correo" required>
<input type="password" name="clave"
placeholder="Contraseña"
minlength="8" required>
<button>Registrarse</button>
</form>
<a href="login.php">Iniciar sesión</a>