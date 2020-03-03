-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 03 mars 2020 kl 10:15
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
  `line_1` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_characters`
--

INSERT INTO `tbl_characters` (`character_id`, `name`, `x_coordinate`, `y_coordinate`, `img_type`, `line_1`) VALUES
(1, 'Yoga', 6, 6, 'png', 'Hej på dig din fule fan. Mitt namn är Yoga. Tyvärr har jag raderat dina minnen och du vet därför inte vem du är, men du kan få tillbaka dina minnen om du gör en gentjänst. Nu är det så att den onda överdimensionerade trögkryparen har stulit min värdighet. Ditt uppdrag är att föra tillbaka värdigheten till mig, den allsmäktige Yoga, moahahahaha.');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_map`
--

CREATE TABLE `tbl_map` (
  `y_coordinate` int(11) NOT NULL,
  `0` int(11) NOT NULL DEFAULT 0,
  `1` int(11) NOT NULL DEFAULT 0,
  `2` int(11) NOT NULL DEFAULT 0,
  `3` int(11) NOT NULL DEFAULT 0,
  `4` int(11) NOT NULL DEFAULT 0,
  `5` int(11) NOT NULL DEFAULT 0,
  `6` int(11) NOT NULL DEFAULT 0,
  `7` int(11) NOT NULL DEFAULT 0,
  `8` int(11) NOT NULL DEFAULT 0,
  `9` int(11) NOT NULL DEFAULT 0,
  `10` int(11) NOT NULL DEFAULT 0,
  `11` int(11) NOT NULL DEFAULT 0,
  `12` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `tbl_map`
--

INSERT INTO `tbl_map` (`y_coordinate`, `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
-- Index för tabell `tbl_map`
--
ALTER TABLE `tbl_map`
  ADD PRIMARY KEY (`y_coordinate`);

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
-- AUTO_INCREMENT för tabell `tbl_map`
--
ALTER TABLE `tbl_map`
  MODIFY `y_coordinate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
