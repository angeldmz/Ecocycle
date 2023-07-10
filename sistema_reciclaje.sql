-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2023 a las 09:11:28
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_reciclaje`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desechostecnologicos`
--

CREATE TABLE `desechostecnologicos` (
  `ClaveD` int NOT NULL,
  `NombreD` varchar(255) DEFAULT NULL,
  `Peso` double DEFAULT NULL,
  `Marca` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `Modelo` varchar(255) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Estatus` varchar(255) DEFAULT NULL,
  `NumeroRegistro` int DEFAULT NULL,
  `IdRecoleccion` int DEFAULT NULL,
  `Estado` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacionenvio`
--

CREATE TABLE `programacionenvio` (
  `ClaveEnvio` int NOT NULL,
  `ClaveRec` int DEFAULT NULL,
  `ClaveU` int NOT NULL,
  `Costo` double DEFAULT NULL,
  `PersonaRecibe` varchar(30) DEFAULT NULL,
  `Fecha_Envio` date NOT NULL,
  `PesoEnviado` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recolectoras`
--

CREATE TABLE `recolectoras` (
  `ClaveR` int NOT NULL,
  `NombreR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Ciudad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Responsable` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrocliente`
--

CREATE TABLE `registrocliente` (
  `ClaveRC` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Kms_distancia` double DEFAULT NULL,
  `ClaveD` int DEFAULT NULL,
  `PesoReg` double DEFAULT NULL,
  `Costo` double DEFAULT NULL,
  `Estatus` int DEFAULT '1',
  `Fecha_Programada` date DEFAULT NULL,
  `ClaveRec` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrorecoleccion`
--

CREATE TABLE `registrorecoleccion` (
  `ClaveRec` int NOT NULL,
  `Fecha_registro` date DEFAULT NULL,
  `ClaveU` int DEFAULT NULL,
  `Peso_Total` double DEFAULT NULL,
  `Fecha_programada` date DEFAULT NULL,
  `NumeroClientes` int DEFAULT NULL,
  `Estatus` int DEFAULT NULL,
  `Costo_Total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tipo` int DEFAULT NULL,
  `domicilio` text,
  `telefono` varchar(15) DEFAULT NULL,
  `estatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `password`, `tipo`, `domicilio`, `telefono`, `estatus`) VALUES
(1, 'Administrador', '', 'admin123', 1, NULL, NULL, 1),
(8, 'Prueba1', 'prueba', 'aaaa', 1, 'aaaa', '23124', 1),
(12, 'Cliente123', 'admin2313', 'a', 3, 'eqweqwdsa', '423452343', 0),
(14, 'a', 'a', 'a', 3, 'a', 'a', 1),
(15, 'rec', 'rec', 'rec', 2, '32', '213', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `desechostecnologicos`
--
ALTER TABLE `desechostecnologicos`
  ADD PRIMARY KEY (`ClaveD`);

--
-- Indices de la tabla `recolectoras`
--
ALTER TABLE `recolectoras`
  ADD PRIMARY KEY (`ClaveR`);

--
-- Indices de la tabla `registrocliente`
--
ALTER TABLE `registrocliente`
  ADD PRIMARY KEY (`ClaveRC`);

--
-- Indices de la tabla `registrorecoleccion`
--
ALTER TABLE `registrorecoleccion`
  ADD PRIMARY KEY (`ClaveRec`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `desechostecnologicos`
--
ALTER TABLE `desechostecnologicos`
  MODIFY `ClaveD` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `recolectoras`
--
ALTER TABLE `recolectoras`
  MODIFY `ClaveR` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registrocliente`
--
ALTER TABLE `registrocliente`
  MODIFY `ClaveRC` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `registrorecoleccion`
--
ALTER TABLE `registrorecoleccion`
  MODIFY `ClaveRec` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
