-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 27 2016 г., 19:44
-- Версия сервера: 5.7.16-0ubuntu0.16.04.1
-- Версия PHP: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `armen_tax`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attached_document`
--

CREATE TABLE `attached_document` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `reference` varchar(255) DEFAULT '',
  `date` datetime DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  `scan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `booking`
--

INSERT INTO `booking` (`id`, `user_id`, `created`, `updated`, `status`) VALUES
(1, 1, '2016-12-27 05:59:25', '2016-12-27 05:59:25', 1),
(2, 1, '2016-12-27 05:59:25', '2016-12-27 05:59:25', 1),
(3, 1, '2016-12-27 06:01:32', '2016-12-27 06:01:32', 1),
(4, 1, '2016-12-27 06:01:32', '2016-12-27 06:01:32', 1),
(5, 1, '2016-12-27 06:02:06', '2016-12-27 06:02:06', 1),
(6, 1, '2016-12-27 06:02:06', '2016-12-27 06:02:06', 1),
(7, 1, '2016-12-27 06:02:51', '2016-12-27 06:02:51', 1),
(8, 1, '2016-12-27 06:02:51', '2016-12-27 06:02:51', 1),
(9, 1, '2016-12-27 06:03:35', '2016-12-27 06:03:35', 1),
(10, 1, '2016-12-27 06:03:35', '2016-12-27 06:03:35', 1),
(11, 1, '2016-12-27 06:06:46', '2016-12-27 06:06:46', 1),
(12, 1, '2016-12-27 06:06:46', '2016-12-27 06:06:46', 1),
(13, 1, '2016-12-27 06:08:24', '2016-12-27 06:08:24', 1),
(14, 1, '2016-12-27 06:08:24', '2016-12-27 06:08:24', 1),
(15, 1, '2016-12-27 06:09:46', '2016-12-27 06:09:46', 1),
(16, 1, '2016-12-27 06:09:46', '2016-12-27 06:09:46', 1),
(17, 1, '2016-12-27 06:10:50', '2016-12-27 06:10:50', 1),
(18, 1, '2016-12-27 06:10:50', '2016-12-27 06:10:50', 1),
(19, 1, '2016-12-27 06:24:16', '2016-12-27 06:24:16', 1),
(20, 1, '2016-12-27 06:24:16', '2016-12-27 06:24:16', 1),
(21, 1, '2016-12-27 06:24:23', '2016-12-27 06:24:23', 1),
(22, 1, '2016-12-27 06:24:23', '2016-12-27 06:24:23', 1),
(23, 1, '2016-12-27 06:27:56', '2016-12-27 06:27:56', 1),
(24, 1, '2016-12-27 06:27:56', '2016-12-27 06:27:56', 1),
(25, 1, '2016-12-27 06:34:22', '2016-12-27 06:34:22', 1),
(26, 1, '2016-12-27 06:34:22', '2016-12-27 06:34:22', 1),
(27, 1, '2016-12-27 06:34:56', '2016-12-27 06:34:56', 1),
(28, 1, '2016-12-27 06:34:56', '2016-12-27 06:34:56', 1),
(29, 1, '2016-12-27 06:37:37', '2016-12-27 06:37:37', 1),
(30, 1, '2016-12-27 06:37:37', '2016-12-27 06:37:37', 1),
(31, 1, '2016-12-27 06:39:22', '2016-12-27 06:39:22', 1),
(32, 1, '2016-12-27 06:39:22', '2016-12-27 06:39:22', 1),
(33, 1, '2016-12-27 06:40:07', '2016-12-27 06:40:07', 1),
(34, 1, '2016-12-27 06:40:07', '2016-12-27 06:40:07', 1),
(35, 1, '2016-12-27 06:40:22', '2016-12-27 06:40:22', 1),
(36, 1, '2016-12-27 06:40:22', '2016-12-27 06:40:22', 1),
(37, 1, '2016-12-27 06:43:40', '2016-12-27 06:43:40', 1),
(38, 1, '2016-12-27 06:43:40', '2016-12-27 06:43:40', 1),
(39, 1, '2016-12-27 06:44:27', '2016-12-27 06:44:27', 1),
(40, 1, '2016-12-27 06:44:27', '2016-12-27 06:44:27', 1),
(41, 1, '2016-12-27 06:45:19', '2016-12-27 06:45:19', 1),
(42, 1, '2016-12-27 06:45:19', '2016-12-27 06:45:19', 1),
(43, 1, '2016-12-27 06:46:03', '2016-12-27 06:46:03', 1),
(44, 1, '2016-12-27 06:46:03', '2016-12-27 06:46:03', 1),
(45, 1, '2016-12-27 06:47:16', '2016-12-27 06:47:16', 1),
(46, 1, '2016-12-27 06:47:16', '2016-12-27 06:47:16', 1),
(47, 1, '2016-12-27 06:48:45', '2016-12-27 06:48:45', 1),
(48, 1, '2016-12-27 06:48:45', '2016-12-27 06:48:45', 1),
(49, 1, '2016-12-27 06:49:17', '2016-12-27 06:49:17', 1),
(50, 1, '2016-12-27 06:49:17', '2016-12-27 06:49:17', 1),
(51, 1, '2016-12-27 06:49:55', '2016-12-27 06:49:55', 1),
(52, 1, '2016-12-27 06:49:55', '2016-12-27 06:49:55', 1),
(53, 1, '2016-12-27 06:51:53', '2016-12-27 06:51:53', 1),
(54, 1, '2016-12-27 06:51:53', '2016-12-27 06:51:53', 1),
(55, 1, '2016-12-27 06:52:59', '2016-12-27 06:52:59', 1),
(56, 1, '2016-12-27 06:52:59', '2016-12-27 06:52:59', 1),
(57, 1, '2016-12-27 06:53:54', '2016-12-27 06:53:54', 1),
(58, 1, '2016-12-27 06:53:54', '2016-12-27 06:53:54', 1),
(59, 1, '2016-12-27 06:56:56', '2016-12-27 06:56:56', 1),
(60, 1, '2016-12-27 06:56:56', '2016-12-27 06:56:56', 1),
(61, 1, '2016-12-27 06:58:44', '2016-12-27 06:58:44', 1),
(62, 1, '2016-12-27 06:58:44', '2016-12-27 06:58:44', 1),
(63, 1, '2016-12-27 06:59:42', '2016-12-27 06:59:42', 1),
(64, 1, '2016-12-27 06:59:42', '2016-12-27 06:59:42', 1),
(65, 1, '2016-12-27 07:02:49', '2016-12-27 07:02:49', 1),
(66, 1, '2016-12-27 07:02:49', '2016-12-27 07:02:49', 1),
(67, 1, '2016-12-27 07:04:00', '2016-12-27 07:04:00', 1),
(68, 1, '2016-12-27 07:04:00', '2016-12-27 07:04:00', 1),
(69, 1, '2016-12-27 07:04:42', '2016-12-27 07:04:42', 1),
(70, 1, '2016-12-27 07:04:42', '2016-12-27 07:04:42', 1),
(71, 1, '2016-12-27 07:06:54', '2016-12-27 07:06:54', 1),
(72, 1, '2016-12-27 07:06:54', '2016-12-27 07:06:54', 1),
(73, 1, '2016-12-27 07:09:13', '2016-12-27 07:09:13', 1),
(74, 1, '2016-12-27 07:09:13', '2016-12-27 07:09:13', 1),
(75, 1, '2016-12-27 07:10:28', '2016-12-27 07:10:28', 1),
(76, 1, '2016-12-27 07:10:28', '2016-12-27 07:10:28', 1),
(77, 1, '2016-12-27 07:10:50', '2016-12-27 07:10:50', 1),
(78, 1, '2016-12-27 07:10:50', '2016-12-27 07:10:50', 1),
(79, 1, '2016-12-27 07:12:10', '2016-12-27 07:12:10', 1),
(80, 1, '2016-12-27 07:12:10', '2016-12-27 07:12:10', 1),
(81, 1, '2016-12-27 07:12:38', '2016-12-27 07:12:38', 1),
(82, 1, '2016-12-27 07:12:38', '2016-12-27 07:12:38', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `footer`
--

CREATE TABLE `footer` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `fee_amount_1` varchar(255) DEFAULT '',
  `fee_amount_2` varchar(255) DEFAULT '',
  `fee_amount_3` varchar(255) DEFAULT '',
  `fee_amount_4` varchar(255) DEFAULT '',
  `fee_amount_5` varchar(255) DEFAULT '',
  `fee_amount_6` varchar(255) DEFAULT '',
  `fee_amount_7` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `footer`
--

INSERT INTO `footer` (`id`, `booking_id`, `fee_amount_1`, `fee_amount_2`, `fee_amount_3`, `fee_amount_4`, `fee_amount_5`, `fee_amount_6`, `fee_amount_7`) VALUES
(1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 9, '3500', '21000', '0', '1000', '0', '0', '0'),
(3, 11, '3500', '21000', '0', '1000', '0', '0', '0'),
(4, 13, '3500', '21000', '0', '1000', '0', '0', '0'),
(5, 15, '3500', '21000', '0', '1000', '0', '0', '0'),
(6, 17, '3500', '21000', '0', '1000', '0', '0', '0'),
(7, 19, '3500', '21000', '0', '1000', '0', '0', '0'),
(8, 21, '3500', '21000', '0', '1000', '0', '0', '0'),
(9, 23, '3500', '21000', '0', '1000', '0', '0', '0'),
(10, 25, '3500', '21000', '0', '1000', '0', '0', '0'),
(11, 27, '3500', '21000', '0', '1000', '0', '0', '0'),
(12, 29, '3500', '21000', '0', '1000', '0', '0', '0'),
(13, 31, '3500', '21000', '0', '1000', '0', '0', '0'),
(14, 33, '3500', '21000', '0', '1000', '0', '0', '0'),
(15, 35, '3500', '21000', '0', '1000', '0', '0', '0'),
(16, 37, '3500', '21000', '0', '1000', '0', '0', '0'),
(17, 39, '3500', '21000', '0', '1000', '0', '0', '0'),
(18, 41, '3500', '21000', '0', '1000', '0', '0', '0'),
(19, 43, '3500', '21000', '0', '1000', '0', '0', '0'),
(20, 45, '3500', '21000', '0', '1000', '0', '0', '0'),
(21, 47, '3500', '21000', '0', '1000', '0', '0', '0'),
(22, 49, '3500', '21000', '0', '1000', '0', '0', '0'),
(23, 51, '3500', '21000', '0', '1000', '0', '0', '0'),
(24, 53, '3500', '21000', '0', '1000', '0', '0', '0'),
(25, 55, '3500', '21000', '0', '1000', '0', '0', '0'),
(26, 57, '3500', '21000', '0', '1000', '0', '0', '0'),
(27, 59, '3500', '21000', '0', '1000', '0', '0', '0'),
(28, 63, '3500', '21000', '0', '1000', '0', '0', '0'),
(29, 65, '3500', '21000', '0', '1000', '0', '0', '0'),
(30, 67, '3500', '21000', '0', '1000', '0', '0', '0'),
(31, 69, '3500', '21000', '0', '1000', '0', '0', '0'),
(32, 81, '3500', '21000', '0', '1000', '0', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `ident_tax_code` varchar(255) DEFAULT '',
  `ident_type_declar` varchar(255) DEFAULT '',
  `ident_type_code` varchar(255) DEFAULT '',
  `traderstax_export` varchar(255) DEFAULT '',
  `traderstype_cosig_code` varchar(255) DEFAULT '',
  `gi_tax_country` varchar(255) DEFAULT '',
  `gi_type_export` varchar(255) DEFAULT '',
  `gi_type_export_cname` varchar(255) DEFAULT '',
  `gi_type_destination_code` varchar(255) DEFAULT '',
  `transport_transport_identity` varchar(255) DEFAULT '',
  `transport_transport_nation` varchar(255) DEFAULT '',
  `transport_transport_mode` varchar(255) DEFAULT '',
  `transport_inland_transport_mode` varchar(255) DEFAULT '',
  `transport_delivery_term_code` varchar(255) DEFAULT '',
  `transport_delivery_term_place` varchar(255) DEFAULT '',
  `transport_border_office_code` varchar(255) DEFAULT '',
  `valuation_gs_invoice_currency_code` varchar(255) DEFAULT '',
  `valuation_gs_invoice_currency_rate` varchar(255) DEFAULT '',
  `valuation_gs_invoice_total_invoice` varchar(255) DEFAULT '',
  `valuation_gs_invoice_total_weight` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `header`
--

INSERT INTO `header` (`id`, `booking_id`, `ident_tax_code`, `ident_type_declar`, `ident_type_code`, `traderstax_export`, `traderstype_cosig_code`, `gi_tax_country`, `gi_type_export`, `gi_type_export_cname`, `gi_type_destination_code`, `transport_transport_identity`, `transport_transport_nation`, `transport_transport_mode`, `transport_inland_transport_mode`, `transport_delivery_term_code`, `transport_delivery_term_place`, `transport_border_office_code`, `valuation_gs_invoice_currency_code`, `valuation_gs_invoice_currency_rate`, `valuation_gs_invoice_total_invoice`, `valuation_gs_invoice_total_weight`) VALUES
(1, 1, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(2, 3, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(3, 5, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(4, 7, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(5, 9, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(6, 11, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(7, 13, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(8, 15, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(9, 17, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(10, 19, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(11, 21, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(12, 23, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(13, 25, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(14, 27, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(15, 29, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(16, 31, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(17, 33, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(18, 35, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(19, 37, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(20, 39, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(21, 41, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(22, 43, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(23, 45, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(24, 47, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(25, 49, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(26, 51, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(27, 53, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(28, 55, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(29, 57, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(30, 59, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(31, 63, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(32, 65, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(33, 67, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(34, 69, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33'),
(35, 73, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, 79, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(37, 81, '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33', '1707.33');

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `number_of_packages` int(11) DEFAULT '0',
  `kind_of_packages_code` varchar(255) DEFAULT '',
  `kind_of_packages_name` varchar(255) DEFAULT '',
  `country_of_origin_code` varchar(20) DEFAULT ' ',
  `specification_code_description` varchar(200) DEFAULT ' ',
  `summary_declaration` varchar(100) DEFAULT ' ',
  `gross_weight_itm` float DEFAULT NULL,
  `net_weight_itm` float DEFAULT NULL,
  `total_cost_itm` varchar(100) DEFAULT ' ',
  `total_cif_itm` varchar(20) DEFAULT ' ',
  `rate_of_adjustement` varchar(20) DEFAULT ' ',
  `statistical_value` varchar(20) DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`id`, `booking_id`, `number_of_packages`, `kind_of_packages_code`, `kind_of_packages_name`, `country_of_origin_code`, `specification_code_description`, `summary_declaration`, `gross_weight_itm`, `net_weight_itm`, `total_cost_itm`, `total_cif_itm`, `rate_of_adjustement`, `statistical_value`) VALUES
(1057, 69, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'ÕÕ¥Ö€Õ¾Õ¥Ö€Õ« ÕºÕ¡Õ°Õ¡Ö€Õ¡Õ¶ GEMBIRD 19WM 12U', '2016/05100033/42198', 50.8, 49.2, '9285', '90698', '1', '90698'),
(1058, 69, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'ÕÕ¥Ö€Õ¾Õ¥Ö€Õ« ÕºÕ¡Õ°Õ¡Ö€Õ¡Õ¶ GEMBIRD 19WM 12U', '2016/05100033/42198', 50.8, 49.2, '9285', '90698', '1', '90698'),
(1059, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH G501', '2016/05100033/42198', 7.15, 6.55, '1307', '138991', '1', '138991'),
(1060, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH G501', '2016/05100033/42198', 7.15, 6.55, '1307', '138991', '1', '138991'),
(1061, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ Õ­Õ¸Õ½Õ¡ÖƒÕ¸Õ²Õ¸Õ¾ A4TECH A4 HS 50', '2016/05100033/42198', 4.2, 3.6, '768', '33573', '1', '33573'),
(1062, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ Õ­Õ¸Õ½Õ¡ÖƒÕ¸Õ²Õ¸Õ¾ A4TECH A4 HS 50', '2016/05100033/42198', 4.2, 3.6, '768', '33573', '1', '33573'),
(1063, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH HS800', '2016/05100033/42198', 10.8, 10.1, '1974', '87697', '1', '87697'),
(1064, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH HS800', '2016/05100033/42198', 10.8, 10.1, '1974', '87697', '1', '87697'),
(1065, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 3', '2016/05100033/42198', 1.3, 0.8, '238', '19274', '1', '19274'),
(1066, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 3', '2016/05100033/42198', 1.3, 0.8, '238', '19274', '1', '19274'),
(1067, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 5', '2016/05100033/42198', 1.5, 1, '274', '19310', '1', '19310'),
(1068, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 5', '2016/05100033/42198', 1.5, 1, '274', '19310', '1', '19310'),
(1069, 69, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 168.5, 158, '30798', '292948', '1', '292948'),
(1070, 69, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 168.5, 158, '30798', '292948', '1', '292948'),
(1071, 69, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 001', '2016/05100033/42198', 40, 34, '7311', '102852', '1', '102852'),
(1072, 69, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 001', '2016/05100033/42198', 40, 34, '7311', '102852', '1', '102852'),
(1073, 69, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ¡ÕµÕ«Õ¶ GEMBIRD CCC-GJ-002-G', '2016/05100033/42198', 46, 40, '8408', '103949', '1', '103949'),
(1074, 69, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ¡ÕµÕ«Õ¶ GEMBIRD CCC-GJ-002-G', '2016/05100033/42198', 46, 40, '8408', '103949', '1', '103949'),
(1075, 69, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 002 R', '2016/05100033/42198', 47, 41, '8591', '104132', '1', '104132'),
(1076, 69, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 002 R', '2016/05100033/42198', 47, 41, '8591', '104132', '1', '104132'),
(1077, 69, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 106.98, 102.78, '119453', '493187', '1', '493187'),
(1078, 69, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 106.98, 102.78, '119453', '493187', '1', '493187'),
(1079, 69, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 20, 19.1, '3656', '35263', '1', '35263'),
(1080, 69, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 20, 19.1, '3656', '35263', '1', '35263'),
(1081, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 7, 6.4, '1279', '32407', '1', '32407'),
(1082, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 7, 6.4, '1279', '32407', '1', '32407'),
(1083, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 4.2, 3.7, '768', '27108', '1', '27108'),
(1084, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 4.2, 3.7, '768', '27108', '1', '27108'),
(1085, 69, 21, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 436.2, 419.4, '79727', '1285885', '1', '1285885'),
(1086, 69, 21, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 436.2, 419.4, '79727', '1285885', '1', '1285885'),
(1087, 69, 44, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 688.8, 658, '424997', '1576560', '1', '1576560'),
(1088, 69, 44, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 688.8, 658, '424997', '1576560', '1', '1576560'),
(1089, 69, 5, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ GEMBIRD MHS U 001', '2016/05100033/42198', 38.5, 35.5, '7037', '330295', '1', '330295'),
(1090, 69, 5, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ GEMBIRD MHS U 001', '2016/05100033/42198', 38.5, 35.5, '7037', '330295', '1', '330295'),
(1091, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 2.9, 2.3, '530', '9390', '1', '9390'),
(1092, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 2.9, 2.3, '530', '9390', '1', '9390'),
(1093, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 19.3, 18.7, '3528', '57404', '1', '57404'),
(1094, 69, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 19.3, 18.7, '3528', '57404', '1', '57404'),
(1095, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ‹Õ¸ÕµÕ½Õ¿Õ«Õ¯ GEMBIRD STR UV 01', '2016/05100033/42198', 4.9, 4.2, '896', '25703', '1', '25703'),
(1096, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ‹Õ¸ÕµÕ½Õ¿Õ«Õ¯ GEMBIRD STR UV 01', '2016/05100033/42198', 4.9, 4.2, '896', '25703', '1', '25703'),
(1097, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ€Õ¡Õ¢ GEMBIRD UHB C345', '2016/05100033/42198', 1.3, 0.9, '238', '39747', '1', '39747'),
(1098, 69, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ€Õ¡Õ¢ GEMBIRD UHB C345', '2016/05100033/42198', 1.3, 0.9, '238', '39747', '1', '39747'),
(1099, 81, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'ÕÕ¥Ö€Õ¾Õ¥Ö€Õ« ÕºÕ¡Õ°Õ¡Ö€Õ¡Õ¶ GEMBIRD 19WM 12U', '2016/05100033/42198', 50.8, 49.2, '9285', '90698', '1', '90698'),
(1100, 81, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'ÕÕ¥Ö€Õ¾Õ¥Ö€Õ« ÕºÕ¡Õ°Õ¡Ö€Õ¡Õ¶ GEMBIRD 19WM 12U', '2016/05100033/42198', 50.8, 49.2, '9285', '90698', '1', '90698'),
(1101, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH G501', '2016/05100033/42198', 7.15, 6.55, '1307', '138991', '1', '138991'),
(1102, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH G501', '2016/05100033/42198', 7.15, 6.55, '1307', '138991', '1', '138991'),
(1103, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ Õ­Õ¸Õ½Õ¡ÖƒÕ¸Õ²Õ¸Õ¾ A4TECH A4 HS 50', '2016/05100033/42198', 4.2, 3.6, '768', '33573', '1', '33573'),
(1104, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ Õ­Õ¸Õ½Õ¡ÖƒÕ¸Õ²Õ¸Õ¾ A4TECH A4 HS 50', '2016/05100033/42198', 4.2, 3.6, '768', '33573', '1', '33573'),
(1105, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH HS800', '2016/05100033/42198', 10.8, 10.1, '1974', '87697', '1', '87697'),
(1106, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH HS800', '2016/05100033/42198', 10.8, 10.1, '1974', '87697', '1', '87697'),
(1107, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 3', '2016/05100033/42198', 1.3, 0.8, '238', '19274', '1', '19274'),
(1108, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 3', '2016/05100033/42198', 1.3, 0.8, '238', '19274', '1', '19274'),
(1109, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 5', '2016/05100033/42198', 1.5, 1, '274', '19310', '1', '19310'),
(1110, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ A4TECH A4 L 600 5', '2016/05100033/42198', 1.5, 1, '274', '19310', '1', '19310'),
(1111, 81, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 168.5, 158, '30798', '292948', '1', '292948'),
(1112, 81, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 168.5, 158, '30798', '292948', '1', '292948'),
(1113, 81, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 001', '2016/05100033/42198', 40, 34, '7311', '102852', '1', '102852'),
(1114, 81, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 001', '2016/05100033/42198', 40, 34, '7311', '102852', '1', '102852'),
(1115, 81, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ¡ÕµÕ«Õ¶ GEMBIRD CCC-GJ-002-G', '2016/05100033/42198', 46, 40, '8408', '103949', '1', '103949'),
(1116, 81, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ¡ÕµÕ«Õ¶ GEMBIRD CCC-GJ-002-G', '2016/05100033/42198', 46, 40, '8408', '103949', '1', '103949'),
(1117, 81, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 002 R', '2016/05100033/42198', 47, 41, '8591', '104132', '1', '104132'),
(1118, 81, 10, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô»Ö€Õ¡Õ¶ Õ°Õ¡Õ´Õ¡Õ¯Õ¡Ö€Õ£Õ¹Õ« GEMBIRD CCC GJ 002 R', '2016/05100033/42198', 47, 41, '8591', '104132', '1', '104132'),
(1119, 81, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 106.98, 102.78, '119453', '493187', '1', '493187'),
(1120, 81, 7, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 106.98, 102.78, '119453', '493187', '1', '493187'),
(1121, 81, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 20, 19.1, '3656', '35263', '1', '35263'),
(1122, 81, 2, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 20, 19.1, '3656', '35263', '1', '35263'),
(1123, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 7, 6.4, '1279', '32407', '1', '32407'),
(1124, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 7, 6.4, '1279', '32407', '1', '32407'),
(1125, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 4.2, 3.7, '768', '27108', '1', '27108'),
(1126, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 4.2, 3.7, '768', '27108', '1', '27108'),
(1127, 81, 21, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 436.2, 419.4, '79727', '1285885', '1', '1285885'),
(1128, 81, 21, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 436.2, 419.4, '79727', '1285885', '1', '1285885'),
(1129, 81, 44, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 688.8, 658, '424997', '1576560', '1', '1576560'),
(1130, 81, 44, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 688.8, 658, '424997', '1576560', '1', '1576560'),
(1131, 81, 5, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ GEMBIRD MHS U 001', '2016/05100033/42198', 38.5, 35.5, '7037', '330295', '1', '330295'),
(1132, 81, 5, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Ô±Õ¯Õ¡Õ¶Õ»Õ¡Õ¯Õ¡Õ¬ GEMBIRD MHS U 001', '2016/05100033/42198', 38.5, 35.5, '7037', '330295', '1', '330295'),
(1133, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 2.9, 2.3, '530', '9390', '1', '9390'),
(1134, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 2.9, 2.3, '530', '9390', '1', '9390'),
(1135, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 19.3, 18.7, '3528', '57404', '1', '57404'),
(1136, 81, 1, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', '[]', '2016/05100033/42198', 19.3, 18.7, '3528', '57404', '1', '57404'),
(1137, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ‹Õ¸ÕµÕ½Õ¿Õ«Õ¯ GEMBIRD STR UV 01', '2016/05100033/42198', 4.9, 4.2, '896', '25703', '1', '25703'),
(1138, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ‹Õ¸ÕµÕ½Õ¿Õ«Õ¯ GEMBIRD STR UV 01', '2016/05100033/42198', 4.9, 4.2, '896', '25703', '1', '25703'),
(1139, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ€Õ¡Õ¢ GEMBIRD UHB C345', '2016/05100033/42198', 1.3, 0.9, '238', '39747', '1', '39747'),
(1140, 81, 0, 'Ô±Ö€Õ¯Õ²', 'CS', ' ', 'Õ€Õ¡Õ¢ GEMBIRD UHB C345', '2016/05100033/42198', 1.3, 0.9, '238', '39747', '1', '39747');

-- --------------------------------------------------------

--
-- Структура таблицы `tarification`
--

CREATE TABLE `tarification` (
  `h_scode_commodity_code` varchar(20) DEFAULT '',
  `id` int(11) NOT NULL,
  `h_scode_precision_1` varchar(20) DEFAULT '',
  `h_scode_precision_2` varchar(20) DEFAULT '',
  `h_scode_precision_3` varchar(20) DEFAULT ' ',
  `h_scode_precision_4` varchar(20) DEFAULT ' ',
  `item_id` int(11) DEFAULT NULL,
  `preference_code` varchar(20) DEFAULT ' ',
  `extended_customs_procedure` varchar(20) DEFAULT ' ',
  `national_customs_procedure` varchar(20) DEFAULT ' ',
  `quota_code` text,
  `item_price` varchar(20) DEFAULT NULL,
  `valuation_method_code` varchar(50) DEFAULT ' ',
  `value_item` varchar(100) DEFAULT ' ',
  `attached_doc_item` varchar(100) DEFAULT ' ',
  `a_i__code` text,
  `supplementary_unit_code` varchar(50) DEFAULT ' ',
  `supplementary_unit_name` varchar(50) DEFAULT ' ',
  `supplementary_unit_quantity` varchar(50) DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tarification`
--

INSERT INTO `tarification` (`h_scode_commodity_code`, `id`, `h_scode_precision_1`, `h_scode_precision_2`, `h_scode_precision_3`, `h_scode_precision_4`, `item_id`, `preference_code`, `extended_customs_procedure`, `national_customs_procedure`, `quota_code`, `item_price`, `valuation_method_code`, `value_item`, `attached_doc_item`, `a_i__code`, `supplementary_unit_code`, `supplementary_unit_name`, `supplementary_unit_quantity`) VALUES
('[]', 8, '[]', '[]', '[]', '[]', 1098, ' ', '[]', '[]', NULL, NULL, ' ', ' ', ' ', NULL, '[]', '[]', '[]'),
('[]', 9, '[]', '[]', '[]', '[]', 1140, ' ', '[]', '[]', NULL, NULL, ' ', ' ', ' ', NULL, '[]', '[]', '[]');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users :)';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `lastname`, `created`, `is_admin`) VALUES
(1, 'armen', 'Armen', 'Armen', 'Mkrtchya', '2016-12-19 22:31:25', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attached_document`
--
ALTER TABLE `attached_document`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Attached_document_id_uindex` (`id`),
  ADD KEY `Attached_document_item_id_fk` (`item_id`);

--
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_id_uindex` (`id`),
  ADD KEY `booking_users_id_fk` (`user_id`);

--
-- Индексы таблицы `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `footer_id_uindex` (`id`),
  ADD KEY `footer_booking_id_fk` (`booking_id`);

--
-- Индексы таблицы `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `header_id_uindex` (`id`),
  ADD KEY `header_booking_id_fk` (`booking_id`);

--
-- Индексы таблицы `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_id_uindex` (`id`),
  ADD KEY `item_booking_id_fk` (`booking_id`);

--
-- Индексы таблицы `tarification`
--
ALTER TABLE `tarification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Tarification_id_uindex` (`id`),
  ADD KEY `Tarification_item_id_fk` (`item_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_uindex` (`id`),
  ADD UNIQUE KEY `users_username_uindex` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attached_document`
--
ALTER TABLE `attached_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT для таблицы `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT для таблицы `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT для таблицы `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1141;
--
-- AUTO_INCREMENT для таблицы `tarification`
--
ALTER TABLE `tarification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `attached_document`
--
ALTER TABLE `attached_document`
  ADD CONSTRAINT `Attached_document_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Ограничения внешнего ключа таблицы `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `footer`
--
ALTER TABLE `footer`
  ADD CONSTRAINT `footer_booking_id_fk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

--
-- Ограничения внешнего ключа таблицы `header`
--
ALTER TABLE `header`
  ADD CONSTRAINT `header_booking_id_fk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

--
-- Ограничения внешнего ключа таблицы `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_booking_id_fk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

--
-- Ограничения внешнего ключа таблицы `tarification`
--
ALTER TABLE `tarification`
  ADD CONSTRAINT `Tarification_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
