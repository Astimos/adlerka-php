-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2020 at 08:54 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rozvrh`
--

-- --------------------------------------------------------

--
-- Table structure for table `c_trieda`
--

CREATE TABLE `c_trieda` (
  `idc_trieda` int(11) NOT NULL,
  `nazovc_trieda` varchar(50) NOT NULL,
  `skupna` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_trieda`
--

INSERT INTO `c_trieda` (`idc_trieda`, `nazovc_trieda`, `skupna`) VALUES
(1, '2B', 1),
(2, '1C', 1),
(3, '3B', 1),
(4, '4B', 1);

-- --------------------------------------------------------

--
-- Table structure for table `preklad`
--

CREATE TABLE `preklad` (
  `idpreklad` int(9) NOT NULL,
  `jazyk` varchar(2) NOT NULL,
  `retazec` varchar(100) NOT NULL,
  `preklad` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preklad`
--

INSERT INTO `preklad` (`idpreklad`, `jazyk`, `retazec`, `preklad`) VALUES
(1, 'sk', 'pfg', 'Programovacie a interaktívne prostredia'),
(2, 'en', 'pfg', 'Programming and interactive enviroments');

-- --------------------------------------------------------

--
-- Table structure for table `rozvrh`
--

CREATE TABLE `rozvrh` (
  `idrozvrh` int(9) NOT NULL,
  `den` int(3) NOT NULL,
  `hodiny` int(3) NOT NULL,
  `predmet` varchar(20) NOT NULL,
  `trieda` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rozvrh`
--

INSERT INTO `rozvrh` (`idrozvrh`, `den`, `hodiny`, `predmet`, `trieda`) VALUES
(1, 2, 0, 'PFG', '3B'),
(2, 2, 1, 'PFG', '3B'),
(3, 1, 1, 'TSV', '2A');

-- --------------------------------------------------------

--
-- Table structure for table `uzivatelia`
--

CREATE TABLE `uzivatelia` (
  `idpouzivatelia` int(9) NOT NULL,
  `meno` varchar(50) COLLATE utf8_slovak_ci NOT NULL,
  `prezvisko` varchar(100) COLLATE utf8_slovak_ci NOT NULL,
  `datum_narodenia` date NOT NULL,
  `id_c_trieda` int(3) NOT NULL DEFAULT 0,
  `logname` varchar(150) COLLATE utf8_slovak_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci COMMENT='tabulka z 14.10.2020';

--
-- Dumping data for table `uzivatelia`
--

INSERT INTO `uzivatelia` (`idpouzivatelia`, `meno`, `prezvisko`, `datum_narodenia`, `id_c_trieda`, `logname`, `password`) VALUES
(1, 'Luboš', 'Lošonský', '2019-03-11', 0, 'lubos.losonsky', '7aff03960854665c74950f430469641f755d583c'),
(2, 'Jožo', 'Vajda', '2018-11-13', 0, 'jozko.vajda', '7aff03960854665c74950f430469641f755d583c'),
(3, 'Adam', 'Ambra', '2019-06-11', 0, 'adam.ambra', '7aff03960854665c74950f430469641f755d583c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `c_trieda`
--
ALTER TABLE `c_trieda`
  ADD PRIMARY KEY (`idc_trieda`);

--
-- Indexes for table `preklad`
--
ALTER TABLE `preklad`
  ADD PRIMARY KEY (`idpreklad`);

--
-- Indexes for table `rozvrh`
--
ALTER TABLE `rozvrh`
  ADD PRIMARY KEY (`idrozvrh`);

--
-- Indexes for table `uzivatelia`
--
ALTER TABLE `uzivatelia`
  ADD PRIMARY KEY (`idpouzivatelia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_trieda`
--
ALTER TABLE `c_trieda`
  MODIFY `idc_trieda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `preklad`
--
ALTER TABLE `preklad`
  MODIFY `idpreklad` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rozvrh`
--
ALTER TABLE `rozvrh`
  MODIFY `idrozvrh` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uzivatelia`
--
ALTER TABLE `uzivatelia`
  MODIFY `idpouzivatelia` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
