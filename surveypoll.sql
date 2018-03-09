-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 09 mars 2018 à 09:38
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `surveypoll`
--

-- --------------------------------------------------------

--
-- Structure de la table `decision`
--

DROP TABLE IF EXISTS `decision`;
CREATE TABLE IF NOT EXISTS `decision` (
  `id_decision` int(11) NOT NULL AUTO_INCREMENT,
  `AVote` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_decision`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `decision`
--

INSERT INTO `decision` (`id_decision`, `AVote`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

DROP TABLE IF EXISTS `reponses`;
CREATE TABLE IF NOT EXISTS `reponses` (
  `id_reponse` int(11) NOT NULL AUTO_INCREMENT,
  `reponse` varchar(255) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `id_sondage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reponse`),
  KEY `FK_Reponses_id_sondage` (`id_sondage`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponses`
--

INSERT INTO `reponses` (`id_reponse`, `reponse`, `vote`, `id_sondage`) VALUES
(1, 'Forrest Gump', 1, 1),
(2, 'John Wick', 0, 1),
(3, 'Le Seigneur des Anneaux', 0, 1),
(4, 'Thierry Henry', 0, 2),
(5, 'Johan Cruyff', 0, 2),
(6, 'Dennis Bergkamp', 0, 2),
(7, 'George Weah', 0, 2),
(8, 'Pelé', 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `sondage`
--

DROP TABLE IF EXISTS `sondage`;
CREATE TABLE IF NOT EXISTS `sondage` (
  `id_sondage` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sondage`),
  KEY `FK_Sondage_id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sondage`
--

INSERT INTO `sondage` (`id_sondage`, `question`, `URL`, `id_user`) VALUES
(1, 'Quel est le meilleur film', 'surveypoll/AGjd78d', 2),
(2, 'Qui est le meilleur joueur de foot?', 'surveypoll/GH48fg1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Pseudo` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `Prenom`, `Nom`, `Pseudo`, `Password`, `Mail`) VALUES
(1, 'Philippe', 'HAURET', 'AUPA', '123', 'venteuil.oreste@gmail.com'),
(2, 'Thierry', 'XIONG', 'Yiiming', '123', 'xiongthierry@hotmail.fr');

-- --------------------------------------------------------

--
-- Structure de la table `voter`
--

DROP TABLE IF EXISTS `voter`;
CREATE TABLE IF NOT EXISTS `voter` (
  `id_sondage` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_decision` int(11) NOT NULL,
  PRIMARY KEY (`id_sondage`,`id_user`,`id_decision`),
  KEY `FK_Voter_id_user` (`id_user`),
  KEY `FK_Voter_id_decision` (`id_decision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `voter`
--

INSERT INTO `voter` (`id_sondage`, `id_user`, `id_decision`) VALUES
(1, 2, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD CONSTRAINT `FK_Reponses_id_sondage` FOREIGN KEY (`id_sondage`) REFERENCES `sondage` (`id_sondage`);

--
-- Contraintes pour la table `sondage`
--
ALTER TABLE `sondage`
  ADD CONSTRAINT `FK_Sondage_id_user` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`);

--
-- Contraintes pour la table `voter`
--
ALTER TABLE `voter`
  ADD CONSTRAINT `FK_Voter_id_decision` FOREIGN KEY (`id_decision`) REFERENCES `decision` (`id_decision`),
  ADD CONSTRAINT `FK_Voter_id_sondage` FOREIGN KEY (`id_sondage`) REFERENCES `sondage` (`id_sondage`),
  ADD CONSTRAINT `FK_Voter_id_user` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
