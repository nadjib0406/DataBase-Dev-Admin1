-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 02:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `date_naissance` date NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `gender` enum('Male','female') DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp(),
  `utilisateurs_nom` varchar(15) DEFAULT NULL,
  `utilisateurs_prenom` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `nom`, `prenom`, `date_naissance`, `telephone`, `gender`, `adresse`, `description`, `date_inscription`, `utilisateurs_nom`, `utilisateurs_prenom`) VALUES
(12, 'Nadjib', 'Mediouni', '2003-06-04', '0792716993', 'Male', 'Canastel, Oran', 'Maladie de Gencive ', '2025-05-16 16:48:34', NULL, NULL),
(13, 'Mohamed', 'Amina', '2005-05-06', '0772800254', 'female', 'Usto, Oran', 'Diabetic ', '2025-05-16 17:22:10', NULL, NULL),
(15, 'Ibrahim', 'Ali', '2010-05-07', '066565898', 'Male', 'Courbi, Oran', 'Hypertension', '2025-05-16 17:36:51', 'Mihamed', 'islam'),
(16, 'Hasnia', 'Alia', '2005-04-05', '07457469', 'female', 'Usto, Oran', 'Patient Hypertendu', '2025-05-21 22:32:13', NULL, NULL),
(17, 'Nadir', 'Akram', '2003-12-05', '06989657', 'Male', 'Cite Petit, Oran', 'Le patient et Diabetic ', '2025-05-21 22:39:26', NULL, NULL),
(18, 'Sarah', 'Houaria', '1982-05-03', '05879658', 'female', 'Plateau, Oran', 'le patient a une Allergie Anesthesie', '2025-05-21 22:42:09', NULL, NULL),
(19, 'Aymen', 'Mahdi', '2003-09-04', '07918372', 'Male', 'Canastel, Oran', 'patient malade', '2025-05-21 22:56:11', NULL, NULL),
(21, 'abdou', 'Walid', '2000-05-06', '07927513', 'Male', 'usto, Oran', 'Malade', '2025-05-21 23:28:16', 'Mohamed', 'Ilyes'),
(22, 'abdou', 'Walid', '2000-05-06', '07927513', 'Male', 'usto, Oran', 'Malade', '2025-05-21 23:28:16', 'Mohamed', 'Ilyes');

-- --------------------------------------------------------

