-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Фев 27 2017 г., 04:12
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `test`
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
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `users_view`
--

INSERT INTO `users_view` (`id`, `name`, `age`, `isAdmin`, `createDate`) VALUES
(4, 'Бил', 26, b'0', '2017-02-27 00:09:09'),
(5, 'Сантей', 26, b'0', '2017-02-27 00:09:22'),
(6, 'Диман', 26, b'0', '2017-02-27 00:09:30'),
(7, 'Диля', 27, b'0', '2017-02-27 00:09:44'),
(8, 'Таище', 23, b'0', '2017-02-27 00:09:54'),
(9, 'Барик', 40, b'0', '2017-02-27 00:10:02'),
(10, 'Иван', 38, b'0', '2017-02-27 00:10:15'),
(11, 'Люба', 25, b'0', '2017-02-27 00:10:29'),
(12, 'Андрей', 22, b'0', '2017-02-27 00:10:39'),
(13, 'Петр', 24, b'0', '2017-02-27 00:10:59'),
(14, 'Бил', 32, b'0', '2017-02-27 00:11:09'),
(15, 'Александр', 44, b'0', '2017-02-27 00:11:16'),
(16, 'Игорь', 25, b'0', '2017-02-27 00:11:39'),
(17, 'Алиса', 3, b'0', '2017-02-27 00:11:48'),
(18, 'Леха', 30, b'0', '2017-02-27 00:11:56'),
(19, 'Java', 0, b'0', '2017-02-27 00:12:09');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;