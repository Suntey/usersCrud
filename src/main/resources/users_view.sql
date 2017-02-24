-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Фев 24 2017 г., 14:19
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `names`
--

-- --------------------------------------------------------

--
-- Структура таблицы `users_view`
--

CREATE TABLE IF NOT EXISTS `users_view` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `age` int(3) NOT NULL,
  `isAdmin` bit(1) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Дамп данных таблицы `users_view`
--

INSERT INTO `users_view` (`id`, `name`, `age`, `isAdmin`, `createDate`) VALUES
(2, 'Петя', 13, b'0', '2017-02-13 20:12:38'),
(24, 'бил', 26, b'0', '2017-02-22 19:57:18'),
(32, 'Петяныч', 13, b'0', '2017-02-22 22:18:04'),
(43, 'Иван', 36, b'0', '2017-02-22 18:14:17'),
(52, 'петя', 33, b'0', '2017-02-22 20:04:19'),
(57, 'Диман', 26, b'0', '2017-02-22 22:18:31'),
(58, 'Диля', 22, b'0', '2017-02-22 22:19:17'),
(59, 'Люба', 18, b'0', '2017-02-23 16:56:53');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
