-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 15 apr 2020 kl 08:43
-- Serverversion: 10.4.11-MariaDB
-- PHP-version: 7.4.1

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
  `x_coordinate` int(11) NOT NULL,
  `y_coordinate` int(11) NOT NULL,
  `img_type` text NOT NULL,
  `line_0` text NOT NULL,
  `line_1` text NOT NULL,
  `line_2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_characters`
--

INSERT INTO `tbl_characters` (`character_id`, `name`, `x_coordinate`, `y_coordinate`, `img_type`, `line_0`, `line_1`, `line_2`) VALUES
(1, 'Yoga', 6, 6, 'png', 'Hej på dig din fule fan. Mitt namn är Yoga. Tyvärr har jag raderat dina minnen och du vet därför inte vem du är, men du kan få tillbaka dina minnen om du gör en gentjänst. Nu är det så att den onda överdimensionerade trögkryparen har stulit min värdighet. Ditt uppdrag är att föra tillbaka värdigheten till mig, den allsmäktige Yoga, moahahahaha.', '', '');

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
(85, 6, 6, 1, '', ''),
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
(98, 7, 6, 0, '', ''),
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
(2, 'Kusliga skogen', '', 'jpg');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `x_coordinate` int(11) NOT NULL DEFAULT 6,
  `y_coordinate` int(11) NOT NULL DEFAULT 6
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `password`, `x_coordinate`, `y_coordinate`) VALUES
(1, 'MatPersonalen', 'GillarMat123', 6, 6),
(2, 'SjukaPersonal', 'GillarSjuka123', 6, 6);

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_users_places`
--

CREATE TABLE `tbl_users_places` (
  `user_id` int(11) NOT NULL,
  `x_coordinate` int(11) NOT NULL,
  `y_coordinate` int(11) NOT NULL,
  `visited` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_users_places`
--

