-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 07. Jul 2020 um 15:16
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
-- Datenbank: `Health Center`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Doctors`
--

CREATE TABLE `Doctors` (
  `Code` int(4) NOT NULL,
  `Name` text NOT NULL,
  `Speciality` text NOT NULL,
  `Unit_ID` int(10) NOT NULL,
  `Social_Security_Number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Interventions`
--

CREATE TABLE `Interventions` (
  `Interventions_ID` int(20) NOT NULL,
  `Symptom` text NOT NULL,
  `Treatment` text NOT NULL,
  `Date` date NOT NULL,
  `Social_Security_Number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Patients`
--

CREATE TABLE `Patients` (
  `Social_Security_Number` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Date_Admission` date NOT NULL,
  `Code` int(20) NOT NULL,
  `Interventions_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Unit`
--

CREATE TABLE `Unit` (
  `Unit_ID` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Floor` int(3) NOT NULL,
  `Code` int(20) NOT NULL,
  `Social_Security_Number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `Unit_ID` (`Unit_ID`),
  ADD KEY `Social_Security_Number` (`Social_Security_Number`);

--
-- Indizes für die Tabelle `Interventions`
--
ALTER TABLE `Interventions`
  ADD PRIMARY KEY (`Interventions_ID`),
  ADD KEY `Social_Security_Number` (`Social_Security_Number`);

--
-- Indizes für die Tabelle `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`Social_Security_Number`),
  ADD KEY `Code` (`Code`),
  ADD KEY `Interventions_ID` (`Interventions_ID`);

--
-- Indizes für die Tabelle `Unit`
--
ALTER TABLE `Unit`
  ADD PRIMARY KEY (`Unit_ID`),
  ADD KEY `Code` (`Code`),
  ADD KEY `Social_Security_Number` (`Social_Security_Number`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Doctors`
--
ALTER TABLE `Doctors`
  ADD CONSTRAINT `Doctors_ibfk_1` FOREIGN KEY (`Unit_ID`) REFERENCES `Unit` (`Unit_ID`),
  ADD CONSTRAINT `Doctors_ibfk_2` FOREIGN KEY (`Social_Security_Number`) REFERENCES `Patients` (`Social_Security_Number`);

--
-- Constraints der Tabelle `Interventions`
--
ALTER TABLE `Interventions`
  ADD CONSTRAINT `Interventions_ibfk_1` FOREIGN KEY (`Social_Security_Number`) REFERENCES `Patients` (`Social_Security_Number`);

--
-- Constraints der Tabelle `Patients`
--
ALTER TABLE `Patients`
  ADD CONSTRAINT `Patients_ibfk_1` FOREIGN KEY (`Code`) REFERENCES `Doctors` (`Code`),
  ADD CONSTRAINT `Patients_ibfk_2` FOREIGN KEY (`Interventions_ID`) REFERENCES `Interventions` (`Interventions_ID`);

--
-- Constraints der Tabelle `Unit`
--
ALTER TABLE `Unit`
  ADD CONSTRAINT `Unit_ibfk_1` FOREIGN KEY (`Code`) REFERENCES `Doctors` (`Code`),
  ADD CONSTRAINT `Unit_ibfk_2` FOREIGN KEY (`Social_Security_Number`) REFERENCES `Patients` (`Social_Security_Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
