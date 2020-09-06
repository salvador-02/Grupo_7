-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2020 a las 21:50:11
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gamer_zone_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id`, `name`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Razer', '2020-07-15 12:02:54', NULL, NULL),
(2, 'Logitech', '2020-07-15 12:02:54', NULL, NULL),
(3, 'Corsair', '2020-07-15 12:02:54', NULL, NULL),
(4, 'HyperX', '2020-07-15 12:02:54', NULL, NULL),
(5, 'Redragon', '2020-07-15 12:02:54', NULL, NULL),
(6, 'Acer', '2020-07-15 12:02:54', NULL, NULL),
(7, 'BenQ', '2020-07-15 12:02:54', NULL, NULL),
(8, 'ViewSonic', '2020-07-15 12:02:54', NULL, NULL),
(9, 'MSI', '2020-07-15 12:02:54', NULL, NULL),
(10, 'LG', '2020-07-15 12:02:54', NULL, NULL),
(11, 'Sentey', '2020-07-15 12:02:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL,
  `orderNumber` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `orderNumber`, `total`, `userId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(7, 1000, '7540.00', 42, '2020-08-31 14:15:02', '2020-08-31 14:15:02', NULL),
(8, 1001, '26777.00', 42, '2020-08-31 14:30:33', '2020-08-31 14:30:33', NULL),
(9, 1002, '7539.50', 42, '2020-09-01 02:52:42', '2020-09-01 02:52:42', NULL),
(10, 1003, '13974.50', 44, '2020-09-02 17:42:44', '2020-09-02 17:42:44', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Mouse', NULL, '2020-07-15 12:06:52', NULL, NULL),
(2, 'Teclado', NULL, '2020-07-15 12:06:52', NULL, NULL),
(3, 'Auricular', NULL, '2020-07-15 12:06:52', NULL, NULL),
(4, 'Monitor', NULL, '2020-07-15 12:06:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `cartId` int(11) DEFAULT NULL,
  `state` tinyint(4) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `totalPrice` decimal(8,2) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `quantity`, `userId`, `cartId`, `state`, `price`, `totalPrice`, `createdAt`, `updatedAt`, `deletedAt`, `name`, `img`) VALUES
(34, 1, 42, 7, 0, '7540.00', '7540.00', '2020-08-31 14:15:00', '2020-08-31 14:15:02', NULL, 'Mouse Razer Basilisk classic black', 'product_6.jpg'),
(35, 1, 42, 8, 0, '7540.00', '7540.00', '2020-08-31 14:22:39', '2020-08-31 14:30:33', NULL, 'Mouse Razer Basilisk classic black', 'product_6.jpg'),
(36, 1, 42, 8, 0, '19237.00', '19237.00', '2020-08-31 14:30:27', '2020-08-31 14:30:33', NULL, 'Teclado HyperX Alloy FPS Kailh Silver Speed negro RGB', 'product_15.jpg'),
(44, 1, 42, 9, 0, '7539.50', '7539.50', '2020-09-01 02:52:30', '2020-09-01 02:52:42', NULL, 'Mouse Razer Basilisk classic black', 'product_6.jpg'),
(54, 1, 44, 10, 0, '7539.50', '7539.50', '2020-09-02 17:42:39', '2020-09-02 17:42:44', NULL, 'Mouse Razer Basilisk classic black', 'product_6.jpg'),
(55, 1, 44, 10, 0, '6435.00', '6435.00', '2020-09-02 17:42:43', '2020-09-02 17:42:44', NULL, 'Mouse Logitech Lightspeed G Series G305 black', 'product_8.jpg'),
(59, 1, 45, NULL, 1, '4080.00', '4080.00', '2020-09-06 19:31:59', '2020-09-06 19:31:59', NULL, 'Mouse Razer Basilisk classic black          ', 'product_6.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `categoryId` int(6) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `brandId` tinyint(4) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `categoryId`, `price`, `brandId`, `img`, `stock`, `descuento`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(57, 'Mouse Razer Basilisk classic black          ', 'El mouse de juego te ofrecerá la posibilidad de marcar la diferencia y sacar ventajas en tus partidas. Su conectividad y sensor suave ayudará a que te desplaces rápido por la pantalla. Además, su sistema de detección de movimiento óptico te permitirá mover el cursor de una manera más precisa y sensible que en los sistemas tradicionales. Con sus 8 botones podrás tener mayor control e independencia para ejecutar.', 1, '4800.00', 1, 'product_6.jpg', 6, 15, '2020-07-15 12:02:33', '2020-09-04 16:12:06', NULL),
(59, 'Mouse Logitech Lightspeed G Series G305 black ', 'El mouse de juego te ofrecerá la posibilidad de marcar la diferencia y sacar ventajas en tus partidas. Su conectividad y sensor suave ayudará a que te desplaces rápido por la pantalla. Además, su sistema de detección de movimiento óptico te permitirá mover el cursor de una manera más precisa y sensible que en los sistemas tradicionales. Con sus 6 botones podrás tener mayor control e independencia para ejecutar.', 1, '5150.00', 1, 'product_8.jpg', 8, 10, '2020-07-15 12:02:33', '2020-09-02 17:45:09', NULL),
(60, 'Mouse Corsair Glaive Gaming negro', 'El mouse de juego te ofrecerá la posibilidad de marcar la diferencia y sacar ventajas en tus partidas. Su conectividad y sensor suave ayudará a que te desplaces rápido por la pantalla. Además, su sistema de detección de movimiento óptico te permitirá mover el cursor de una manera más precisa y sensible que en los sistemas tradicionales. Con sus 6 botones podrás tener mayor control e independencia para ejecutar.', 1, '16500.00', 1, 'product_9.jpg', 9, 25, '2020-07-15 12:02:33', NULL, NULL),
(61, 'Mouse HyperX FPS Pro Pulsefire negro', 'El mouse de juego te ofrecerá la posibilidad de marcar la diferencia y sacar ventajas en tus partidas. Su conectividad y sensor suave ayudará a que te desplaces rápido por la pantalla. Además, su sistema de detección de movimiento óptico te permitirá mover el cursor de una manera más precisa y sensible que en los sistemas tradicionales. Con sus 6 botones podrás tener mayor control e independencia para ejecutar.', 1, '6149.00', 1, 'product_10.jpg', 10, 20, '2020-07-15 12:02:33', NULL, NULL),
(62, 'Teclado Corsair K68 Cherry MX Red negro RGB', 'Este teclado Corsair de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '18700.00', 1, 'product_11.jpg', 11, 50, '2020-07-15 12:02:33', NULL, NULL),
(63, 'Teclado Logitech Serie Pro G Pro Romer-G Tactile negro RGB ', 'Este teclado Logitech de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '19999.00', 1, 'product_12.jpg', 12, 40, '2020-07-15 12:02:33', '2020-08-05 22:27:20', NULL),
(64, 'Teclado Logitech Serie G G513 GX Blue negro RGB', 'Este teclado Logitech de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '17999.00', 1, 'product_13.jpg', 13, 45, '2020-07-15 12:02:33', NULL, NULL),
(65, 'Teclado Logitech Serie G G910 Orion Spark Romer-G negro RGB', 'Este teclado Logitech de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '14999.00', 1, 'product_14.jpg', 14, 10, '2020-07-15 12:02:33', NULL, NULL),
(66, 'Teclado HyperX Alloy FPS Kailh Silver Speed negro RGB', 'Este teclado HyperX de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '20249.00', 1, 'product_15.jpg', 15, 5, '2020-07-15 12:02:33', NULL, NULL),
(67, 'Teclado HyperX Alloy Elite Cherry MX Red negro con luz roja', 'Este teclado HyperX de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '20999.00', 1, 'product_16.jpg', 16, 70, '2020-07-15 12:02:33', NULL, NULL),
(68, 'Teclado Gamer Razer Blackwidow Tournament Mecánico', 'Este teclado Razer de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '11999.00', 1, 'product_17.jpg', 17, 10, '2020-07-15 12:02:33', NULL, NULL),
(69, 'Teclado Redragon Yama K550 OUTEMU Purple negro RGB', 'Este teclado Redragon de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '12999.00', 1, 'product_18.jpg', 18, 5, '2020-07-15 12:02:33', NULL, NULL),
(70, 'Teclado Logitech Serie G G413 Romer-G carbón con luz roja', 'Este teclado Logitech de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '12800.00', 1, 'product_19.jpg', 19, 0, '2020-07-15 12:02:33', NULL, NULL),
(71, 'Teclado Redragon Visnu K561 OUTEMU Blue negro con luz rainbow', 'Este teclado Redragon de alto rendimiento hará que disfrutes de horas ilimitadas de juego. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Mejorá muchísimo tu experiencia de gaming, ya seas un aficionado o todo un experto, y hacé que tus jugadas alcancen otro nivel.', 2, '7199.00', 1, 'product_20.jpg', 20, 10, '2020-07-15 12:02:33', NULL, NULL),
(72, 'Auriculares Logitech G Series G935 black y blue light', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los Logitech G935 vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '21900.00', 1, 'product_21.jpg', 21, 50, '2020-07-15 12:02:33', NULL, NULL),
(73, 'Auriculares Logitech G Pro negro', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los Logitech G Pro vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '16969.00', 1, 'product_22.jpg', 22, 0, '2020-07-15 12:02:33', NULL, NULL),
(74, 'Auriculares HyperX Cloud Flight', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los HyperX Cloud Flight vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '16799.00', 1, 'product_23.jpg', 23, 10, '2020-07-15 12:02:33', NULL, NULL),
(75, 'Auriculares Logitech G Series G533 negro', 'En la calle, en el colectivo o en la oficina, tené siempre a mano tus auriculares Logitech y ¡escapate de la rutina por un rato! Vas a poder disfrutar de la música que más te gusta y de tus podcasts favoritos cuando quieras y donde quieras.', 3, '14999.00', 1, 'product_24.jpg', 24, 25, '2020-07-15 12:02:33', NULL, NULL),
(76, 'Auriculares Razer Kraken Pro V2 quartz pink', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los Razer Kraken Pro V2 vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '14998.00', 1, 'product_25.jpg', 25, 15, '2020-07-15 12:02:33', NULL, NULL),
(77, 'Auriculares Logitech G Series G635 black y rgb light', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los Logitech G635 vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '14989.00', 1, 'product_26.jpg', 26, 0, '2020-07-15 12:02:33', NULL, NULL),
(78, 'Auriculares HyperX Cloud Revolver S gris metalizado', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los HyperX Cloud Revolver S vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '14269.00', 1, 'product_27.jpg', 27, 60, '2020-07-15 12:02:33', NULL, NULL),
(79, 'Auriculares HyperX Cloud Alpha S blue', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los HyperX Cloud Alpha S vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '13500.00', 1, 'product_28.jpg', 28, 15, '2020-07-15 12:02:33', NULL, NULL),
(80, 'Auriculares HyperX Cloud Alpha red', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los HyperX Cloud Alpha vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '12599.00', 1, 'product_29.jpg', 29, 10, '2020-07-15 12:02:33', NULL, NULL),
(81, 'Auriculares HyperX Cloud II red', '¡Experimentá la adrenalina de sumergirte en la escena de otra manera! Tener auriculares específicos para jugar cambia completamente tu experiencia en cada partida. Con los HyperX Cloud II vas a poder escuchar el audio tal y como fue diseñado por los creadores.', 3, '17996.22', 1, 'product_30.jpg', 30, 5, '2020-07-15 12:02:33', NULL, NULL),
(82, 'Monitor Acer Predator XB241H led 24', 'Sus 24 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '118379.00', 1, 'product_31.jpg', 31, 50, '2020-07-15 12:02:33', NULL, NULL),
(83, 'Monitor BenQ XL Series XL2546 led 24.5 gris oscuro 110V/220V', 'Sus 24.5 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '113799.00', 1, 'product_32.jpg', 32, 50, '2020-07-15 12:02:33', NULL, NULL),
(84, 'Monitor ViewSonic XG2401 led 24 negro 100V/240V', 'Sus 24 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '84999.00', 1, 'product_33.jpg', 33, 15, '2020-07-15 12:02:33', NULL, NULL),
(85, 'Monitor curvo MSI Optix MAG27C led 27 negro y rojo 100V/240V', 'Sus 27 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '82000.00', 1, 'product_34.jpg', 34, 10, '2020-07-15 12:02:33', NULL, NULL),
(86, 'Monitor Samsung U32J590UQ led 31.5 azul oscuro y gris 110V/220V', 'Sus 31.5 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 3840 x 2160 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, sus 4 milisegundos de tiempo de respuesta lo hacen ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '79995.00', 1, 'product_35.jpg', 35, 15, '2020-07-15 12:02:33', NULL, NULL),
(87, 'Monitor BenQ XL Series XL2430 LCD 24 negro 110V/220V', 'Sus 24 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '77799.00', 1, 'product_36.jpg', 36, 25, '2020-07-15 12:02:33', NULL, NULL),
(88, 'Monitor LG 27UL500 led 27 100V/240V', 'Sus 27 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 3840 x 2160 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, sus 5 milisegundos de tiempo de respuesta lo hacen ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '68989.00', 1, 'product_37.jpg', 37, 25, '2020-07-15 12:02:33', NULL, NULL),
(89, 'Monitor curvo MSI Optix MAG24C led 23.6 negro 110V/220V', 'Sus 23.6 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '68000.00', 1, 'product_38.jpg', 38, 5, '2020-07-15 12:02:33', NULL, NULL),
(90, 'Monitor BenQ XL Series XL2411P LCD 24 negro 110V/220V', 'Sus 24 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '66799.00', 1, 'product_39.jpg', 39, 10, '2020-07-15 12:02:33', NULL, NULL),
(91, 'Monitor curvo Sentey MS-2711 led 27 negro y gris 110V/220V', 'Sus 27 te resultarán de gran comodidad para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 píxeles te permitirá disfrutar de momentos únicos gracias a una imagen con gran nitidez. Por último, su tiempo de respuesta de un milisegundo lo hace ideal para gamers y cinéfilos porque será capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.', 4, '59999.00', 1, 'product_40.jpg', 40, 20, '2020-07-15 12:02:33', NULL, NULL),
(94, 'Monitor curvo de 24’’ y 144Hz con FreeSync y un tiempo de respuesta de 1ms', 'Gracias a su pantalla curva envolvente,el VX2458-C-mhd de ViewSonic ofrece una experiencia de visualización única, tanto para trabajar como para jugar. El monitor se ha diseñado con una curva 1800R y una cobertura del 85 % en la gama de colores NTSC para recrear el equilibrio perfecto entre comodidad e inmersión. La rápida frecuencia de actualización de 144Hz garantiza unas animaciones fluidas con un retraso de entrada mínimo mientras que el AMD FreeSync™ elimina prácticamente por completo el «screen tearing» (las imágenes partidas) y el retraso de fotogramas, para ofrecer una experiencia de juego fluida. El bajo retraso de entrada (Low Input Lag) en el monitor ofrece a los usuarios una experiencia de visualización sin interrupciones. El VX2458-C-mhd también cuenta con la exclusiva configuración ViewMode™ de ViewSonic, que garantiza un rendimiento de la pantalla optimizado para diferentes ambientes de entretenimiento, como ver películas, editar archivos o jugar a videojuegos. DisplayPort, los puertos HDMI y una entrada DVI ofrecen una conectividad flexible para un uso y ocio general.', 4, '54.46', 4, 'img-1596737801450.jpg', 12, 15, '2020-08-06 18:16:41', '2020-08-06 18:16:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `rol` tinyint(4) DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `lastname`, `rol`, `createdAt`, `updatedAt`, `deletedAt`, `image`) VALUES
(42, 'Lucasr1294', 'lucasrossetto12@gmail.com', '$2a$10$rufdWPlC2A6z5MR7ttKpSOxFag0L.iIwrAPHgtEbFER5B3/lW3rp6', 'Lucas', 'Rossetto', 1, '2020-07-30 03:27:19', '2020-08-03 11:51:11', NULL, 'avatar-1596079639757.jpg'),
(43, 'fede1122', 'fedeb@gmail.com', '$2a$10$3J5Dm7dwV/ZMUeDzcxFQbOXO1GHKjUeeH0qU1Gcj/9GKQi5zCmIE6', 'Federico', 'Blach', 0, '2020-08-05 14:47:33', '2020-08-05 20:27:13', NULL, 'avatar-1596659233822.png'),
(44, 'Adri1294', 'afarquitecta@gmail.com', '$2a$10$3EyNXjroKYvKo258rT0l/eMOYeOu4/v1xAOuayGrTh8VN3QZ8e2dO', 'Adriana', 'Fernandez', 0, '2020-09-02 17:42:18', '2020-09-02 17:42:18', NULL, 'avatar-1599068538463.jpg'),
(45, 'Fer12', 'fer12@gmail.com', '$2a$10$yM3b4ypVRhwN7Ee.LePhSuHXeZ5SWloPpxnUXXdAv8zsb.DioY0vy', 'Fernando', 'Pedroza', 0, '2020-09-06 19:30:24', '2020-09-06 19:30:24', NULL, 'avatar-1599420624177.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
