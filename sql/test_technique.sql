-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 sep. 2021 à 11:20
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test_technique`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

CREATE TABLE `avoir` (
  `id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL,
  `somme` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`id`, `nom`) VALUES
(1, 'Poney club de Paris 16ieme'),
(2, 'Le Figora'),
(3, 'El Mundo'),
(4, 'Ykea'),
(5, 'Tang soeurs'),
(6, 'Rock en Meuse'),
(7, 'Printemps lafayette'),
(8, 'Liroy Merline'),
(9, 'Le Londonien'),
(10, 'Le Centre Pompompidou'),
(11, 'H&M&m\'s');

-- --------------------------------------------------------

--
-- Structure de la table `declaration`
--

CREATE TABLE `declaration` (
  `id` int(11) NOT NULL,
  `total` double NOT NULL,
  `isValid` tinyint(1) NOT NULL,
  `corrective` double NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `declaration`
--

INSERT INTO `declaration` (`id`, `total`, `isValid`, `corrective`, `company_id`) VALUES
(1, 1230000, 0, 23000, 10),
(2, 3400, 1, 0, 1),
(3, 34435345, 0, 3423453, 5),
(4, 1234, 0, 2345, 3),
(5, 126456, 0, 463465, 4),
(6, 34567, 0, 34561, 9),
(7, 34534, 1, 0, 8),
(8, 7654567, 0, 23423, 1),
(9, 87654, 1, 0, 2),
(10, 234534, 0, 234234, 6),
(11, 345, 1, 0, 7),
(12, 32456, 0, 12, 9),
(13, 76543, 1, 0, 5),
(14, 674567456, 0, 4564564, 9),
(15, 345345, 1, 0, 11),
(16, 456456456, 0, 34534556, 3),
(17, 234234, 1, 0, 6),
(18, 345345, 0, 1234, 7),
(19, 354345, 0, 12344, 8),
(20, 98734, 0, 234234, 10),
(21, 342345, 0, 34532, 2),
(22, 867564, 1, 0, 6),
(23, 45634563, 0, 56756757, 8),
(24, 345345, 1, 0, 9);

-- --------------------------------------------------------

--
-- Structure de la table `regularisation`
--

CREATE TABLE `regularisation` (
  `id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `declaration`
--
ALTER TABLE `declaration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Index pour la table `regularisation`
--
ALTER TABLE `regularisation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avoir`
--
ALTER TABLE `avoir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `declaration`
--
ALTER TABLE `declaration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `regularisation`
--
ALTER TABLE `regularisation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
