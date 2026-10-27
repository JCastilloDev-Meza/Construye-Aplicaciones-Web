<?php
session_start();
require "conexion.php";
$mensaje = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
$stmt = $conexion->prepare(
"SELECT * FROM usuarios WHERE correo=?"
);
$stmt->execute([$_POST["correo"]]);
$usuario = $stmt->fetch(PDO::FETCH_ASSOC);

if ($usuario && password_verify(
$_POST["clave"], $usuario["contrasena"]
)) {
session_regenerate_id(true);
$_SESSION["usuario_id"] = $usuario["id"];
$_SESSION["nombre"] = $usuario["nombre"];
header("Location: tienda.php");
exit;
}
$mensaje = "Datos incorrectos";
}
?>
<link rel="stylesheet" href="estilos.css">
<h1>Iniciar sesión</h1>
<p><?= htmlspecialchars($mensaje) ?></p>
<form method="POST">
<input type="email" name="correo"
placeholder="Correo" required>
<input type="password" name="clave"
placeholder="Contraseña" required>
<button>Ingresar</button>
</form>
<a href="registro.php">Crear cuenta</a>

