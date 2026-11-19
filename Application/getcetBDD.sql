-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 15 nov. 2026 à 22:19
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `getcet`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheter`
--

DROP TABLE IF EXISTS `acheter`;
CREATE TABLE IF NOT EXISTS `acheter` (
  `idAcheteur` int NOT NULL,
  `idArticle` int NOT NULL,
  `refProduit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prixAchat` decimal(5,2) DEFAULT NULL,
  `dateAchat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAcheteur`,`idArticle`,`refProduit`),
  KEY `idArticle` (`idArticle`,`refProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acheter`
--

INSERT INTO `acheter` (`idAcheteur`, `idArticle`, `refProduit`, `prixAchat`, `dateAchat`) VALUES
(1, 4, 'BTEAU', 0.99, '2024-09-02 00:00:00'),
(1, 5, 'BTEAU', 0.99, '2024-09-02 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

DROP TABLE IF EXISTS `acheteur`;
CREATE TABLE IF NOT EXISTS `acheteur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idHabitant` int NOT NULL,
  `idFoyer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `acheteur_ibfk_1` (`idHabitant`,`idFoyer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `idHabitant`, `idFoyer`) VALUES
(3, 1, 1),
(1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refProduit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datePeremption` date NOT NULL,
  `idEtat` int DEFAULT NULL,
  PRIMARY KEY (`id`,`refProduit`),
  KEY `refProduit` (`refProduit`),
  KEY `idEtat` (`idEtat`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `refProduit`, `datePeremption`, `idEtat`) VALUES
(1, 'BTEAU', '2024-09-08', 4),
(1, 'BTORA', '2024-10-08', 6),
(1, 'BTPOM', '2024-10-25', 6),
(1, 'FLPDT', '2024-12-01', 1),
(1, 'PMI', '2024-09-12', 3),
(2, 'BTEAU', '2024-09-15', 3),
(2, 'BTORA', '2024-10-08', 2),
(2, 'PMI', '2024-09-18', 2),
(3, 'BTEAU', '2024-10-01', 2),
(3, 'BTORA', '2024-10-08', 2),
(4, 'BTEAU', '2024-10-01', 5),
(5, 'BTEAU', '2024-10-01', 5),
(6, 'BTEAU', '2025-01-01', 1),
(7, 'BTEAU', '2025-01-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `civilite`
--

DROP TABLE IF EXISTS `civilite`;
CREATE TABLE IF NOT EXISTS `civilite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `civilite`
--

INSERT INTO `civilite` (`id`, `libelle`) VALUES
(1, 'Mr'),
(2, 'Mme'),
(3, 'Non défini');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int NOT NULL,
  `idAcheteur` int NOT NULL,
  `dateCommande` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prixTotal` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAcheteur` (`idAcheteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `idAcheteur`, `dateCommande`, `prixTotal`) VALUES
(1, 1, '2024-09-03 00:00:00', 2.45);

-- --------------------------------------------------------

--
-- Structure de la table `commercant`
--

DROP TABLE IF EXISTS `commercant`;
CREATE TABLE IF NOT EXISTS `commercant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idHabitant` int NOT NULL,
  `idFoyer` int NOT NULL,
  `idCommerce` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idHabitant` (`idHabitant`,`idFoyer`),
  KEY `idCommerce` (`idCommerce`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commercant`
--

INSERT INTO `commercant` (`id`, `idHabitant`, `idFoyer`, `idCommerce`) VALUES
(1, 1, 4, 1),
(2, 2, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commerce`
--

DROP TABLE IF EXISTS `commerce`;
CREATE TABLE IF NOT EXISTS `commerce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codePostal` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commerce`
--

INSERT INTO `commerce` (`id`, `nom`, `rue`, `codePostal`, `ville`) VALUES
(1, 'Superette', '1 rue du littoral', '83945', 'Getcet sur Mer');

-- --------------------------------------------------------

--
-- Structure de la table `donner`
--

DROP TABLE IF EXISTS `donner`;
CREATE TABLE IF NOT EXISTS `donner` (
  `idCommerce` int NOT NULL,
  `refProduit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateJour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prixOrigine` decimal(5,2) DEFAULT NULL,
  `qte` int DEFAULT NULL,
  PRIMARY KEY (`idCommerce`,`refProduit`,`dateJour`),
  KEY `refProduit` (`refProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `idEmploye` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateEmbauche` date NOT NULL,
  `numRole` int DEFAULT NULL,
  PRIMARY KEY (`idEmploye`),
  KEY `fk_employe_role` (`numRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`idEmploye`, `nom`, `prenom`, `login`, `mdp`, `telephone`, `mail`, `dateEmbauche`, `numRole`) VALUES
(1, 'Erateur', 'Maude', 'merateur', 'ab4f63f9ac65152575886860dde480a1', '04699786756', 'maude.erateur@getcet.fr', '2023-03-19', 3),
(2, 'Neymar', 'Jean', 'jneymar', 'e10adc3949ba59abbe56e057f20f883e', '', 'jean.neymar@getcet.fr', '2005-07-08', 2),
(3, 'Bonboeur', 'Jean', 'jbonboeur', 'c3eddf7a6f989cef41d02869e1118a3f', '0610121314', 'jeanbonboeur@gmail.com', '2024-09-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `etatarticle`
--

DROP TABLE IF EXISTS `etatarticle`;
CREATE TABLE IF NOT EXISTS `etatarticle` (
  `id` int NOT NULL,
  `libelle` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etatarticle`
--

INSERT INTO `etatarticle` (`id`, `libelle`) VALUES
(1, 'Enregistré'),
(2, 'En vente'),
(3, 'Périssable'),
(4, 'Périmé'),
(5, 'Acheté'),
(6, 'Commandé'),
(7, 'Livré'),
(8, 'Jeté'),
(9, 'Donné');

-- --------------------------------------------------------

--
-- Structure de la table `foyer`
--

DROP TABLE IF EXISTS `foyer`;
CREATE TABLE IF NOT EXISTS `foyer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rue` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codePostal` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateInstallation` date NOT NULL,
  `justificatifsValides` tinyint(1) NOT NULL DEFAULT '0',
  `mail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephoneFixe` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `foyer`
--

INSERT INTO `foyer` (`id`, `rue`, `codePostal`, `ville`, `dateInstallation`, `justificatifsValides`, `mail`, `telephoneFixe`) VALUES
(1, '150 rue du littoral', '83945', 'Getcet sur Mer', '2000-08-01', 1, NULL, 0),
(2, '10 rue des oursins', '83945', 'Getcet sur Mer', '2022-01-01', 1, NULL, 0),
(3, '1 rue du midi', '83945', 'Getcet sur Mer', '2012-03-01', 0, NULL, 0),
(4, 'Square de la Plage', '83945', 'Getcet sur Mer', '1998-11-02', 1, NULL, 0),
(5, '1 rue du littoral', '83945', 'Getcet sur Mer', '2023-03-01', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `habitant`
--

DROP TABLE IF EXISTS `habitant`;
CREATE TABLE IF NOT EXISTS `habitant` (
  `idHabitant` int NOT NULL,
  `idFoyer` int NOT NULL,
  `idCivilite` int DEFAULT NULL,
  `Nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNaiss` date NOT NULL,
  `mail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephonePortable` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciValide` int DEFAULT '0',
  `dateValidation` date DEFAULT NULL,
  `idEmployeValidation` int DEFAULT NULL,
  PRIMARY KEY (`idHabitant`,`idFoyer`),
  KEY `idFoyer` (`idFoyer`),
  KEY `idCivilite` (`idCivilite`),
  KEY `idEmployeValidation` (`idEmployeValidation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `habitant`
--

INSERT INTO `habitant` (`idHabitant`, `idFoyer`, `idCivilite`, `Nom`, `prenom`, `dateNaiss`, `mail`, `telephonePortable`, `ciValide`, `dateValidation`, `idEmployeValidation`) VALUES
(1, 1, 1, 'Ochon', 'Tomy', '1973-04-11', 'paulochon@mail.fr', '0612345678', 1, '2012-08-01', 1),
(1, 2, 1, 'Egerie', 'Tom', '1945-02-28', 'tom@mail.fr', '0709876543', 1, '2022-03-08', 1),
(1, 3, 1, 'Houtan', 'Laurent', '1985-05-21', 'laurenthoutan@mail.com', '0601030405', 1, '2026-11-12', 2),
(1, 4, 1, 'Verse', 'Alain', '1978-11-26', 'alainverse@mail.fr', '0701878543', 1, '2015-03-25', 1),
(1, 5, 3, 'Lebrize', 'Sam', '1985-07-05', 'sam@mail.fr', '0709943534', 1, '2023-03-01', 1),
(2, 1, 2, 'Ochon', 'Viviane', '1975-06-18', 'vochon@mail.fr', '0612345679', 1, '2012-08-01', 1),
(2, 4, 2, 'Touille', 'Sacha', '1980-07-05', 'sacha@mail.fr', '0709871234', 1, '2017-03-08', 1),
(3, 1, 1, 'Ochon', 'Paul', '2006-06-21', 'tochon@mail.fr', '0612345680', 1, '2020-08-28', 1),
(4, 1, 1, 'Peuple', 'Jean', '0000-00-00', 'Peuplu.Jean@mail.com', '0605040302', 1, '2026-11-15', 2),
(5, 1, 1, 'Jean', 'Peuplu', '2020-12-10', 'Peuplu.Jean@mail.com', '0611223344', 1, '2026-11-15', 2);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `idCommande` int NOT NULL,
  `idArticle` int NOT NULL,
  `refProduit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prixAchat` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idCommande`,`idArticle`,`refProduit`),
  KEY `idArticle` (`idArticle`,`refProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`idCommande`, `idArticle`, `refProduit`, `prixAchat`) VALUES
(1, 1, 'BTORA', 1.20),
(1, 1, 'BTPOM', 1.25);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `reference` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qteStock` int NOT NULL,
  `prix` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`reference`, `designation`, `qteStock`, `prix`) VALUES
('BTEAU', 'Bouteille eau', 6, 1.00),
('BTORA', 'Jus orange', 3, 1.20),
('BTPOM', 'Jus pomme', 1, 1.25),
('FLPDT', 'Filet de pommes de terre de 2kg', 1, 2.00),
('PMI', 'Pain de mie', 2, 0.89);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `numRole` int NOT NULL AUTO_INCREMENT,
  `libelleRole` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`numRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`numRole`, `libelleRole`) VALUES
(1, 'Employe'),
(2, 'Secrétaire'),
(3, 'Maire');

-- --------------------------------------------------------

--
-- Structure de la table `vendre`
--

DROP TABLE IF EXISTS `vendre`;
CREATE TABLE IF NOT EXISTS `vendre` (
  `idCommerce` int NOT NULL,
  `refProduit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateJour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prixOrigine` decimal(5,2) DEFAULT NULL,
  `prixSolidaire` decimal(5,2) DEFAULT NULL,
  `qte` int DEFAULT NULL,
  PRIMARY KEY (`idCommerce`,`refProduit`,`dateJour`),
  KEY `refProduit` (`refProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vendre`
--

INSERT INTO `vendre` (`idCommerce`, `refProduit`, `dateJour`, `prixOrigine`, `prixSolidaire`, `qte`) VALUES
(1, 'BTEAU', '2024-08-28 00:00:00', 1.29, 0.99, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acheter`
--
ALTER TABLE `acheter`
  ADD CONSTRAINT `acheter_ibfk_1` FOREIGN KEY (`idArticle`,`refProduit`) REFERENCES `article` (`id`, `refProduit`),
  ADD CONSTRAINT `acheter_ibfk_2` FOREIGN KEY (`idAcheteur`) REFERENCES `acheteur` (`id`);

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `acheteur_ibfk_1` FOREIGN KEY (`idHabitant`,`idFoyer`) REFERENCES `habitant` (`idHabitant`, `idFoyer`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`refProduit`) REFERENCES `produit` (`reference`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`idEtat`) REFERENCES `etatarticle` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idAcheteur`) REFERENCES `acheteur` (`id`);

--
-- Contraintes pour la table `commercant`
--
ALTER TABLE `commercant`
  ADD CONSTRAINT `commercant_ibfk_1` FOREIGN KEY (`idHabitant`,`idFoyer`) REFERENCES `habitant` (`idHabitant`, `idFoyer`),
  ADD CONSTRAINT `commercant_ibfk_2` FOREIGN KEY (`idCommerce`) REFERENCES `commerce` (`id`);

--
-- Contraintes pour la table `donner`
--
ALTER TABLE `donner`
  ADD CONSTRAINT `donner_ibfk_1` FOREIGN KEY (`refProduit`) REFERENCES `produit` (`reference`),
  ADD CONSTRAINT `donner_ibfk_2` FOREIGN KEY (`idCommerce`) REFERENCES `commerce` (`id`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `fk_employe_role` FOREIGN KEY (`numRole`) REFERENCES `role` (`numRole`);

--
-- Contraintes pour la table `habitant`
--
ALTER TABLE `habitant`
  ADD CONSTRAINT `habitant_ibfk_1` FOREIGN KEY (`idFoyer`) REFERENCES `foyer` (`id`),
  ADD CONSTRAINT `habitant_ibfk_2` FOREIGN KEY (`idCivilite`) REFERENCES `civilite` (`id`),
  ADD CONSTRAINT `habitant_ibfk_3` FOREIGN KEY (`idEmployeValidation`) REFERENCES `employe` (`idEmploye`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`idArticle`,`refProduit`) REFERENCES `article` (`id`, `refProduit`),
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`);

--
-- Contraintes pour la table `vendre`
--
ALTER TABLE `vendre`
  ADD CONSTRAINT `vendre_ibfk_1` FOREIGN KEY (`refProduit`) REFERENCES `produit` (`reference`),
  ADD CONSTRAINT `vendre_ibfk_2` FOREIGN KEY (`idCommerce`) REFERENCES `commerce` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
