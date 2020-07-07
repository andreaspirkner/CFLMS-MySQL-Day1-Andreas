-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 07. Jul 2020 um 13:12
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `andreas_test`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bids`
--

CREATE TABLE `Bids` (
  `ID_BIDS` int(10) NOT NULL,
  `AMOUNT` int(10) NOT NULL,
  `DATE` int(11) NOT NULL,
  `TIME` int(11) NOT NULL,
  `ID_SETS` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Customers`
--

CREATE TABLE `Customers` (
  `ID_CUSTOMERS` int(10) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` tinytext NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `EMAIL` tinytext DEFAULT NULL,
  `ID_BIDS` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Products`
--

CREATE TABLE `Products` (
  `ID_PRODUCTS` int(10) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `PICTURE` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SETS`
--

CREATE TABLE `SETS` (
  `ID_SETS` int(10) NOT NULL,
  `CATALOGUE_NO` int(20) NOT NULL,
  `START_PRICE` int(10) NOT NULL,
  `HIGHEST_BID` int(10) DEFAULT NULL,
  `TIME_REMAINING` time DEFAULT NULL,
  `ID_PRODUCTS` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Bids`
--
ALTER TABLE `Bids`
  ADD PRIMARY KEY (`ID_BIDS`),
  ADD KEY `ID_SETS` (`ID_SETS`);

--
-- Indizes für die Tabelle `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`ID_CUSTOMERS`),
  ADD KEY `ID_BIDS` (`ID_BIDS`);

--
-- Indizes für die Tabelle `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ID_PRODUCTS`);

--
-- Indizes für die Tabelle `SETS`
--
ALTER TABLE `SETS`
  ADD PRIMARY KEY (`ID_SETS`),
  ADD KEY `ID_PRODUCTS` (`ID_PRODUCTS`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Bids`
--
ALTER TABLE `Bids`
  ADD CONSTRAINT `Bids_ibfk_1` FOREIGN KEY (`ID_SETS`) REFERENCES `SETS` (`ID_SETS`);

--
-- Constraints der Tabelle `Customers`
--
ALTER TABLE `Customers`
  ADD CONSTRAINT `Customers_ibfk_1` FOREIGN KEY (`ID_BIDS`) REFERENCES `Bids` (`ID_BIDS`);

--
-- Constraints der Tabelle `SETS`
--
ALTER TABLE `SETS`
  ADD CONSTRAINT `SETS_ibfk_1` FOREIGN KEY (`ID_PRODUCTS`) REFERENCES `Products` (`ID_PRODUCTS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
