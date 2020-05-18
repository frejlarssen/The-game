-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 18 maj 2020 kl 18:38
-- Serverversion: 10.4.11-MariaDB
-- PHP-version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `the_game`
--
CREATE DATABASE IF NOT EXISTS `the_game` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `the_game`;

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_characters`
--

CREATE TABLE `tbl_characters` (
  `character_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `img_type` text NOT NULL,
  `position_id` int(11) NOT NULL,
  `line_0` text NOT NULL,
  `line_1` text NOT NULL,
  `line_2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_characters`
--

INSERT INTO `tbl_characters` (`character_id`, `name`, `img_type`, `position_id`, `line_0`, `line_1`, `line_2`) VALUES
(1, 'Yoga', 'png', 85, 'Hej på dig din fule fan. Mitt namn är Yoga. Tyvärr har jag raderat dina minnen och du vet därför inte vem du är, men du kan få tillbaka dina minnen om du gör en gentjänst. Nu är det så att den onda överdimensionerade trögkryparen har stulit min värdighet. Ditt uppdrag är att föra tillbaka värdigheten till mig, den allsmäktige Yoga, moahahahaha.', 'Okej, bra', 'Tror du den ståtlige Yoga bryr sig? Gör det ändå.');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_items`
--

CREATE TABLE `tbl_items` (
  `item_id` int(11) NOT NULL,
  `item_name` text NOT NULL,
  `cost` int(11) NOT NULL,
  `img_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_items`
--

INSERT INTO `tbl_items` (`item_id`, `item_name`, `cost`, `img_type`) VALUES
(1, 'Kaka', 20, 'jpg'),
(2, 'Svärd', 100, 'png');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_positions`
--

