-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2026 a las 19:10:17
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `urban_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `producto_id`, `cantidad`, `direccion`, `fecha`) VALUES
(1, 1, 2, 1, 'juan pablo ll', '2026-10-27 17:16:07'),
(2, 2, 6, 1, 'juan pablo ll', '2026-10-27 17:22:45'),
(3, 1, 3, 1, 'juan pablo ll', '2026-10-27 17:33:08'),
(4, 5, 21, 1, 'revolucion mexicana', '2026-11-03 17:53:17'),
(5, 5, 21, 1, 'revolucion mexicana', '2026-11-03 18:02:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `marca`, `nombre`, `precio`) VALUES
(1, 'Ropa', 'Nike', 'Sudadera Nike', '850.00'),
(2, 'Ropa', 'Adidas', 'Playera Adidas', '450.00'),
(3, 'Cosméticos', 'Maybelline', 'Labial', '180.00'),
(4, 'Cosméticos', 'L’Oréal', 'Base de maquillaje', '320.00'),
(5, 'Calzado', 'Nike', 'Tenis Nike', '1599.00'),
(6, 'Calzado', 'Adidas', 'Tenis Adidas', '1299.00'),
(7, 'Celulares', 'Samsung', 'Samsung Galaxy', '5999.00'),
(8, 'Celulares', 'Apple', 'iPhone', '12999.00'),
(9, 'Ropa', 'Nike', 'Sudadera Nike', '850.00'),
(10, 'Ropa', 'Adidas', 'Playera Adidas', '450.00'),
(11, 'Ropa', 'Puma', 'Pantalón deportivo', '650.00'),
(12, 'Ropa', 'Levis', 'Jeans clásicos', '899.00'),
(13, 'Ropa', 'Zara', 'Camisa casual', '599.00'),
(14, 'Ropa', 'H&M', 'Playera básica', '249.00'),
(15, 'Ropa', 'Nike', 'Short deportivo', '399.00'),
(16, 'Ropa', 'Adidas', 'Chamarra', '1199.00'),
(17, 'Ropa', 'Puma', 'Conjunto deportivo', '999.00'),
(18, 'Ropa', 'Zara', 'Suéter', '749.00'),
(19, 'Cosméticos', 'Maybelline', 'Labial', '180.00'),
(20, 'Cosméticos', 'Loreal', 'Base de maquillaje', '320.00'),
(21, 'Cosméticos', 'Revlon', 'Rubor', '220.00'),
(22, 'Cosméticos', 'NYX', 'Delineador', '199.00'),
(23, 'Cosméticos', 'Maybelline', 'Máscara de pestañas', '250.00'),
(24, 'Cosméticos', 'Loreal', 'Corrector', '280.00'),
(25, 'Cosméticos', 'Revlon', 'Polvo compacto', '290.00'),
(26, 'Cosméticos', 'NYX', 'Paleta de sombras', '450.00'),
(27, 'Cosméticos', 'Maybelline', 'Brillo labial', '160.00'),
(28, 'Cosméticos', 'Loreal', 'Iluminador', '350.00'),
(29, 'Calzado', 'Nike', 'Air Max', '1899.00'),
(30, 'Calzado', 'Adidas', 'Superstar', '1599.00'),
(31, 'Calzado', 'Puma', 'Suede', '1299.00'),
(32, 'Calzado', 'Converse', 'Chuck Taylor', '1199.00'),
(33, 'Calzado', 'Vans', 'Old Skool', '1399.00'),
(34, 'Calzado', 'Nike', 'Court Vision', '1499.00'),
(35, 'Calzado', 'Adidas', 'Runfalcon', '1299.00'),
(36, 'Calzado', 'Puma', 'Smash', '1099.00'),
(37, 'Calzado', 'Converse', 'Run Star', '1899.00'),
(38, 'Calzado', 'Vans', 'Authentic', '1199.00'),
(39, 'Celulares', 'Apple', 'iPhone 13', '8999.00'),
(40, 'Celulares', 'Samsung', 'Galaxy A15', '3999.00'),
(41, 'Celulares', 'Motorola', 'Moto G54', '4499.00'),
(42, 'Celulares', 'Xiaomi', 'Redmi Note 13', '4999.00'),
(43, 'Celulares', 'Apple', 'iPhone 14', '10999.00'),
(44, 'Celulares', 'Samsung', 'Galaxy S23', '12999.00'),
(45, 'Celulares', 'Motorola', 'Edge 40', '7999.00'),
(46, 'Celulares', 'Xiaomi', 'Redmi 13C', '2999.00'),
(47, 'Celulares', 'Apple', 'iPhone 15', '13999.00'),
(48, 'Celulares', 'Samsung', 'Galaxy A55', '7499.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`) VALUES
(1, 'jesus ortiz', 'jesusgarcia@gmail.com', '$2y$10$4hQoaHJus739xQKvhg.Ox.OPu7iDKCg9EAfOwnt2ZcoWHJgngNlZ2'),
(2, 'Carlkos', 'cgmagallanes23@gmail.com', '$2y$10$TvBcOEN.Dp9aUf60hRuO2u2Gl7EZnF8VYaCLcVF9IuPUcpuVSXXKu'),
(4, 'magazo', 'jesusgarza@gmail.com', '$2y$10$Y9Lw4t886kmJ1Oq9CSaGSe5pM5Wc48jRCP3IfodL1nRRqrzMMONkK'),
(5, 'jared', 'jaredcs959@gmail.com', '$2y$10$UZQ8.CUoLWKJnSfAV4KRxOg5.mzisvQDBkke8SWWUKTiKIMg9yXMS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
