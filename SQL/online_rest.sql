-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2020 a las 06:17:46
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `online_rest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(6, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin@gmail.com', '', '2018-04-09 07:36:18'),
(8, 'abc888', '6d0361d5777656072438f6e314a852bc', 'abc@gmail.com', 'QX5ZMN', '2018-04-13 18:12:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_codes`
--

CREATE TABLE `admin_codes` (
  `id` int(222) NOT NULL,
  `codes` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin_codes`
--

INSERT INTO `admin_codes` (`id`, `codes`) VALUES
(1, 'QX5ZMN'),
(2, 'QFE6ZM'),
(3, 'QMZR92'),
(4, 'QPGIOV'),
(5, 'QSTE52'),
(6, 'QMTZ2J');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(11, 48, 'Pan con Chicharron', 'Desayuno tradicional peruano', '7.50', '5fd436d3adc5f.jpg'),
(12, 48, 'Pan con Torreja', 'Un desayuno llenador', '4.50', '5fd437b4b4194.jpg'),
(13, 49, 'Chicharron de chancho', 'Panceta de cerdo crujiente con papas y ensalada criolla', '24.35', '5fd433252c2e7.jpg'),
(14, 55, 'Rocoto relleno', 'Plato tipico Arequipeño', '24.99', '5fd43675c1bbf.jpg'),
(15, 51, 'Lyfe Kitchens Tofu Taco', 'This chain, known for a wide selection of vegetarian and vegan choices', '11.99', '5ad75a1869e93.jpg'),
(16, 49, 'Adobo', 'Pidalo solo los domingos', '22.55', '5fd432c30f08f.jpg'),
(17, 53, '1/4 Pollo a la brasa', '1/4 de pollo a la brasa+papas+cremas+ensalada', '11.99', '5fd4326268c14.jpg'),
(18, 51, 'Tallarin Saltado', 'Tallarin saltado de carne de pollo', '8.99', '5fd433bd749b3.jpg'),
(19, 53, '1/2 Pollo a la brasa', '1/2 de pollo a la brasa+papas+cremas+ensalada', '21.99', '5fd4344518020.jpg'),
(20, 53, '1 Pollo a la brasa', '1 de pollo a la brasa+papas+cremas+ensalada', '38.99', '5fd434942ef77.jpg'),
(21, 54, 'Americano', 'Mix de platos locales', '42.00', '5fd43571e1718.jpg'),
(22, 57, 'Pollo Broaster', 'Delicioso Pollo crujiente', '18.50', '5fd435d285e8a.jpg'),
(23, 52, 'Pastel de papa', 'Almuerzo tradicional de la region', '24.90', '5fd43771f22a2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `remark`
--

INSERT INTO `remark` (`id`, `frm_id`, `status`, `remark`, `remarkDate`) VALUES
(62, 32, 'in process', 'hi', '2018-04-18 17:35:52'),
(63, 32, 'closed', 'cc', '2018-04-18 17:36:46'),
(64, 32, 'in process', 'fff', '2018-04-18 18:01:37'),
(65, 32, 'closed', 'its delv', '2018-04-18 18:08:55'),
(66, 34, 'in process', 'on a way', '2018-04-18 18:56:32'),
(67, 35, 'closed', 'ok', '2018-04-18 18:59:08'),
(68, 37, 'in process', 'on the way!', '2018-04-18 19:50:06'),
(69, 37, 'rejected', 'if admin cancel for any reason this box is for remark only for buter perposes', '2018-04-18 19:51:19'),
(70, 37, 'closed', 'delivered success', '2018-04-18 19:51:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(48, 8, 'Luchita', 'Luchita@gmail.com', ' 090412 64676', 'Luchita.com', '6am', '8pm', '24hr-x7', 'Av Asuncion 215 Cercado.', '5fd44d1e6fabe.jpg', '2020-12-12 04:54:54'),
(49, 5, 'Quequita', ' chicharronerialaquequita@gmail.com', '(054) 228380', 'https://www.facebook.com/ChicharroneriaLaQuequita/', '11am', '8pm', 'mon-sat', 'Av. Arancota B12-A Sachaca 04013 Sachaca, Peru', '5fd42f1f20e4b.jpg', '2020-12-12 02:46:55'),
(50, 5, 'Chicha', 'chicha@gmail.com', '090410 35147', 'chicha.com', '6am', '8pm', '24hr-x7', 'Cerro Colorado 215.', '5fd44db43b348.jpg', '2020-12-12 04:57:24'),
(51, 7, 'Martini', 'martin@gmail.com', '3454345654', 'martin.com', '8am', '4pm', 'mon-thu', '399 L Near Apple Showroom, Model Town,', '5ad74ebf1d103.jpg', '2018-04-18 13:57:19'),
(52, 8, 'La Mundial', 'lamundialarequipa@gmail.com', '(054) 232040', 'http://picanterialamundial.com.pe/', '9am', '8pm', 'mon-sat', 'Lucas Poblete 211, Arequipa 04001', '5fd42cbe0d745.jpg', '2020-12-12 02:36:46'),
(53, 6, 'El Pio Pio', 'elpiopio@gmail.com', '4512545784', 'https://www.facebook.com/pages/Polleria-EL-PIO-PIO/254537207941778', '11am', '8pm', 'mon-sat', 'santo domingo 210- 212 Arequipa, Perú', '5fd42b087ad7e.jpg', '2020-12-12 02:29:28'),
(54, 8, 'La Nueva Palomino', 'lanuevapalomino@gmail.com', '(054) 252393', 'https://www.facebook.com/LaNuevaPalomino/', '6am', '7pm', '24hr-x7', 'Pasaje Leoncio Prado 122 - Yanahuara 04017 Arequipa, Perú', '5fd42d6c5b3b4.jpg', '2020-12-12 02:39:40'),
(55, 8, 'La Capitana', 'lacapitanaarequipa@gmail.com', '995561976', 'https://www.facebook.com/LaCapitanaPicanteria/', '6am', '8pm', '24hr-x7', 'Calle Los Arces 209 - Antiquilla - Cayma 04013 Arequipa, Perú\r\n', '5fd42e503ca07.jpg', '2020-12-12 02:43:28'),
(56, 9, 'El tio Dario', 'alfonsoeguiluz@tiodario.com ', '+51 54 270473', 'https://www.tiodario.com/', '6am', '8pm', '24hr-x7', 'Callejón del Cabildo # 100 Yanahuara, Arequipa Perú', '5fd430b81faeb.jpg', '2020-12-12 02:53:44'),
(57, 6, 'El Tablon', 'eltablon@gmail.com', '054 -389030', 'https://www.facebook.com/eltablon.oficial/', '10am', '8pm', '24hr-x7', 'Av. Mariscal Castilla 105, Miraflores 04001', '5fd43195d063c.jpg', '2020-12-12 02:57:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(5, 'Chicharroneria', '2020-12-12 02:23:03'),
(6, 'Polleria', '2020-12-12 02:22:49'),
(7, 'Chifa', '2020-12-12 02:22:24'),
(8, 'Picanteria', '2020-12-12 02:22:01'),
(9, 'Cevicheria', '2020-12-12 02:20:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(31, 'navjot789', 'navjot', 'singh', 'ns949405@gmail.com', '9041240385', '6d0361d5777656072438f6e314a852bc', 'badri col phase 2', 1, '2018-04-18 10:05:03'),
(32, 'navjot890', 'nav', 'singh', 'nds949405@gmail.com', '6232125458', '6d0361d5777656072438f6e314a852bc', 'badri col phase 1', 1, '2018-04-18 09:50:56'),
(33, 'jose', 'Jose', 'Mejia', 'tupapi@gmail.com', '995561971', 'b4af804009cb036a4ccdc33431ef9ac9', 'Al costado del rio', 1, '2020-12-12 03:28:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(37, 31, 'jklmno', 5, '17.99', 'closed', '2018-04-18 19:51:50'),
(38, 31, 'Red Robins Chick on a Stick', 2, '34.99', NULL, '2018-04-18 19:52:34'),
(39, 33, '1/4 Pollo a la brasa', 3, '11.99', NULL, '2020-12-12 05:00:42'),
(40, 33, '1/4 Pollo a la brasa', 3, '11.99', NULL, '2020-12-12 05:04:26'),
(41, 33, 'Pollo Broaster', 1, '18.50', NULL, '2020-12-12 05:04:26'),
(42, 33, '1/4 Pollo a la brasa', 3, '11.99', NULL, '2020-12-12 05:04:48'),
(43, 33, 'Pollo Broaster', 1, '18.50', NULL, '2020-12-12 05:04:48'),
(44, 33, 'Chicharron de chancho', 1, '24.35', NULL, '2020-12-12 05:04:48'),
(45, 33, '1/4 Pollo a la brasa', 3, '11.99', NULL, '2020-12-12 05:05:06'),
(46, 33, 'Pollo Broaster', 1, '18.50', NULL, '2020-12-12 05:05:06'),
(47, 33, 'Chicharron de chancho', 1, '24.35', NULL, '2020-12-12 05:05:06'),
(48, 33, 'Rocoto relleno', 1, '24.99', NULL, '2020-12-12 05:05:06'),
(49, 33, '1/4 Pollo a la brasa', 3, '11.99', NULL, '2020-12-12 05:05:28'),
(50, 33, 'Pollo Broaster', 1, '18.50', NULL, '2020-12-12 05:05:28'),
(51, 33, 'Chicharron de chancho', 1, '24.35', NULL, '2020-12-12 05:05:28'),
(52, 33, 'Rocoto relleno', 1, '24.99', NULL, '2020-12-12 05:05:29'),
(53, 33, 'Pastel de papa', 1, '24.90', NULL, '2020-12-12 05:05:29');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indices de la tabla `admin_codes`
--
ALTER TABLE `admin_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indices de la tabla `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indices de la tabla `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indices de la tabla `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `admin_codes`
--
ALTER TABLE `admin_codes`
  MODIFY `id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
