-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2020 a las 22:46:09
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planifi_materias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(40) COLLATE utf8_bin NOT NULL,
  `area` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_doc` int(11) NOT NULL,
  `Nombre_doc` varchar(60) COLLATE utf8_bin NOT NULL,
  `area_doc` varchar(40) COLLATE utf8_bin NOT NULL,
  `Profesion` varchar(60) COLLATE utf8_bin NOT NULL,
  `rama` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilitar_materias`
--

CREATE TABLE `habilitar_materias` (
  `id_materia` varchar(12) COLLATE utf8_bin NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_doc` int(11) NOT NULL,
  `turno` varchar(7) COLLATE utf8_bin NOT NULL,
  `aula` varchar(6) COLLATE utf8_bin NOT NULL,
  `num_Reporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` varchar(12) COLLATE utf8_bin NOT NULL,
  `Nombre` varchar(40) COLLATE utf8_bin NOT NULL,
  `Carrera` varchar(40) COLLATE utf8_bin NOT NULL,
  `Rama` varchar(40) COLLATE utf8_bin NOT NULL,
  `Semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL,
  `Mes_modulo` varchar(15) COLLATE utf8_bin NOT NULL,
  `anio_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `num_reporte` int(11) NOT NULL,
  `cant_clases` int(11) NOT NULL,
  `Proyecto` varchar(200) COLLATE utf8_bin NOT NULL,
  `cant_alumnos` int(11) NOT NULL,
  `Observaciones` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD UNIQUE KEY `nombre_carrera` (`nombre_carrera`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_doc`);

--
-- Indices de la tabla `habilitar_materias`
--
ALTER TABLE `habilitar_materias`
  ADD UNIQUE KEY `num_Reporte` (`num_Reporte`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_modulo` (`id_modulo`),
  ADD KEY `id_doc` (`id_doc`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `Carrera` (`Carrera`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`num_reporte`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `num_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `habilitar_materias`
--
ALTER TABLE `habilitar_materias`
  ADD CONSTRAINT `habilitar_materias_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  ADD CONSTRAINT `habilitar_materias_ibfk_2` FOREIGN KEY (`id_doc`) REFERENCES `docentes` (`id_doc`),
  ADD CONSTRAINT `habilitar_materias_ibfk_3` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`nombre_carrera`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`num_reporte`) REFERENCES `habilitar_materias` (`num_Reporte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
