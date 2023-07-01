-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.14-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para admonti
CREATE DATABASE IF NOT EXISTS `admonti` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `admonti`;


-- Volcando estructura para tabla admonti.componente
CREATE TABLE IF NOT EXISTS `componente` (
  `id_componente` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_comp` varchar(30) NOT NULL,
  `etiqueta` varchar(50) DEFAULT NULL,
  `serial` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `ubicacion` int(3) NOT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `so` varchar(50) DEFAULT NULL,
  `almacenamiento` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `observacion` varchar(100) NOT NULL,
  `cant_inicio` int(3) NOT NULL,
  `cant_disp` int(3) NOT NULL,
  `categoria` int(3) NOT NULL,
  `id_gab` int(3) NOT NULL,
  PRIMARY KEY (`id_componente`),
  KEY `tipo` (`categoria`),
  KEY `id_gab` (`id_gab`),
  KEY `ubicacion` (`ubicacion`),
  CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `tipoc` (`id_tipo`),
  CONSTRAINT `componente_ibfk_2` FOREIGN KEY (`id_gab`) REFERENCES `gabinete` (`id_gabinete`),
  CONSTRAINT `componente_ibfk_3` FOREIGN KEY (`ubicacion`) REFERENCES `sucursal` (`id_suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `user_emp` varchar(30) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `nombre_empleado` varchar(30) NOT NULL,
  `apellido_emp` varchar(30) NOT NULL,
  `permiso` int(2) NOT NULL,
  PRIMARY KEY (`user_emp`),
  UNIQUE KEY `user_emp` (`user_emp`),
  KEY `permiso` (`permiso`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id_est` int(1) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.gabinete
CREATE TABLE IF NOT EXISTS `gabinete` (
  `id_gabinete` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_gab` varchar(30) NOT NULL,
  PRIMARY KEY (`id_gabinete`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.ocupacion
CREATE TABLE IF NOT EXISTS `ocupacion` (
  `id_ocupacion` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_ocup` varchar(30) NOT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `id_permiso` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_permiso` varchar(20) NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.prestacomp
CREATE TABLE IF NOT EXISTS `prestacomp` (
  `id_prest` int(3) NOT NULL,
  `id_comp` int(3) NOT NULL,
  `cantidad` int(3) NOT NULL,
  PRIMARY KEY (`id_prest`,`id_comp`),
  KEY `id_comp` (`id_comp`),
  CONSTRAINT `prestacomp_ibfk_1` FOREIGN KEY (`id_prest`) REFERENCES `prestamo` (`id_prestamo`),
  CONSTRAINT `prestacomp_ibfk_2` FOREIGN KEY (`id_comp`) REFERENCES `componente` (`id_componente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.prestamo
CREATE TABLE IF NOT EXISTS `prestamo` (
  `id_prestamo` int(3) NOT NULL AUTO_INCREMENT,
  `fecha_out` date DEFAULT '0000-00-00',
  `fecha_in` date DEFAULT '0000-00-00',
  `estado_pres` int(1) NOT NULL,
  `id_usuario` int(3) NOT NULL,
  `empleado` varchar(30) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `estado_pres` (`estado_pres`),
  KEY `id_usuario` (`id_usuario`),
  KEY `empleado` (`empleado`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`estado_pres`) REFERENCES `estado` (`id_est`),
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `prestamo_ibfk_3` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`user_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.puesto
CREATE TABLE IF NOT EXISTS `puesto` (
  `id_car` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_car` varchar(30) NOT NULL,
  PRIMARY KEY (`id_car`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.sucursal
CREATE TABLE IF NOT EXISTS `sucursal` (
  `id_suc` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_suc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.tipoc
CREATE TABLE IF NOT EXISTS `tipoc` (
  `id_tipo` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla admonti.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(3) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `apellido_usuario` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `ocup_usuario` int(2) NOT NULL,
  `id_div` int(2) NOT NULL,
  `id_car` int(2) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  KEY `ocup_usuario` (`ocup_usuario`),
  KEY `id_div` (`id_div`),
  KEY `id_car` (`id_car`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ocup_usuario`) REFERENCES `ocupacion` (`id_ocupacion`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_div`) REFERENCES `sucursal` (`id_suc`),
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`id_car`) REFERENCES `puesto` (`id_car`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