INSERT INTO `tbl_users_places` (`user_id`, `x_coordinate`, `y_coordinate`, `visited`) VALUES
(1, 1, 1, 0),
(1, 1, 2, 0),
(1, 1, 3, 0),
(1, 1, 4, 0),
(1, 1, 5, 0),
(1, 1, 6, 0),
(1, 1, 7, 0),
(1, 1, 8, 0),
(1, 1, 9, 0),
(1, 1, 10, 0),
(1, 1, 11, 0),
(1, 2, 1, 0),
(1, 2, 2, 0),
(1, 2, 3, 0),
(1, 2, 4, 0),
(1, 2, 5, 0),
(1, 2, 6, 0),
(1, 2, 7, 0),
(1, 2, 8, 0),
(1, 2, 9, 0),
(1, 2, 10, 0),
(1, 2, 11, 0),
(1, 3, 1, 0),
(1, 3, 2, 0),
(1, 3, 3, 0),
(1, 3, 4, 0),
(1, 3, 5, 0),
(1, 3, 6, 0),
(1, 3, 7, 0),
(1, 3, 8, 0),
(1, 3, 9, 0),
(1, 3, 10, 0),
(1, 3, 11, 0),
(1, 4, 1, 0),
(1, 4, 2, 0),
(1, 4, 3, 0),
(1, 4, 4, 0),
(1, 4, 5, 0),
(1, 4, 6, 0),
(1, 4, 7, 0),
(1, 4, 8, 0),
(1, 4, 9, 0),
(1, 4, 10, 0),
(1, 4, 11, 0),
(1, 5, 1, 0),
(1, 5, 2, 0),
(1, 5, 3, 0),
(1, 5, 4, 0),
(1, 5, 5, 0),
(1, 5, 6, 0),
(1, 5, 7, 0),
(1, 5, 8, 0),
(1, 5, 9, 0),
(1, 5, 10, 0),
(1, 5, 11, 0),
(1, 6, 1, 0),
(1, 6, 2, 0),
(1, 6, 3, 0),
(1, 6, 4, 0),
(1, 6, 5, 0),
(1, 6, 6, 0),
(1, 6, 7, 0),
(1, 6, 8, 0),
(1, 6, 9, 0),
(1, 6, 10, 0),
(1, 6, 11, 0),
(1, 7, 1, 0),
(1, 7, 2, 0),
(1, 7, 3, 0),
(1, 7, 4, 0),
(1, 7, 5, 0),
(1, 7, 6, 0),
(1, 7, 7, 0),
(1, 7, 8, 0),
(1, 7, 9, 0),
(1, 7, 10, 0),
(1, 7, 11, 0),
(1, 8, 1, 0),
(1, 8, 2, 0),
(1, 8, 3, 0),
(1, 8, 4, 0),
(1, 8, 5, 0),
(1, 8, 6, 0),
(1, 8, 7, 0),
(1, 8, 8, 0),
(1, 8, 9, 0),
(1, 8, 10, 0),
(1, 8, 11, 0),
(1, 9, 1, 0),
(1, 9, 2, 0),
(1, 9, 3, 0),
(1, 9, 4, 0),
(1, 9, 5, 0),
(1, 9, 6, 0),
(1, 9, 7, 0),
(1, 9, 8, 0),
(1, 9, 9, 0),
(1, 9, 10, 0),
(1, 9, 11, 0),
(1, 10, 1, 0),
(1, 10, 2, 0),
(1, 10, 3, 0),
(1, 10, 4, 0),
(1, 10, 5, 0),
(1, 10, 6, 0),
(1, 10, 7, 0),
(1, 10, 8, 0),
(1, 10, 9, 0),
(1, 10, 10, 0),
(1, 10, 11, 0),
(1, 11, 1, 0),
(1, 11, 2, 0),
(1, 11, 3, 0),
(1, 11, 4, 0),
(1, 11, 5, 0),
(1, 11, 6, 0),
(1, 11, 7, 0),
(1, 11, 8, 0),
(1, 11, 9, 0),
(1, 11, 10, 0),
(1, 11, 11, 0),
(2, 1, 1, 0),
(2, 1, 2, 0),
(2, 1, 3, 0),
(2, 1, 4, 0),
(2, 1, 5, 0),
(2, 1, 6, 0),
(2, 1, 7, 0),
(2, 1, 8, 0),
(2, 1, 9, 0),
(2, 1, 10, 0),
(2, 1, 11, 0),
(2, 2, 1, 0),
(2, 2, 2, 0),
(2, 2, 3, 0),
(2, 2, 4, 0),
(2, 2, 5, 0),
(2, 2, 6, 0),
(2, 2, 7, 0),
(2, 2, 8, 0),
(2, 2, 9, 0),
(2, 2, 10, 0),
(2, 2, 11, 0),
(2, 3, 1, 0),
(2, 3, 2, 0),
(2, 3, 3, 0),
(2, 3, 4, 0),
(2, 3, 5, 0),
(2, 3, 6, 0),
(2, 3, 7, 0),
(2, 3, 8, 0),
(2, 3, 9, 0),
(2, 3, 10, 0),
(2, 3, 11, 0),
(2, 4, 1, 0),
(2, 4, 2, 0),
(2, 4, 3, 0),
(2, 4, 4, 0),
(2, 4, 5, 0),
(2, 4, 6, 0),
(2, 4, 7, 0),
(2, 4, 8, 0),
(2, 4, 9, 0),
(2, 4, 10, 0),
(2, 4, 11, 0),
(2, 5, 1, 0),
(2, 5, 2, 0),
(2, 5, 3, 0),
(2, 5, 4, 0),
(2, 5, 5, 0),
(2, 5, 6, 0),
(2, 5, 7, 0),
(2, 5, 8, 0),
(2, 5, 9, 0),
(2, 5, 10, 0),
(2, 5, 11, 0),
(2, 6, 1, 0),
(2, 6, 2, 0),
(2, 6, 3, 0),
(2, 6, 4, 0),
(2, 6, 5, 0),
(2, 6, 6, 0),
(2, 6, 7, 0),
(2, 6, 8, 0),
(2, 6, 9, 0),
(2, 6, 10, 0),
(2, 6, 11, 0),
(2, 7, 1, 0),
(2, 7, 2, 0),
(2, 7, 3, 0),
(2, 7, 4, 0),
(2, 7, 5, 0),
(2, 7, 6, 0),
(2, 7, 7, 0),
(2, 7, 8, 0),
(2, 7, 9, 0),
(2, 7, 10, 0),
(2, 7, 11, 0),
(2, 8, 1, 0),
(2, 8, 2, 0),
(2, 8, 3, 0),
(2, 8, 4, 0),
(2, 8, 5, 0),
(2, 8, 6, 0),
(2, 8, 7, 0),
(2, 8, 8, 0),
(2, 8, 9, 0),
(2, 8, 10, 0),
(2, 8, 11, 0),
(2, 9, 1, 0),
(2, 9, 2, 0),
(2, 9, 3, 0),
(2, 9, 4, 0),
(2, 9, 5, 0),
(2, 9, 6, 0),
(2, 9, 7, 0),
(2, 9, 8, 0),
(2, 9, 9, 0),
(2, 9, 10, 0),
(2, 9, 11, 0),
(2, 10, 1, 0),
(2, 10, 2, 0),
(2, 10, 3, 0),
(2, 10, 4, 0),
(2, 10, 5, 0),
(2, 10, 6, 0),
(2, 10, 7, 0),
(2, 10, 8, 0),
(2, 10, 9, 0),
(2, 10, 10, 0),
(2, 10, 11, 0),
(2, 11, 1, 0),
(2, 11, 2, 0),
(2, 11, 3, 0),
(2, 11, 4, 0),
(2, 11, 5, 0),
(2, 11, 6, 0),
(2, 11, 7, 0),
(2, 11, 8, 0),
(2, 11, 9, 0),
(2, 11, 10, 0),
(2, 11, 11, 0);

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `tbl_characters`
--
ALTER TABLE `tbl_characters`
  ADD PRIMARY KEY (`character_id`);

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
-- AUTO_INCREMENT för tabell `tbl_positions`
--
ALTER TABLE `tbl_positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT för tabell `tbl_surroundings`
--
ALTER TABLE `tbl_surroundings`
  MODIFY `surrounding_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT för tabell `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