CREATE TABLE `tbl_positions` (
  `position_id` int(11) NOT NULL,
  `x_coordinate` int(11) NOT NULL,
  `y_coordinate` int(11) NOT NULL,
  `surrounding_id` int(11) NOT NULL,
  `choice_1` text NOT NULL,
  `choice_2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_positions`
--

INSERT INTO `tbl_positions` (`position_id`, `x_coordinate`, `y_coordinate`, `surrounding_id`, `choice_1`, `choice_2`) VALUES
(1, 0, 0, 0, '', ''),
(2, 0, 1, 0, '', ''),
(3, 0, 2, 0, '', ''),
(4, 0, 3, 0, '', ''),
(5, 0, 4, 0, '', ''),
(6, 0, 5, 0, '', ''),
(7, 0, 6, 0, '', ''),
(8, 0, 7, 0, '', ''),
(9, 0, 8, 0, '', ''),
(10, 0, 9, 0, '', ''),
(11, 0, 10, 0, '', ''),
(12, 0, 11, 0, '', ''),
(13, 0, 12, 0, '', ''),
(14, 1, 0, 0, '', ''),
(15, 1, 1, 0, '', ''),
(16, 1, 2, 0, '', ''),
(17, 1, 3, 0, '', ''),
(18, 1, 4, 0, '', ''),
(19, 1, 5, 0, '', ''),
(20, 1, 6, 0, '', ''),
(21, 1, 7, 0, '', ''),
(22, 1, 8, 0, '', ''),
(23, 1, 9, 0, '', ''),
(24, 1, 10, 0, '', ''),
(25, 1, 11, 0, '', ''),
(26, 1, 12, 0, '', ''),
(27, 2, 0, 0, '', ''),
(28, 2, 1, 0, '', ''),
(29, 2, 2, 0, '', ''),
(30, 2, 3, 0, '', ''),
(31, 2, 4, 0, '', ''),
(32, 2, 5, 0, '', ''),
(33, 2, 6, 0, '', ''),
(34, 2, 7, 0, '', ''),
(35, 2, 8, 0, '', ''),
(36, 2, 9, 0, '', ''),
(37, 2, 10, 0, '', ''),
(38, 2, 11, 0, '', ''),
(39, 2, 12, 0, '', ''),
(40, 3, 0, 0, '', ''),
(41, 3, 1, 0, '', ''),
(42, 3, 2, 0, '', ''),
(43, 3, 3, 0, '', ''),
(44, 3, 4, 0, '', ''),
(45, 3, 5, 0, '', ''),
(46, 3, 6, 0, '', ''),
(47, 3, 7, 0, '', ''),
(48, 3, 8, 0, '', ''),
(49, 3, 9, 0, '', ''),
(50, 3, 10, 0, '', ''),
(51, 3, 11, 0, '', ''),
(52, 3, 12, 0, '', ''),
(53, 4, 0, 0, '', ''),
(54, 4, 1, 0, '', ''),
(55, 4, 2, 0, '', ''),
(56, 4, 3, 0, '', ''),
(57, 4, 4, 0, '', ''),
(58, 4, 5, 0, '', ''),
(59, 4, 6, 0, '', ''),
(60, 4, 7, 0, '', ''),
(61, 4, 8, 0, '', ''),
(62, 4, 9, 0, '', ''),
(63, 4, 10, 0, '', ''),
(64, 4, 11, 0, '', ''),
(65, 4, 12, 0, '', ''),
(66, 5, 0, 0, '', ''),
(67, 5, 1, 0, '', ''),
(68, 5, 2, 0, '', ''),
(69, 5, 3, 0, '', ''),
(70, 5, 4, 0, '', ''),
(71, 5, 5, 0, '', ''),
(72, 5, 6, 0, '', ''),
(73, 5, 7, 0, '', ''),
(74, 5, 8, 0, '', ''),
(75, 5, 9, 0, '', ''),
(76, 5, 10, 0, '', ''),
(77, 5, 11, 0, '', ''),
(78, 5, 12, 0, '', ''),
(79, 6, 0, 0, '', ''),
(80, 6, 1, 0, '', ''),
(81, 6, 2, 0, '', ''),
(82, 6, 3, 0, '', ''),
(83, 6, 4, 0, '', ''),
(84, 6, 5, 0, '', ''),
(85, 6, 6, 1, 'Okej då', 'Vill inte!'),
(86, 6, 7, 2, '', ''),
(87, 6, 8, 0, '', ''),
(88, 6, 9, 0, '', ''),
(89, 6, 10, 0, '', ''),
(90, 6, 11, 0, '', ''),
(91, 6, 12, 0, '', ''),
(92, 7, 0, 0, '', ''),
(93, 7, 1, 0, '', ''),
(94, 7, 2, 0, '', ''),
(95, 7, 3, 0, '', ''),
(96, 7, 4, 0, '', ''),
(97, 7, 5, 0, '', ''),
(98, 7, 6, 3, 'Inträd i stugan', 'Inträd ej i stugan'),
(99, 7, 7, 0, '', ''),
(100, 7, 8, 0, '', ''),
(101, 7, 9, 0, '', ''),
(102, 7, 10, 0, '', ''),
(103, 7, 11, 0, '', ''),
(104, 7, 12, 0, '', ''),
(105, 8, 0, 0, '', ''),
(106, 8, 1, 0, '', ''),
(107, 8, 2, 0, '', ''),
(108, 8, 3, 0, '', ''),
(109, 8, 4, 0, '', ''),
(110, 8, 5, 0, '', ''),
(111, 8, 6, 0, '', ''),
(112, 8, 7, 0, '', ''),
(113, 8, 8, 0, '', ''),
(114, 8, 9, 0, '', ''),
(115, 8, 10, 0, '', ''),
(116, 8, 11, 0, '', ''),
(117, 8, 12, 0, '', ''),
(118, 9, 0, 0, '', ''),
(119, 9, 1, 0, '', ''),
(120, 9, 2, 0, '', ''),
(121, 9, 3, 0, '', ''),
(122, 9, 4, 0, '', ''),
(123, 9, 5, 0, '', ''),
(124, 9, 6, 0, '', ''),
(125, 9, 7, 0, '', ''),
(126, 9, 8, 0, '', ''),
(127, 9, 9, 0, '', ''),
(128, 9, 10, 0, '', ''),
(129, 9, 11, 0, '', ''),
(130, 9, 12, 0, '', ''),
(131, 10, 0, 0, '', ''),
(132, 10, 1, 0, '', ''),
(133, 10, 2, 0, '', ''),
(134, 10, 3, 0, '', ''),
(135, 10, 4, 0, '', ''),
(136, 10, 5, 0, '', ''),
(137, 10, 6, 0, '', ''),
(138, 10, 7, 0, '', ''),
(139, 10, 8, 0, '', ''),
(140, 10, 9, 0, '', ''),
(141, 10, 10, 0, '', ''),
(142, 10, 11, 0, '', ''),
(143, 10, 12, 0, '', ''),
(144, 11, 0, 0, '', ''),
(145, 11, 1, 0, '', ''),
(146, 11, 2, 0, '', ''),
(147, 11, 3, 0, '', ''),
(148, 11, 4, 0, '', ''),
(149, 11, 5, 0, '', ''),
(150, 11, 6, 0, '', ''),
(151, 11, 7, 0, '', ''),
(152, 11, 8, 0, '', ''),
(153, 11, 9, 0, '', ''),
(154, 11, 10, 0, '', ''),
(155, 11, 11, 0, '', ''),
(156, 11, 12, 0, '', ''),
(157, 12, 0, 0, '', ''),
(158, 12, 1, 0, '', ''),
(159, 12, 2, 0, '', ''),
(160, 12, 3, 0, '', ''),
(161, 12, 4, 0, '', ''),
(162, 12, 5, 0, '', ''),
(163, 12, 6, 0, '', ''),
(164, 12, 7, 0, '', ''),
(165, 12, 8, 0, '', ''),
(166, 12, 9, 0, '', ''),
(167, 12, 10, 0, '', ''),
(168, 12, 11, 0, '', ''),
(169, 12, 12, 0, '', '');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_surroundings`
--

CREATE TABLE `tbl_surroundings` (
  `surrounding_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `img_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_surroundings`
--

INSERT INTO `tbl_surroundings` (`surrounding_id`, `name`, `description`, `img_type`) VALUES
(1, 'Gläntan', '', 'jpg'),
(2, 'Kusliga skogen', '', 'jpg'),
(3, 'Stugan', 'Nämen se på fan. Är det inte en stuga jag skådar?', 'jpg');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `hash_algorithm` text NOT NULL,
  `position_id` int(11) NOT NULL,
  `gold` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `password`, `hash_algorithm`, `position_id`, `gold`) VALUES
