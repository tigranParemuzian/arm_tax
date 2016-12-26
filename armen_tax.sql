-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 27 2016 г., 01:20
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
-- Структура таблицы `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
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
  `valuation_gs_invoice_total_weight` varchar(255) DEFAULT '',
  `custom_fee` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_id_uindex` (`id`);

--
-- Индексы таблицы `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `header_id_uindex` (`id`),
  ADD KEY `header_booking_id_fk` (`booking_id`);

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
-- AUTO_INCREMENT для таблицы `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `header`
--
ALTER TABLE `header`
  ADD CONSTRAINT `header_booking_id_fk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
