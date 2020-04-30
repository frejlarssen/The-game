-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 01 maj 2020 kl 00:33
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
  `position_id` int(11) NOT NULL,
  `gold` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `password`, `position_id`, `gold`) VALUES
(1, 'MatPersonalen', 'GillarMat123', 98, 0);

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
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0),
(1, 11, 0),
(1, 12, 0),
(1, 13, 0),
(1, 14, 0),
(1, 15, 0),
(1, 16, 0),
(1, 17, 0),
(1, 18, 0),
(1, 19, 0),
(1, 20, 0),
(1, 21, 0),
(1, 22, 0),
(1, 23, 0),
(1, 24, 0),
(1, 25, 0),
(1, 26, 0),
(1, 27, 0),
(1, 28, 0),
(1, 29, 0),
(1, 30, 0),
(1, 31, 0),
(1, 32, 0),
(1, 33, 0),
(1, 34, 0),
(1, 35, 0),
(1, 36, 0),
(1, 37, 0),
(1, 38, 0),
(1, 39, 0),
(1, 40, 0),
(1, 41, 0),
(1, 42, 0),
(1, 43, 0),
(1, 44, 0),
(1, 45, 0),
(1, 46, 0),
(1, 47, 0),
(1, 48, 0),
(1, 49, 0),
(1, 50, 0),
(1, 51, 0),
(1, 52, 0),
(1, 53, 0),
(1, 54, 0),
(1, 55, 0),
(1, 56, 0),
(1, 57, 0),
(1, 58, 0),
(1, 59, 0),
(1, 60, 0),
(1, 61, 0),
(1, 62, 0),
(1, 63, 0),
(1, 64, 0),
(1, 65, 0),
(1, 66, 0),
(1, 67, 0),
(1, 68, 0),
(1, 69, 0),
(1, 70, 0),
(1, 71, 0),
(1, 72, 0),
(1, 73, 0),
(1, 74, 0),
(1, 75, 0),
(1, 76, 0),
(1, 77, 0),
(1, 78, 0),
(1, 79, 0),
(1, 80, 0),
(1, 81, 0),
(1, 82, 0),
(1, 83, 0),
(1, 84, 0),
(1, 85, 1),
(1, 86, 0),
(1, 87, 0),
(1, 88, 0),
(1, 89, 0),
(1, 90, 0),
(1, 91, 0),
(1, 92, 0),
(1, 93, 0),
(1, 94, 0),
(1, 95, 0),
(1, 96, 0),
(1, 97, 0),
(1, 98, 0),
(1, 99, 0),
(1, 100, 0),
(1, 101, 0),
(1, 102, 0),
(1, 103, 0),
(1, 104, 0),
(1, 105, 0),
(1, 106, 0),
(1, 107, 0),
(1, 108, 0),
(1, 109, 0),
(1, 110, 0),
(1, 111, 0),
(1, 112, 0),
(1, 113, 0),
(1, 114, 0),
(1, 115, 0),
(1, 116, 0),
(1, 117, 0),
(1, 118, 0),
(1, 119, 0),
(1, 120, 0),
(1, 121, 0),
(1, 122, 0),
(1, 123, 0),
(1, 124, 0),
(1, 125, 0),
(1, 126, 0),
(1, 127, 0),
(1, 128, 0),
(1, 129, 0),
(1, 130, 0),
(1, 131, 0),
(1, 132, 0),
(1, 133, 0),
(1, 134, 0),
(1, 135, 0),
(1, 136, 0),
(1, 137, 0),
(1, 138, 0),
(1, 139, 0),
(1, 140, 0),
(1, 141, 0),
(1, 142, 0),
(1, 143, 0),
(1, 144, 0),
(1, 145, 0),
(1, 146, 0),
(1, 147, 0),
(1, 148, 0),
(1, 149, 0),
(1, 150, 0),
(1, 151, 0),
(1, 152, 0),
(1, 153, 0),
(1, 154, 0),
(1, 155, 0),
(1, 156, 0),
(1, 157, 0),
(1, 158, 0),
(1, 159, 0),
(1, 160, 0),
(1, 161, 0),
(1, 162, 0),
(1, 163, 0),
(1, 164, 0),
(1, 165, 0),
(1, 166, 0),
(1, 167, 0),
(1, 168, 0),
(1, 169, 0);

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
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