(2, 'MatPersonalen', '$6$rounds=5000$anexamplestringf$2s4CS8pvrfxMWtj6nSBcGiuCn.ekhZHNUquknzmHX03GN0NJJg9EpTtBtsJaO3evnn8qkiV2SycsnhIiy.cKA1', 'CRYPT_SHA512', 85, 30);

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_users_items`
--

CREATE TABLE `tbl_users_items` (
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_users_items`
--

INSERT INTO `tbl_users_items` (`user_id`, `item_id`, `status`) VALUES
(2, 1, 'not bought'),
(2, 2, 'not bought');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_users_positions`
--

CREATE TABLE `tbl_users_positions` (
  `user_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `visited` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_users_positions`
--

INSERT INTO `tbl_users_positions` (`user_id`, `position_id`, `visited`) VALUES
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 5, 0),
(2, 6, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 11, 0),
(2, 12, 0),
(2, 13, 0),
(2, 14, 0),
(2, 15, 0),
(2, 16, 0),
(2, 17, 0),
(2, 18, 0),
(2, 19, 0),
(2, 20, 0),
(2, 21, 0),
(2, 22, 0),
(2, 23, 0),
(2, 24, 0),
(2, 25, 0),
(2, 26, 0),
(2, 27, 0),
(2, 28, 0),
(2, 29, 0),
(2, 30, 0),
(2, 31, 0),
(2, 32, 0),
(2, 33, 0),
(2, 34, 0),
(2, 35, 0),
(2, 36, 0),
(2, 37, 0),
(2, 38, 0),
(2, 39, 0),
(2, 40, 0),
(2, 41, 0),
(2, 42, 0),
(2, 43, 0),
(2, 44, 0),
(2, 45, 0),
(2, 46, 0),
(2, 47, 0),
(2, 48, 0),
(2, 49, 0),
(2, 50, 0),
(2, 51, 0),
(2, 52, 0),
(2, 53, 0),
(2, 54, 0),
(2, 55, 0),
(2, 56, 0),
(2, 57, 0),
(2, 58, 0),
(2, 59, 0),
(2, 60, 0),
(2, 61, 0),
(2, 62, 0),
(2, 63, 0),
(2, 64, 0),
(2, 65, 0),
(2, 66, 0),
(2, 67, 0),
(2, 68, 0),
(2, 69, 0),
(2, 70, 0),
(2, 71, 0),
(2, 72, 0),
(2, 73, 0),
(2, 74, 0),
(2, 75, 0),
(2, 76, 0),
(2, 77, 0),
(2, 78, 0),
(2, 79, 0),
(2, 80, 0),
(2, 81, 0),
(2, 82, 0),
(2, 83, 0),
(2, 84, 0),
(2, 85, 0),
(2, 86, 0),
(2, 87, 0),
(2, 88, 0),
(2, 89, 0),
(2, 90, 0),
(2, 91, 0),
(2, 92, 0),
(2, 93, 0),
(2, 94, 0),
(2, 95, 0),
(2, 96, 0),
(2, 97, 0),
(2, 98, 0),
(2, 99, 0),
(2, 100, 0),
(2, 101, 0),
(2, 102, 0),
(2, 103, 0),
(2, 104, 0),
(2, 105, 0),
(2, 106, 0),
(2, 107, 0),
(2, 108, 0),
(2, 109, 0),
(2, 110, 0),
(2, 111, 0),
(2, 112, 0),
(2, 113, 0),
(2, 114, 0),
(2, 115, 0),
(2, 116, 0),
(2, 117, 0),
(2, 118, 0),
(2, 119, 0),
(2, 120, 0),
(2, 121, 0),
(2, 122, 0),
(2, 123, 0),
(2, 124, 0),
(2, 125, 0),
(2, 126, 0),
(2, 127, 0),
(2, 128, 0),
(2, 129, 0),
(2, 130, 0),
(2, 131, 0),
(2, 132, 0),
(2, 133, 0),
(2, 134, 0),
(2, 135, 0),
(2, 136, 0),
(2, 137, 0),
(2, 138, 0),
(2, 139, 0),
(2, 140, 0),
(2, 141, 0),
(2, 142, 0),
(2, 143, 0),
(2, 144, 0),
(2, 145, 0),
(2, 146, 0),
(2, 147, 0),
(2, 148, 0),
(2, 149, 0),
(2, 150, 0),
(2, 151, 0),
(2, 152, 0),
(2, 153, 0),
(2, 154, 0),
(2, 155, 0),
(2, 156, 0),
(2, 157, 0),
(2, 158, 0),
(2, 159, 0),
(2, 160, 0),
(2, 161, 0),
(2, 162, 0),
(2, 163, 0),
(2, 164, 0),
(2, 165, 0),
(2, 166, 0),
(2, 167, 0),
(2, 168, 0),
(2, 169, 0);

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `tbl_characters`
--
ALTER TABLE `tbl_characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Index för tabell `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Index för tabell `tbl_positions`
--
ALTER TABLE `tbl_positions`
  ADD PRIMARY KEY (`position_id`);

--
-- Index för tabell `tbl_surroundings`
--
ALTER TABLE `tbl_surroundings`
  ADD PRIMARY KEY (`surrounding_id`);

--
-- Index för tabell `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `tbl_characters`
--
ALTER TABLE `tbl_characters`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT för tabell `tbl_items`
--
ALTER TABLE `tbl_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT för tabell `tbl_positions`
--
ALTER TABLE `tbl_positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT för tabell `tbl_surroundings`
--
ALTER TABLE `tbl_surroundings`
  MODIFY `surrounding_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT för tabell `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
