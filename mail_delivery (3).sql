-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Nov 2020 um 01:42
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mail_delivery`
--
CREATE DATABASE IF NOT EXISTS `mail_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mail_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `tel_number` int(11) DEFAULT NULL,
  `fk_employees_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`address_id`, `street`, `city`, `tel_number`, `fk_employees_id`) VALUES
(1, 'Los Jasmines 3', 'Barcelona', 2147483647, 112),
(2, 'Weingasse 2', 'Vienna', 2147483647, 113),
(3, 'Martinstraße 30', 'Salzburg', 434561237, 114),
(4, 'Salzergasse2', 'Vienna', 2147483647, NULL),
(5, 'Linzergasse 2', 'Vienna', 2147483647, NULL),
(6, 'Kendlergasse 6', 'Vienna', 2147483647, NULL),
(7, 'Postgasse 1', 'Vienna', 11234657, NULL),
(8, 'Postgasse 2', 'Vienna', 178946561, NULL),
(9, 'Postgasse 3', 'Vienna', 12581479, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_address_id` int(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_address_id`) VALUES
(1, 'Carlos', 'Alvarez', 4),
(2, 'Alfredo', 'Novarra', 5),
(3, 'Eusebio', 'Silva Ferreira', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivering_route`
--

CREATE TABLE `delivering_route` (
  `delivering_route_id` int(11) NOT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `route_name` varchar(55) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `delivering_route`
--

INSERT INTO `delivering_route` (`delivering_route_id`, `fk_package_id`, `route_name`, `capacity`, `fk_customer_id`) VALUES
(1, 1, 'North Route', 200, 1),
(2, 2, 'South Route', 200, 2),
(3, 3, 'West route', 200, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `employees_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `department` varchar(55) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`employees_id`, `first_name`, `last_name`, `department`, `fk_address_id`) VALUES
(112, 'Marco', 'Paredes', 'Delivery Department', 1),
(113, 'Victor', 'Perez', 'Accounting', 2),
(114, 'Anthony', 'Vasquez', 'IT-Support', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail_station`
--

CREATE TABLE `mail_station` (
  `mail_station_id` int(11) NOT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_employees_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mail_station`
--

INSERT INTO `mail_station` (`mail_station_id`, `fk_address_id`, `fk_customer_id`, `fk_employees_id`) VALUES
(12, 7, 1, 112),
(23, 8, 2, 113),
(34, 9, 3, 114);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `delivering_schedule` datetime DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_mail_station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `delivering_schedule`, `fk_customer_id`, `fk_mail_station_id`) VALUES
(1, '2020-11-08 08:00:00', 1, 12),
(2, '2020-11-08 08:30:00', 1, 23),
(3, '2020-11-08 09:00:00', 1, 34);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_employees_id` (`fk_employees_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `delivering_route`
--
ALTER TABLE `delivering_route`
  ADD PRIMARY KEY (`delivering_route_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employees_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `mail_station`
--
ALTER TABLE `mail_station`
  ADD PRIMARY KEY (`mail_station_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `employees` (`fk_employees_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_mail_station_id` (`fk_mail_station_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `delivering_route`
--
ALTER TABLE `delivering_route`
  MODIFY `delivering_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `employees`
--
ALTER TABLE `employees`
  MODIFY `employees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT für Tabelle `mail_station`
--
ALTER TABLE `mail_station`
  MODIFY `mail_station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`fk_employees_id`) REFERENCES `employees` (`employees_id`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `delivering_route`
--
ALTER TABLE `delivering_route`
  ADD CONSTRAINT `delivering_route_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `delivering_route_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `mail_station`
--
ALTER TABLE `mail_station`
  ADD CONSTRAINT `employees` FOREIGN KEY (`fk_employees_id`) REFERENCES `employees` (`employees_id`),
  ADD CONSTRAINT `mail_station_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `mail_station_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_mail_station_id`) REFERENCES `mail_station` (`mail_station_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