--
-- Table structure for table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `patients_nom` varchar(10) NOT NULL,
  `patients_prenom` varchar(10) NOT NULL,
  `date_rdv` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `utilisateurs_nom` varchar(100) DEFAULT NULL,
  `utilisateurs_prenom` varchar(100) DEFAULT NULL,
  `statut` enum('Completed','Missed') NOT NULL,
  `diagnostic` text DEFAULT NULL,
  `utilisateurs_role` enum('interne','Resident 1','Resident 2','Resident 3','Resident 4','Enseignant') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rendez_vous`
--

INSERT INTO `rendez_vous` (`patients_nom`, `patients_prenom`, `date_rdv`, `description`, `utilisateurs_nom`, `utilisateurs_prenom`, `statut`, `diagnostic`, `utilisateurs_role`) VALUES
('abdou', 'Walid', '2025-05-22 08:55:00', 'dent n6', 'Mohamed', 'Ilyes', '', 'Eclaircissements', 'Resident 3'),
('Aymen', 'Mahdi', '2025-05-22 15:05:00', 'dent n 6', 'Amina', 'Abdou', '', 'Restauration corono-radiculaire sur dent postérieure', 'interne'),
('Hasnia', 'Alia', '2025-05-22 10:00:00', 'Dent n 5', 'Amina', 'Abdou', '', 'Coiffage dentino-pulpaire', 'interne'),
('Ibrahim', 'Ali', '2025-05-18 09:45:00', 'yter', 'ch', 'Nadjib', 'Missed', 'tt', 'Enseignant'),
('Ibrahim', 'Ali', '2025-05-19 15:15:00', 'malade', 'Mihamed', 'islam', 'Missed', 'Traitement des fractures radiculaires', 'Resident 3'),
('Ibrahim', 'Ali', '2025-05-20 09:45:00', 'malade', 'ch', 'Nadjib', 'Completed', 'dd', 'Enseignant'),
('Ibrahim', 'Ali', '2025-05-21 13:00:00', 'eee', 'Mihamed', 'islam', 'Completed', 'Traitement des fractures radiculaires', 'Resident 3'),
('Ibrahim', 'Ali', '2025-05-22 11:30:00', 'Dent n 32', 'Mohamed', 'sawer', '', 'Thérapeutique dentinaire et préparation de cavité pour classe I', 'Resident 1'),
('Mohamed', 'Amina', '2025-05-22 08:45:00', 'Dent n 6', 'Mohamed', 'Ilyes', '', 'Thérapeutiques restauratrices sur dent antérieure vivante', 'Resident 3'),
('Nadir', 'Akram', '2025-05-22 13:45:00', 'Dent n 20', 'Chaimaa', 'Nawel', '', 'Revitalisation', 'Resident 4'),
('Nadjib', 'Mediouni', '2025-05-04 16:00:00', 'sss', 'Dog', 'Med', 'Completed', NULL, 'interne'),
('Nadjib', 'Mediouni', '2025-05-07 09:45:00', 'paierf', 'Dog', 'Med', 'Missed', 'Détartrage', 'interne'),
('Nadjib', 'mediouni', '2025-05-16 11:15:00', 'fff', 'Dog', 'Med', 'Missed', 'Carie dentaire', 'interne'),
('Nadjib', 'Mediouni', '2025-05-17 12:30:00', 'aasasa', 'Mihamed', 'islam', 'Missed', NULL, 'Resident 3'),
('Nadjib', 'Mediouni', '2025-05-20 14:30:00', 'Traite', 'Dog', 'Med', 'Completed', 'Carie dentaire', 'interne'),
('Nadjib', 'Mediouni', '2025-05-20 14:30:00', 'Traite', 'Mihamed', 'islam', 'Missed', 'Thérapeutiques restauratrices sur dent antérieure vivante', 'Resident 3'),
('Nadjib', 'Mediouni', '2025-05-21 14:06:00', 'ddd', 'ch', 'Nadjib', 'Completed', 'dd', 'Enseignant'),
('Nadjib', 'Mediouni', '2025-05-21 15:00:00', 'ffffd', 'Dog', 'Med', 'Missed', 'Biodépulpation sur pluriradiculée', 'interne'),
('Nadjib', 'Mediouni', '2025-05-22 09:30:00', 'dent n 10', 'Abdenour', 'Amine', '', 'Thérapeutique de la dent de 06 ans', 'Resident 2'),
('Sarah', 'Houaria', '2025-05-22 14:30:00', 'Dent n15', 'ch', 'Nadjib', '', 'dd', 'Enseignant'),
('wwww', 'wwwer', '2025-05-06 08:30:00', 'hjuh', 'Dog', 'Med', 'Completed', 'Carie dentaire', 'interne');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mot_de_passe` varchar(20) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `date_creation` date DEFAULT curdate(),
  `role` enum('Enseignant','Resident 1','Resident 2','Resident 3','Resident 4','interne') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `email`, `mot_de_passe`, `telephone`, `date_creation`, `role`) VALUES
(1, 'ch', 'Nadjib', 'nadj', '123', NULL, '2025-04-04', 'Enseignant'),
(6, 'Mohamed', 'Ilyes', 'Ilyes43@gmail.com', '123', '0326598', '2025-05-20', 'Resident 3'),
(7, 'Mohamed', 'sawer', 'Moha66@gmail.com', '123', '01478523', '2025-05-20', 'Resident 1'),
(15, 'Chaimaa', 'Nawel', 'Nwlla25@gmail.com', '123', '05986598', '2025-05-21', 'Resident 4'),
(16, 'Amina', 'Abdou', 'abdam4@gmail.com', '123', '06986598', '2025-05-21', 'interne'),
(17, 'Abdenour', 'Amine', 'amab93@gmail.com', '123', '07898954', '2025-05-21', 'Resident 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`patients_nom`,`patients_prenom`,`date_rdv`,`statut`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
