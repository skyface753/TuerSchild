-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 16. Sep 2022 um 09:24
-- Server-Version: 10.8.3-MariaDB-1:10.8.3+maria~jammy
-- PHP-Version: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `database`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `allocations`
--

CREATE TABLE `allocations` (
  `id` int(11) NOT NULL,
  `roomFk` int(11) NOT NULL,
  `userFk` int(11) NOT NULL,
  `time_from` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `info` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `allocations`
--

INSERT INTO `allocations` (`id`, `roomFk`, `userFk`, `time_from`, `time_to`, `info`) VALUES
(1, 1, 2, '2022-09-16 09:14:30', '2022-09-16 12:14:13', 'TGI Vorlesung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `avatar`
--

CREATE TABLE `avatar` (
  `userFk` int(11) NOT NULL,
  `originalName` varchar(250) NOT NULL,
  `generatedPath` varchar(250) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `role`
--

INSERT INTO `role` (`id`, `title`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `room`
--

INSERT INTO `room` (`id`, `number`, `name`) VALUES
(1, 'D14/00.01', 'IT - 1'),
(2, 'D14/01.02', 'IT - Labor');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `roleFk` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roleFk`) VALUES
(1, 'admin@example.de', '$2b$10$957SjQ2vLy8aBPIOn6aKduL/tMjzvKGSGK8N34idvLaf/PTjXG0ve', 2),
(2, 'test@example.de', '$2b$10$RZLpZn3IdVHfxn40HZdd8uZTjeRCgxkG2ZGTdzhqsTG6t/dK/BR7.', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `allocations`
--
ALTER TABLE `allocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_allocationFk` (`userFk`),
  ADD KEY `room_allocationFk` (`roomFk`);

--
-- Indizes für die Tabelle `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`userFk`);

--
-- Indizes für die Tabelle `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_fk` (`roleFk`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `allocations`
--
ALTER TABLE `allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `allocations`
--
ALTER TABLE `allocations`
  ADD CONSTRAINT `room_allocationFk` FOREIGN KEY (`roomFk`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `user_allocationFk` FOREIGN KEY (`userFk`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `avatar`
--
ALTER TABLE `avatar`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`userFk`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `role_fk` FOREIGN KEY (`roleFk`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
