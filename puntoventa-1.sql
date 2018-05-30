-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2018 a las 20:51:49
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `puntoventa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(30) NOT NULL,
  `correo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Adeudo_Generado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha_Visita` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Nombre`, `telefono`, `correo`, `Adeudo_Generado`, `Fecha_Visita`) VALUES
(1, 'Luis Andre Garcia Lopez', 664274104, 'luisgmail.com', '434.0', '25/02/2010'),
(2, 'Luis Andre Garcia Lopez', 664274104, 'luis@gmail.com', '488.0', '25/02/2010'),
(3, 'Juan', 646108999, 'juanito@hotmail.com', '150.0', '18/05/2018'),
(4, 'Roberto', 646108999, 'Roberto@hotmail.com', '168.0', '18/05/2018'),
(5, 'Roxy', 646108999, 'Rosario@hotmail.com', '0', '18/05/2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `RFC` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `NombreCliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `NumeroTel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `Nombre_Plato` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idMenu`, `Nombre_Plato`, `Precio`) VALUES
(2, 'Taco', 16),
(16, 'QuesaBurroHarina', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `idMesa` int(11) NOT NULL,
  `Cliente_idCliente_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `Nombre_Platillo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Total` int(11) DEFAULT NULL,
  `Cliente_idCliente_FK` int(11) NOT NULL,
  `Menu_idMenu_FK` int(11) NOT NULL,
  `Mesa_idMesa_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `precio` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `descripcion`, `precio`, `cantidad`) VALUES
('001', 'Carne Res', '250 c/kg', '10'),
('002', 'Tomate', '12 c/kg', '12'),
('12', 'Cocacola', '12', '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `intentos` int(11) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id`, `username`, `password`, `intentos`, `fecha`) VALUES
(1, 'AndresG', 'anteeksi69', 1, '2018-05-23 01:43:26'),
(2, 'DiegoG', 'DiegoG', 0, '2018-05-23 02:05:18'),
(3, 'SergioG', 'SergioG', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVentas` int(11) NOT NULL,
  `Producto_Vendido` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Perecio_Total` int(11) DEFAULT NULL,
  `Menu_idMenu_FK` int(11) NOT NULL,
  `Menu_idMenu1_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`RFC`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`idMesa`,`Cliente_idCliente_FK`),
  ADD KEY `fk_Mesa_Cliente1_idx` (`Cliente_idCliente_FK`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`,`Cliente_idCliente_FK`,`Menu_idMenu_FK`,`Mesa_idMesa_FK`),
  ADD KEY `fk_Orden_Cliente1_idx` (`Cliente_idCliente_FK`),
  ADD KEY `fk_Orden_Menu1_idx` (`Menu_idMenu_FK`),
  ADD KEY `fk_Orden_Mesa1_idx` (`Mesa_idMesa_FK`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVentas`,`Menu_idMenu_FK`,`Menu_idMenu1_FK`),
  ADD KEY `fk_Ventas_Menu1_idx` (`Menu_idMenu1_FK`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `fk_Mesa_Cliente1` FOREIGN KEY (`Cliente_idCliente_FK`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_Orden_Cliente1` FOREIGN KEY (`Cliente_idCliente_FK`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orden_Menu1` FOREIGN KEY (`Menu_idMenu_FK`) REFERENCES `menu` (`idMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orden_Mesa1` FOREIGN KEY (`Mesa_idMesa_FK`) REFERENCES `mesa` (`idMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_Ventas_Menu1` FOREIGN KEY (`Menu_idMenu1_FK`) REFERENCES `menu` (`idMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
