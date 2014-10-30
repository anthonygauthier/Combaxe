-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 30 Octobre 2014 à 16:05
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `combaxe`
--

DROP TABLE IF EXISTS CompetencesProfessions;
DROP TABLE IF EXISTS CompetencesEnnemis;
DROP TABLE IF EXISTS Competences;
DROP TABLE IF EXISTS TypesCompetences;
DROP TABLE IF EXISTS Effets;
DROP TABLE IF EXISTS EquipementsPersonnages;
DROP TABLE IF EXISTS InventairesEquipements;
DROP TABLE IF EXISTS Equipements;
DROP TABLE IF EXISTS CaracteristiquesPersonnages;
DROP TABLE IF EXISTS CaracteristiquesEquipementsModeles;
DROP TABLE IF EXISTS CaracteristiquesEnnemis;
DROP TABLE IF EXISTS CaracteristiquesProfessions;
DROP TABLE IF EXISTS Personnages;
DROP TABLE IF EXISTS Professions;
DROP TABLE IF EXISTS Statistiques;
DROP TABLE IF EXISTS Caracteristiques;
DROP TABLE IF EXISTS EquipementsModeles;
DROP TABLE IF EXISTS Modeles;
DROP TABLE IF EXISTS Ennemis;
DROP TABLE IF EXISTS Inventaires;
DROP TABLE IF EXISTS Joueurs;

-- --------------------------------------------------------

--
-- Structure de la table `caracteristiques`
--

CREATE TABLE IF NOT EXISTS `caracteristiques` (
  `idCaracteristique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(31) NOT NULL,
  PRIMARY KEY (`idCaracteristique`),
  UNIQUE KEY `idCaracteristique` (`idCaracteristique`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `caracteristiques`
--

INSERT INTO `caracteristiques` (`idCaracteristique`, `nom`) VALUES
(4, 'Défense'),
(5, 'Énergie'),
(1, 'Force'),
(2, 'Vie'),
(3, 'Vitesse');

-- --------------------------------------------------------

--
-- Structure de la table `caracteristiquesennemis`
--

CREATE TABLE IF NOT EXISTS `caracteristiquesennemis` (
  `idCaracteristiqueEnnemi` int(11) NOT NULL AUTO_INCREMENT,
  `idCaracteristique` int(11) NOT NULL,
  `idEnnemi` int(11) NOT NULL,
  `valeur` int(11) NOT NULL,
  PRIMARY KEY (`idCaracteristiqueEnnemi`),
  UNIQUE KEY `idCaracteristiqueEnnemi` (`idCaracteristiqueEnnemi`),
  KEY `CaracteristiquesEnnemis_Ennemis_FK` (`idEnnemi`),
  KEY `CaracteristiquesEnnemis_Caracteristiques_FK` (`idCaracteristique`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=151 ;

--
-- Contenu de la table `caracteristiquesennemis`
--

INSERT INTO `caracteristiquesennemis` (`idCaracteristiqueEnnemi`, `idCaracteristique`, `idEnnemi`, `valeur`) VALUES
(1, 1, 1, 8),
(2, 2, 1, 17),
(3, 3, 1, 5),
(4, 4, 1, 13),
(5, 5, 1, 16),
(6, 1, 2, 35),
(7, 2, 2, 23),
(8, 3, 2, 14),
(9, 4, 2, 25),
(10, 5, 2, 12),
(11, 1, 3, 15),
(12, 2, 3, 39),
(13, 3, 3, 27),
(14, 4, 3, 42),
(15, 5, 3, 31),
(16, 1, 4, 10),
(17, 2, 4, 45),
(18, 3, 4, 36),
(19, 4, 4, 53),
(20, 5, 4, 31),
(21, 1, 5, 23),
(22, 4, 5, 39),
(23, 2, 5, 53),
(24, 3, 5, 75),
(25, 5, 5, 20),
(26, 1, 6, 67),
(27, 4, 6, 82),
(28, 2, 6, 72),
(29, 3, 6, 61),
(30, 5, 6, 59),
(31, 1, 7, 5),
(32, 4, 7, 5),
(33, 2, 7, 5),
(34, 3, 7, 5),
(35, 5, 7, 5),
(36, 1, 8, 5),
(37, 4, 8, 5),
(38, 2, 8, 5),
(39, 3, 8, 5),
(40, 5, 8, 5),
(41, 1, 9, 5),
(42, 4, 9, 5),
(43, 2, 9, 5),
(44, 3, 9, 5),
(45, 5, 9, 5),
(46, 1, 10, 5),
(47, 4, 10, 5),
(48, 2, 10, 5),
(49, 3, 10, 5),
(50, 5, 10, 5),
(51, 1, 11, 5),
(52, 4, 11, 5),
(53, 2, 11, 5),
(54, 3, 11, 5),
(55, 5, 11, 5),
(56, 1, 12, 5),
(57, 4, 12, 5),
(58, 2, 12, 5),
(59, 3, 12, 5),
(60, 5, 12, 5),
(61, 1, 13, 5),
(62, 4, 13, 5),
(63, 2, 13, 5),
(64, 3, 13, 5),
(65, 5, 13, 5),
(66, 1, 14, 5),
(67, 4, 14, 5),
(68, 2, 14, 5),
(69, 3, 14, 5),
(70, 5, 14, 5),
(71, 1, 15, 5),
(72, 4, 15, 5),
(73, 2, 15, 5),
(74, 3, 15, 5),
(75, 5, 15, 5),
(76, 1, 16, 5),
(77, 4, 16, 5),
(78, 2, 16, 5),
(79, 3, 16, 5),
(80, 5, 16, 5),
(81, 1, 17, 5),
(82, 4, 17, 5),
(83, 2, 17, 5),
(84, 3, 17, 5),
(85, 5, 17, 5),
(86, 1, 18, 5),
(87, 4, 18, 5),
(88, 2, 18, 5),
(89, 3, 18, 5),
(90, 5, 18, 5),
(91, 1, 19, 5),
(92, 4, 19, 5),
(93, 2, 19, 5),
(94, 3, 19, 5),
(95, 5, 19, 5),
(96, 1, 20, 5),
(97, 4, 20, 5),
(98, 2, 20, 5),
(99, 3, 20, 5),
(100, 5, 20, 5),
(101, 1, 21, 5),
(102, 4, 21, 5),
(103, 2, 21, 5),
(104, 3, 21, 5),
(105, 5, 21, 5),
(106, 1, 22, 5),
(107, 4, 22, 5),
(108, 2, 22, 5),
(109, 3, 22, 5),
(110, 5, 22, 5),
(111, 1, 23, 5),
(112, 4, 23, 5),
(113, 2, 23, 5),
(114, 3, 23, 5),
(115, 5, 23, 5),
(116, 1, 24, 5),
(117, 4, 24, 5),
(118, 2, 24, 5),
(119, 3, 24, 5),
(120, 5, 24, 5),
(121, 1, 25, 5),
(122, 4, 25, 5),
(123, 2, 25, 5),
(124, 3, 25, 5),
(125, 5, 25, 5),
(126, 1, 26, 5),
(127, 4, 26, 5),
(128, 2, 26, 5),
(129, 3, 26, 5),
(130, 5, 26, 5),
(131, 1, 27, 5),
(132, 4, 27, 5),
(133, 2, 27, 5),
(134, 3, 27, 5),
(135, 5, 27, 5),
(136, 1, 28, 5),
(137, 4, 28, 5),
(138, 2, 28, 5),
(139, 3, 28, 5),
(140, 5, 28, 5),
(141, 1, 29, 5),
(142, 4, 29, 5),
(143, 2, 29, 5),
(144, 3, 29, 5),
(145, 5, 29, 5),
(146, 1, 30, 5),
(147, 4, 30, 5),
(148, 2, 30, 5),
(149, 3, 30, 5),
(150, 5, 30, 5);

-- --------------------------------------------------------

--
-- Structure de la table `caracteristiquesequipementsmodeles`
--

CREATE TABLE IF NOT EXISTS `caracteristiquesequipementsmodeles` (
  `idCaracteristiqueEquipementModele` int(11) NOT NULL AUTO_INCREMENT,
  `idCaracteristique` int(11) NOT NULL,
  `idEquipementModele` int(11) NOT NULL,
  `valeur` int(11) NOT NULL,
  PRIMARY KEY (`idCaracteristiqueEquipementModele`),
  UNIQUE KEY `idCaracteristiqueEquipementModele` (`idCaracteristiqueEquipementModele`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

--
-- Contenu de la table `caracteristiquesequipementsmodeles`
--

INSERT INTO `caracteristiquesequipementsmodeles` (`idCaracteristiqueEquipementModele`, `idCaracteristique`, `idEquipementModele`, `valeur`) VALUES
(1, 1, 109, 1),
(2, 4, 109, 3),
(3, 2, 109, 2),
(4, 5, 110, 3),
(5, 4, 110, 1),
(6, 2, 110, 2),
(7, 1, 111, 2),
(8, 4, 111, 2),
(9, 2, 111, 1),
(10, 5, 112, 2),
(11, 4, 112, 1),
(12, 2, 112, 2),
(13, 1, 113, 1),
(14, 4, 113, 1),
(15, 5, 114, 1),
(16, 3, 114, 1),
(17, 2, 115, 1),
(18, 4, 115, 1),
(19, 5, 116, 1),
(20, 2, 116, 1),
(21, 4, 117, 1),
(22, 3, 117, 1),
(23, 5, 118, 1),
(24, 3, 118, 1),
(25, 1, 119, 3),
(26, 4, 119, 9),
(27, 2, 119, 6),
(28, 5, 120, 9),
(29, 4, 120, 3),
(30, 2, 120, 6),
(31, 1, 121, 6),
(32, 4, 121, 6),
(33, 2, 121, 3),
(34, 5, 122, 6),
(35, 4, 122, 3),
(36, 2, 122, 6),
(37, 1, 123, 3),
(38, 4, 123, 3),
(39, 5, 124, 3),
(40, 3, 124, 3),
(41, 2, 125, 3),
(42, 4, 125, 3),
(43, 5, 126, 3),
(44, 2, 126, 3),
(45, 4, 127, 3),
(46, 3, 127, 3),
(47, 5, 128, 3),
(48, 3, 128, 3),
(49, 1, 129, 4),
(50, 4, 129, 12),
(51, 2, 129, 8),
(52, 5, 130, 12),
(53, 4, 130, 4),
(54, 2, 130, 8),
(55, 1, 131, 8),
(56, 4, 131, 8),
(57, 2, 131, 4),
(58, 5, 132, 8),
(59, 4, 132, 4),
(60, 2, 132, 8),
(61, 1, 133, 4),
(62, 4, 133, 4),
(63, 5, 134, 4),
(64, 3, 134, 4),
(65, 2, 135, 4),
(66, 4, 135, 4),
(67, 5, 136, 4),
(68, 2, 136, 4),
(69, 4, 137, 4),
(70, 3, 137, 4),
(71, 5, 138, 4),
(72, 3, 138, 4),
(73, 1, 1, 2),
(74, 2, 1, 1),
(75, 1, 3, 1),
(76, 3, 3, 1),
(77, 2, 2, 1),
(78, 5, 2, 2),
(79, 2, 4, 1),
(80, 4, 4, 1),
(81, 1, 5, 6),
(82, 2, 5, 3),
(83, 5, 6, 6),
(84, 2, 6, 3),
(85, 3, 7, 2),
(86, 1, 7, 3),
(87, 4, 8, 3),
(88, 2, 8, 2),
(89, 1, 9, 3),
(90, 3, 9, 2),
(91, 5, 10, 3),
(92, 3, 10, 2),
(93, 1, 11, 6),
(94, 4, 11, 3),
(95, 2, 12, 3),
(96, 1, 12, 6),
(97, 1, 13, 8),
(98, 2, 13, 4),
(99, 5, 14, 8),
(100, 4, 14, 4),
(101, 1, 15, 4),
(102, 3, 15, 2),
(103, 4, 16, 4),
(104, 2, 16, 2),
(105, 1, 17, 4),
(106, 3, 17, 2),
(107, 5, 18, 4),
(108, 3, 18, 2),
(109, 4, 19, 4),
(110, 1, 19, 8),
(111, 2, 20, 4),
(112, 1, 20, 8);

-- --------------------------------------------------------

--
-- Structure de la table `caracteristiquespersonnages`
--

CREATE TABLE IF NOT EXISTS `caracteristiquespersonnages` (
  `idCaracteristiquePersonnage` int(11) NOT NULL AUTO_INCREMENT,
  `idCaracteristique` int(11) NOT NULL,
  `idPersonnage` int(11) NOT NULL,
  `valeur` int(11) NOT NULL,
  PRIMARY KEY (`idCaracteristiquePersonnage`),
  UNIQUE KEY `idCaracteristiquePersonnage` (`idCaracteristiquePersonnage`),
  KEY `CaracteristiquesPersonnages_Personnages_FK` (`idPersonnage`),
  KEY `CaracteristiquesPersonnages_Caracteristiques_FK` (`idCaracteristique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `caracteristiquesprofessions`
--

CREATE TABLE IF NOT EXISTS `caracteristiquesprofessions` (
  `idCaracteristiqueProfession` int(11) NOT NULL AUTO_INCREMENT,
  `idCaracteristique` int(11) NOT NULL,
  `idProfession` int(11) NOT NULL,
  `valeur` int(11) NOT NULL,
  PRIMARY KEY (`idCaracteristiqueProfession`),
  KEY `CaracteristiquesProfessions_Caracteristiques_FK` (`idCaracteristique`),
  KEY `CaracteristiquesProfessions_Professions_FK` (`idProfession`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `caracteristiquesprofessions`
--

INSERT INTO `caracteristiquesprofessions` (`idCaracteristiqueProfession`, `idCaracteristique`, `idProfession`, `valeur`) VALUES
(1, 1, 3, 8),
(2, 4, 3, 6),
(3, 2, 3, 6),
(4, 3, 3, 3),
(5, 5, 3, 2),
(6, 1, 1, 6),
(7, 4, 1, 6),
(8, 2, 1, 6),
(9, 3, 1, 3),
(10, 5, 1, 4),
(11, 1, 2, 2),
(12, 4, 2, 3),
(13, 2, 2, 5),
(14, 3, 2, 7),
(15, 5, 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

CREATE TABLE IF NOT EXISTS `competences` (
  `idCompetence` int(11) NOT NULL AUTO_INCREMENT,
  `idTypeCompetence` int(11) NOT NULL,
  `idEffet` int(11) DEFAULT NULL,
  `nom` varchar(31) NOT NULL,
  `valeurMin` int(11) NOT NULL DEFAULT '0',
  `valeurMax` int(11) NOT NULL DEFAULT '0',
  `energieUtilise` int(11) NOT NULL DEFAULT '0',
  `tempsRecharge` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCompetence`),
  UNIQUE KEY `idCompetence` (`idCompetence`),
  UNIQUE KEY `nom` (`nom`),
  KEY `Competences_TypesCompetences_FK` (`idTypeCompetence`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Contenu de la table `competences`
--

INSERT INTO `competences` (`idCompetence`, `idTypeCompetence`, `idEffet`, `nom`, `valeurMin`, `valeurMax`, `energieUtilise`, `tempsRecharge`, `description`, `image`) VALUES
(1, 2, NULL, 'Attaque physique', 2, 5, 0, 1, 'Attaque simple effectué avec les pièces d''équipements portées. ', NULL),
(2, 1, NULL, 'Rayon horrifiant', 7, 12, 5, 3, 'Rayon rouge qui fait trembler l''ennemi de peur. ', NULL),
(3, 1, 1, 'Hurlement de terreur', 10, 18, 14, 4, 'Hurlement qui fige l''ennemi de peur. La cible ne peut pas attaquer pendant 2 tour.', NULL),
(4, 1, NULL, 'Coup mental', 20, 29, 27, 5, 'Sort magique qui trouble votre esprit et vous affaiblit. ', NULL),
(5, 2, NULL, 'Lancer de l''épée', 8, 12, 6, 2, 'Lance une épée qui afflige de lourd dégât à l''ennemi. ', NULL),
(6, 2, 2, 'Torture physique', 17, 21, 10, 4, 'Torture l''ennemi avec un couteau. La cible reçoit des dégâts par tour pendant 2 tour.', NULL),
(7, 2, NULL, 'Tuerie', 20, 30, 19, 5, 'Devient en furie et détruit tout sur son passage. ', NULL),
(8, 3, 4, 'Bouclier des éléments', 30, 35, 14, 3, 'Absorbe les dégâts reçut dans ce bouclier résistant. Le sort absorbe des dégats pendant 3 tour.', NULL),
(9, 4, NULL, 'Guérison chamanistique', 45, 49, 20, 4, 'Il se guérit avec les pouvoirs chamanique. ', NULL),
(10, 2, NULL, 'Attaque des éléments', 24, 30, 18, 3, 'Invoque la puissance de la nature puis la déchaine contre l''ennemi. ', NULL),
(11, 1, NULL, 'Attaque squelettique', 20, 28, 26, 2, 'Envoi une malédiction qui cible le squelette de l''ennemi . ', NULL),
(12, 1, NULL, 'Tempête de morts', 25, 30, 30, 3, 'Libère la colère des revenants sur l''ennemi. ', NULL),
(13, 1, 3, 'Feu démoniaque', 38, 45, 36, 4, 'Attaque l''ennemi avec le feu brûlant des enfers. La cible reçoit des dégâts de feu par tour pendant 3 tour.', NULL),
(14, 2, 2, 'Coup de griffe', 12, 20, 8, 3, 'Coup de griffe sauvage. La cible reçoit des dégâts par tour pendant 2 tour.', NULL),
(15, 2, NULL, 'Morsure endiablée', 18, 25, 14, 3, 'Attaque l''ennemi en le mordant avec la puissance de sa mâchoire. ', NULL),
(16, 2, NULL, 'Furie animale', 27, 34, 20, 4, 'Déclanche sa furie et attaque l''ennemi de multiple coups. ', NULL),
(17, 1, NULL, 'Coup demoniaque', 14, 27, 13, 2, 'Frappe l''ennemi avec la puissance des démons. ', NULL),
(18, 4, NULL, 'Rituel de guérison', 32, 47, 19, 3, 'Guérit la cible grâce à la puissance des ténèbres. ', NULL),
(19, 2, NULL, 'Coup des dieux corrompus', 29, 50, 29, 3, 'Frappe l''ennemi de toute sa puissance avec la hache légendaire des dieux célestes corrompu. ', NULL),
(20, 1, NULL, 'Boule de feu', 5, 10, 4, 2, 'Lance une boule de feu à l''ennemi. ', NULL),
(21, 3, 4, 'Armure Arcanique', 6, 14, 12, 3, 'Armure des arcanes. Le sort absorbe des dégats pendant 3 tour.', NULL),
(22, 1, NULL, 'Décharge électrique', 16, 25, 25, 4, 'Lance une boule de feu à l''ennemi. ', NULL),
(23, 1, NULL, 'Coup divin', 4, 7, 3, 2, 'Attaque l''ennemi avec la puissance des dieux célestes. ', NULL),
(24, 4, NULL, 'Prière de guérison', 7, 10, 5, 3, 'Implore les dieux pour le guérir de ses douleurs et lui donner de la vie. ', NULL),
(25, 2, NULL, 'Marteau des dieux', 14, 21, 17, 4, 'Les dieux enchantent l''arme et la transforme en marteau céleste. ', NULL),
(26, 3, 4, 'Peau d''acier', 4, 8, 2, 3, 'La peau de la cible se durcit et devient aussi dure que l''acier. Le sort absorbe des dégats pendant 3 tour.', NULL),
(27, 2, NULL, 'Attaque précise', 12, 16, 5, 3, 'Concentre son attaque sur un même point précis. ', NULL),
(28, 2, NULL, 'Vision de sang', 15, 22, 12, 4, 'Devient fou et veut voir son ennemi ensanglanté. ', NULL),
(29, 2, 5, 'Tir gelé', 15, 22, 12, 4, 'La peau de la cible se durcit et devient aussi dure que l''acier. L''ennemi est gelé et sa vitesse est baissé de moitié pendant 3 tour.', NULL),
(30, 2, NULL, 'Tir explosif', 15, 22, 12, 4, 'Projectile doté de poudre à canon explosive. ', NULL),
(31, 2, NULL, 'Empoisonnement', 15, 22, 12, 4, 'Coup qui empoisonne instantanemment son adversaire pour des dégâts immédiat. ', NULL),
(32, 2, NULL, 'Tir rapide', 15, 22, 12, 4, 'Tir des projectiles très rapidement envers son adversaire. ', NULL),
(33, 3, 4, 'Gardien', 15, 20, 7, 4, 'Bouclier divin pouvant absorber les dégats pendant 3', NULL),
(34, 1, NULL, 'Souffle de feu', 15, 22, 12, 4, 'Envoie des flammes vers son adversaire. ', NULL),
(35, 2, 6, 'Mouvement agile', 15, 22, 12, 4, 'Bouge avec dextérité pour atteindre son adversaire avec peu de chance de raté. ', NULL),
(36, 2, 7, 'Pétrification', 15, 22, 12, 4, 'Faire peur à son ennemi lui infligeant des dégâts et le fige. ', NULL),
(37, 4, 5, 'Régénération', 15, 22, 12, 4, 'Se redonne des points de vie. ', NULL),
(38, 2, 5, 'Invisibilité', 15, 22, 12, 4, 'Devient invisible et absorbe des dégâts pendant X tours. ', NULL),
(39, 2, 5, 'Attaque rapide', 15, 22, 12, 4, 'Attaque son adversaire rapidement avec des coups remplis de force. ', NULL),
(40, 2, 5, 'Rafale de tentacules', 15, 22, 12, 4, 'Attaque son ennemi rapidement avec des coups de tentacules. ', NULL),
(41, 2, 5, 'Invocation des morts', 15, 22, 12, 4, 'Invoque un mort attaquant l''adversaire, le mort retourne d''où il vient après le tour. ', NULL),
(42, 2, 5, 'Tremblement de terre', 15, 22, 12, 4, 'Créer un tremblement de terre. ', NULL),
(43, 2, 5, 'Cri strident', 15, 22, 12, 4, 'Cri de manière déstabilisante. ', NULL),
(44, 2, 5, 'Coup ailé', 15, 22, 12, 4, 'Donne un coup d''aile à son adversaire. ', NULL),
(45, 2, 5, 'Piétinement', 15, 22, 12, 4, 'Fonce vers son adversaire et le piétine. ', NULL),
(46, 2, 5, 'Mélodie enchantée', 15, 22, 12, 4, 'Joue une mélodie qui est accompagné d''un sort maléfique. ', NULL),
(47, 2, 5, 'Coup foudroyant', 15, 22, 12, 4, 'Inflige un coup enchanté par la foudre à son adversaire. ', NULL),
(48, 2, 5, 'Confusion', 15, 22, 12, 4, 'Jette un sort à son adversaire le plongeant dans la confusion pour X tours. ', NULL),
(49, 2, 5, 'Instabilité', 15, 22, 12, 4, 'Donne un coup précis à son adversaire, le rendant instable pour X tours. ', NULL),
(50, 2, 5, 'Morsure', 15, 22, 12, 4, 'Fonce vers son adversaire et le mord. ', NULL),
(51, 2, 5, 'Coup féroce', 15, 22, 12, 4, 'Attaque son adversaire d''un coup quasiment animal.', NULL),
(52, 2, 5, 'Coup de corne', 15, 22, 12, 4, 'Attaque son adversaire avec ses cornes. ', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `competencesennemis`
--

CREATE TABLE IF NOT EXISTS `competencesennemis` (
  `idCompetenceEnnemi` int(11) NOT NULL AUTO_INCREMENT,
  `idCompetence` int(11) NOT NULL,
  `idEnnemi` int(11) NOT NULL,
  PRIMARY KEY (`idCompetenceEnnemi`),
  UNIQUE KEY `idCompetenceEnnemi` (`idCompetenceEnnemi`),
  KEY `CompetencesEnnemis_Competences_FK` (`idCompetence`),
  KEY `CompetencesEnnemis_Ennemis_FK` (`idEnnemi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Contenu de la table `competencesennemis`
--

INSERT INTO `competencesennemis` (`idCompetenceEnnemi`, `idCompetence`, `idEnnemi`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 1, 2),
(6, 5, 2),
(7, 6, 2),
(8, 7, 2),
(9, 1, 3),
(10, 8, 3),
(11, 9, 3),
(12, 10, 3),
(13, 1, 4),
(14, 11, 4),
(15, 13, 4),
(16, 12, 4),
(17, 1, 5),
(18, 14, 5),
(19, 15, 5),
(20, 16, 5),
(21, 1, 6),
(22, 17, 6),
(23, 18, 6),
(24, 19, 6),
(25, 1, 7),
(26, 33, 7),
(27, 1, 8),
(28, 31, 8),
(29, 1, 9),
(30, 32, 9),
(31, 1, 10),
(32, 34, 10),
(33, 14, 10),
(34, 1, 11),
(35, 29, 11),
(36, 30, 11),
(37, 1, 12),
(38, 35, 12),
(39, 1, 13),
(40, 36, 13),
(41, 1, 14),
(42, 37, 14),
(43, 1, 15),
(44, 38, 15),
(45, 1, 16),
(46, 39, 16),
(47, 1, 17),
(48, 40, 17),
(49, 1, 18),
(50, 52, 18),
(51, 1, 19),
(52, 16, 19),
(53, 1, 20),
(54, 41, 20),
(55, 1, 21),
(56, 42, 21),
(57, 1, 22),
(58, 43, 22),
(59, 44, 22),
(60, 1, 23),
(61, 52, 23),
(62, 45, 23),
(63, 1, 24),
(64, 46, 24),
(65, 1, 25),
(66, 47, 25),
(67, 1, 26),
(68, 48, 26),
(69, 49, 26),
(70, 1, 27),
(71, 50, 27),
(72, 35, 27),
(73, 1, 28),
(74, 15, 28),
(75, 1, 29),
(76, 51, 29),
(77, 1, 30),
(78, 37, 30),
(79, 31, 30);

-- --------------------------------------------------------

--
-- Structure de la table `competencesprofessions`
--

CREATE TABLE IF NOT EXISTS `competencesprofessions` (
  `idCompetenceProfession` int(11) NOT NULL AUTO_INCREMENT,
  `idCompetence` int(11) NOT NULL,
  `idProfession` int(11) NOT NULL,
  PRIMARY KEY (`idCompetenceProfession`),
  UNIQUE KEY `idCompetenceProfession` (`idCompetenceProfession`),
  KEY `CompetencesProfessions_Competences_FK` (`idCompetence`),
  KEY `CompetencesProfessions_Professions_FK` (`idProfession`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `competencesprofessions`
--

INSERT INTO `competencesprofessions` (`idCompetenceProfession`, `idCompetence`, `idProfession`) VALUES
(1, 1, 3),
(2, 26, 3),
(3, 27, 3),
(4, 28, 3),
(5, 1, 1),
(6, 23, 1),
(7, 24, 1),
(8, 25, 1),
(9, 1, 2),
(10, 20, 2),
(11, 21, 2),
(12, 22, 2);

-- --------------------------------------------------------

--
-- Structure de la table `effets`
--

CREATE TABLE IF NOT EXISTS `effets` (
  `idEffet` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(21) NOT NULL,
  `description` varchar(255) NOT NULL,
  `tempsEffets` int(11) NOT NULL,
  PRIMARY KEY (`idEffet`),
  UNIQUE KEY `idEffet` (`idEffet`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `effets`
--

INSERT INTO `effets` (`idEffet`, `nom`, `description`, `tempsEffets`) VALUES
(1, 'Peur', 'La cible ne peut pas attaquer', 2),
(2, 'Saignement', 'La cible reçoit des dégâts par tour', 2),
(3, 'Brulure', 'La cible reçoit des dégâts de feu par tour', 3),
(4, 'Protection', 'Le sort absorbe des dégats', 3),
(5, 'Glacé', 'L''ennemi est gelé et sa vitesse est baissé de moitié', 3),
(6, 'Rapidité accru', 'La vitesse est augmenté de 50%', 3),
(7, 'Immobile', 'L''ennemi ne peut pas attaqué', 2),
(8, 'Manipulation', 'La cible s''inflige des dégats avec sa propre attaque', 0),
(9, 'Empoisonné', 'La cible reçoit des dégâts par tour', 3);

-- --------------------------------------------------------

--
-- Structure de la table `ennemis`
--

CREATE TABLE IF NOT EXISTS `ennemis` (
  `idEnnemi` int(11) NOT NULL AUTO_INCREMENT,
  `idInventaire` int(11) DEFAULT NULL,
  `nom` varchar(31) NOT NULL,
  `niveau` int(11) NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `boss` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idEnnemi`),
  UNIQUE KEY `idEnnemi` (`idEnnemi`),
  UNIQUE KEY `nom` (`nom`),
  KEY `Ennemis_Inventaires_FK` (`idInventaire`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `ennemis`
--

INSERT INTO `ennemis` (`idEnnemi`, `idInventaire`, `nom`, `niveau`, `image`, `boss`) VALUES
(1, NULL, 'Azazel', 3, NULL, 1),
(2, NULL, 'Moguarnoch', 6, NULL, 1),
(3, NULL, 'Zakuta', 9, NULL, 1),
(4, NULL, 'Ful''kitak', 12, NULL, 1),
(5, NULL, 'Harfanghei', 15, NULL, 1),
(6, NULL, 'Arkanok', 18, NULL, 1),
(7, NULL, 'Ange déchu', 1, NULL, 0),
(8, NULL, 'Bandit', 1, NULL, 0),
(9, NULL, 'Centaure', 1, NULL, 0),
(10, NULL, 'Dragon', 1, NULL, 0),
(11, NULL, 'Elfe', 1, NULL, 0),
(12, NULL, 'Farfadet', 1, NULL, 0),
(13, NULL, 'Gorgone', 1, NULL, 0),
(14, NULL, 'Hydre', 1, NULL, 0),
(15, NULL, 'Iguane démoniaque', 1, NULL, 0),
(16, NULL, 'Jaguar géant', 1, NULL, 0),
(17, NULL, 'Kraken', 1, NULL, 0),
(18, NULL, 'Licorne', 1, NULL, 0),
(19, NULL, 'Minotaure', 1, NULL, 0),
(20, NULL, 'Nécromancien', 1, NULL, 0),
(21, NULL, 'Ogre', 1, NULL, 0),
(22, NULL, 'Ptérodactyle', 1, NULL, 0),
(23, NULL, 'Rhinocéros sauvage', 1, NULL, 0),
(24, NULL, 'Satyre', 1, NULL, 0),
(25, NULL, 'Troll', 1, NULL, 0),
(26, NULL, 'Ubuntu', 1, NULL, 0),
(27, NULL, 'Vampire', 1, NULL, 0),
(28, NULL, 'Worg', 1, NULL, 0),
(29, NULL, 'Yéti', 1, NULL, 0),
(30, NULL, 'Zombie', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `equipements`
--

CREATE TABLE IF NOT EXISTS `equipements` (
  `idEquipement` int(11) NOT NULL AUTO_INCREMENT,
  `idEquipementModele` int(11) NOT NULL,
  PRIMARY KEY (`idEquipement`),
  UNIQUE KEY `idEquipement` (`idEquipement`),
  KEY `Equipements_EquipementsModeles_FK` (`idEquipementModele`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `equipementsmodeles`
--

CREATE TABLE IF NOT EXISTS `equipementsmodeles` (
  `idEquipementModele` int(11) NOT NULL AUTO_INCREMENT,
  `idModele` int(11) NOT NULL,
  `nom` varchar(51) NOT NULL,
  `prix` double NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `degatMin` int(11) NOT NULL DEFAULT '0',
  `degatMax` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEquipementModele`),
  UNIQUE KEY `idEquipementModele` (`idEquipementModele`),
  KEY `EquipementsModeles_Modeles_FK` (`idModele`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=249 ;

--
-- Contenu de la table `equipementsmodeles`
--

INSERT INTO `equipementsmodeles` (`idEquipementModele`, `idModele`, `nom`, `prix`, `image`, `degatMin`, `degatMax`) VALUES
(1, 2, 'Épée de pratique', 7.07, NULL, 2, 4),
(2, 2, 'Bâton de pratique', 7.07, NULL, 2, 4),
(3, 1, 'Marteau de pratique', 4.71, NULL, 1, 3),
(4, 3, 'Bouclier de pratique', 4.71, NULL, 0, 0),
(5, 2, 'Épée rouillée', 134.3, NULL, 3, 6),
(6, 2, 'Bâton rouillé', 134.3, NULL, 3, 6),
(7, 1, 'Marteau rouillé', 89.54, NULL, 2, 5),
(8, 3, 'Bouclier rouillé', 89.54, NULL, 0, 0),
(9, 1, 'Dague rouillée', 89.54, NULL, 2, 5),
(10, 1, 'Baguette rouillée', 89.54, NULL, 2, 5),
(11, 2, 'Hache rouillée', 134.3, NULL, 3, 6),
(12, 2, 'Lance rouillée', 134.3, NULL, 3, 6),
(13, 2, 'Épée magique', 311.02, NULL, 4, 8),
(14, 2, 'Bâton magique', 311.02, NULL, 4, 8),
(15, 1, 'Marteau magique', 207.35, NULL, 2, 6),
(16, 3, 'Bouclier magique', 207.35, NULL, 0, 0),
(17, 1, 'Dague magique', 207.35, NULL, 2, 6),
(18, 1, 'Baguette magique', 207.35, NULL, 2, 6),
(19, 2, 'Hache magique', 311.02, NULL, 4, 8),
(20, 2, 'Lance magique', 311.02, NULL, 4, 8),
(21, 2, 'Épée élémentale', 1032.02, NULL, 6, 12),
(22, 2, 'Bâton élémental', 1032.02, NULL, 6, 12),
(23, 1, 'Marteau élémental', 688.01, NULL, 3, 9),
(24, 3, 'Bouclier élémental', 688.01, NULL, 0, 0),
(25, 1, 'Dague élémentale', 688.01, NULL, 3, 9),
(26, 1, 'Baguette élémentale', 688.01, NULL, 3, 9),
(27, 2, 'Hache élémentale', 1032.02, NULL, 6, 12),
(28, 2, 'Lance élémentale', 1032.02, NULL, 6, 12),
(29, 2, 'Épée de bronze', 1632.84, NULL, 7, 14),
(30, 2, 'Bâton de bronze', 1632.84, NULL, 7, 14),
(31, 1, 'Marteau de bronze', 1088.56, NULL, 4, 11),
(32, 3, 'Bouclier de bronze', 1088.56, NULL, 0, 0),
(33, 1, 'Dague de bronze', 1088.56, NULL, 4, 11),
(34, 1, 'Baguette de bronze', 1088.56, NULL, 4, 11),
(35, 2, 'Hache de bronze', 1632.84, NULL, 7, 14),
(36, 2, 'Lance de bronze', 1632.84, NULL, 7, 14),
(37, 2, 'Épée de fer', 3456.54, NULL, 9, 18),
(38, 2, 'Bâton de fer', 3456.54, NULL, 9, 18),
(39, 1, 'Marteau de fer', 2304.36, NULL, 5, 14),
(40, 3, 'Bouclier de fer', 2304.36, NULL, 0, 0),
(41, 1, 'Dague de fer', 2304.36, NULL, 5, 14),
(42, 1, 'Baguette de fer', 2304.36, NULL, 5, 14),
(43, 2, 'Hache de fer', 3456.54, NULL, 9, 18),
(44, 2, 'Lance de fer', 3456.54, NULL, 9, 18),
(45, 2, 'Épée enchantée', 4735.96, NULL, 10, 20),
(46, 2, 'Bâton enchanté', 4735.96, NULL, 10, 20),
(47, 1, 'Marteau enchanté', 3157.3, NULL, 5, 15),
(48, 3, 'Bouclier enchanté', 3157.3, NULL, 0, 0),
(49, 1, 'Dague enchantée', 3157.3, NULL, 5, 15),
(50, 1, 'Baguette enchantée', 3157.3, NULL, 5, 15),
(51, 2, 'Hache enchantée', 4735.96, NULL, 10, 20),
(52, 2, 'Lance enchantée', 4735.96, NULL, 10, 20),
(53, 2, 'Épée maudite', 8171.3, NULL, 12, 24),
(54, 2, 'Bâton maudit', 8171.3, NULL, 12, 24),
(55, 1, 'Marteau maudit', 5447.53, NULL, 6, 18),
(56, 3, 'Bouclier maudit', 5447.53, NULL, 0, 0),
(57, 1, 'Dague maudite', 5447.53, NULL, 6, 18),
(58, 1, 'Baguette maudite', 5447.53, NULL, 6, 18),
(59, 2, 'Hache maudite', 8171.3, NULL, 12, 24),
(60, 2, 'Lance maudite', 8171.3, NULL, 12, 24),
(61, 2, 'Épée sacrée', 10383.77, NULL, 13, 26),
(62, 2, 'Bâton sacré', 10383.77, NULL, 13, 16),
(63, 1, 'Marteau sacré', 6922.52, NULL, 7, 20),
(64, 3, 'Bouclier sacré', 6922.52, NULL, 0, 0),
(65, 1, 'Dague sacrée', 6922.52, NULL, 7, 20),
(66, 1, 'Baguette sacrée', 6922.52, NULL, 7, 20),
(67, 2, 'Hache sacrée', 10383.77, NULL, 13, 26),
(68, 2, 'Lance sacrée', 10383.77, NULL, 13, 26),
(69, 2, 'Épée de crystal', 15939.69, NULL, 15, 30),
(70, 2, 'Bâton de crystal', 15939.69, NULL, 15, 30),
(71, 1, 'Marteau de crystal', 10626.46, NULL, 8, 23),
(72, 3, 'Bouclier de crystal', 10626.46, NULL, 0, 0),
(73, 1, 'Dague de crystal', 10626.46, NULL, 8, 23),
(74, 1, 'Baguette de crystal', 10626.46, NULL, 8, 23),
(75, 2, 'Hache de crystal', 15939.69, NULL, 15, 30),
(76, 2, 'Lance de crystal', 15939.69, NULL, 15, 30),
(77, 2, 'Épée héroïque', 19339.7, NULL, 16, 32),
(78, 2, 'Bâton héroïque', 19339.7, NULL, 16, 32),
(79, 1, 'Marteau héroïque', 12893.13, NULL, 8, 24),
(80, 3, 'Bouclier héroïque', 12893.13, NULL, 0, 0),
(81, 1, 'Dague héroïque', 12893.13, NULL, 8, 24),
(82, 1, 'Baguette héroïque', 12893.13, NULL, 8, 24),
(83, 2, 'Hache héroïque', 19339.7, NULL, 16, 32),
(84, 2, 'Lance héroïque', 19339.7, NULL, 16, 32),
(85, 2, 'Épée légendaire', 23192.08, NULL, 17, 34),
(86, 2, 'Bâton légendaire', 23192.08, NULL, 17, 34),
(87, 1, 'Marteau légendaire', 15461.38, NULL, 9, 26),
(88, 3, 'Bouclier légendaire', 15461.38, NULL, 0, 0),
(89, 1, 'Dague légendaire', 15461.38, NULL, 9, 26),
(90, 1, 'Baguette légendaire', 15461.38, NULL, 9, 26),
(91, 2, 'Hache légendaire', 23192.08, NULL, 17, 34),
(92, 2, 'Lance légendaire', 23192.08, NULL, 17, 34),
(93, 2, 'Épée de diamant', 32367.12, NULL, 19, 38),
(94, 2, 'Bâton de diamant', 32367.12, NULL, 19, 38),
(95, 1, 'Marteau de diamant', 21578.08, NULL, 10, 29),
(96, 3, 'Bouclier de diamant', 21578.08, NULL, 0, 0),
(97, 1, 'Dague de diamant', 21578.08, NULL, 10, 29),
(98, 1, 'Baguette de diamant', 21578.08, NULL, 10, 29),
(99, 2, 'Hache de diamant', 32367.12, NULL, 19, 38),
(100, 2, 'Lance de diamant', 32367.12, NULL, 19, 38),
(101, 2, 'Épée céleste', 37746.32, NULL, 20, 40),
(102, 2, 'Bâton céleste', 37746.32, NULL, 20, 40),
(103, 1, 'Marteau céleste', 25164.22, NULL, 10, 30),
(104, 3, 'Bouclier céleste', 25164.22, NULL, 0, 0),
(105, 1, 'Dague céleste', 25164.22, NULL, 10, 30),
(106, 1, 'Baguette céleste', 25164.22, NULL, 10, 30),
(107, 2, 'Hache céleste', 37746.32, NULL, 20, 40),
(108, 2, 'Lance céleste', 37746.32, NULL, 20, 40),
(109, 6, 'Plastron de cuir', 7.07, NULL, 0, 0),
(110, 6, 'Robe de tissu', 7.07, NULL, 0, 0),
(111, 8, 'Pantalon de cuir', 7.07, NULL, 0, 0),
(112, 8, 'Pantalon de tissu', 7.07, NULL, 0, 0),
(113, 5, 'Épaulettes de cuir', 4.71, NULL, 0, 0),
(114, 5, 'Épaulettes de tissu', 4.71, NULL, 0, 0),
(115, 4, 'Casque de cuir', 4.71, NULL, 0, 0),
(116, 4, 'Couronne', 4.71, NULL, 0, 0),
(117, 7, 'Bottes de cuir', 4.71, NULL, 0, 0),
(118, 7, 'Souliers', 4.71, NULL, 0, 0),
(119, 6, 'Plastron rouillé', 134.3, NULL, 0, 0),
(120, 6, 'Robe de tissu renforcé', 134.3, NULL, 0, 0),
(121, 8, 'Pantalon rouillé', 134.3, NULL, 0, 0),
(122, 8, 'Pantalon de tissu renforcé', 134.3, NULL, 0, 0),
(123, 5, 'Épaulettes rouillées', 89.54, NULL, 0, 0),
(124, 5, 'Épaulettes de tissu renforcé', 89.54, NULL, 0, 0),
(125, 4, 'Casque rouillé', 89.54, NULL, 0, 0),
(126, 4, 'Couronne rouillée', 89.54, NULL, 0, 0),
(127, 7, 'Bottes rouillées', 89.54, NULL, 0, 0),
(128, 7, 'Souliers rouillés', 89.54, NULL, 0, 0),
(129, 6, 'Plastron magique', 311.02, NULL, 0, 0),
(130, 6, 'Robe magique', 311.02, NULL, 0, 0),
(131, 8, 'Pantalon magique', 311.02, NULL, 0, 0),
(132, 8, 'Leggings magiques', 311.02, NULL, 0, 0),
(133, 5, 'Épaulettes magiques', 207.35, NULL, 0, 0),
(134, 5, 'Épaulières magiques', 207.35, NULL, 0, 0),
(135, 4, 'Casque magique', 207.35, NULL, 0, 0),
(136, 4, 'Couronne magique', 207.35, NULL, 0, 0),
(137, 7, 'Bottes magiques', 207.35, NULL, 0, 0),
(138, 7, 'Souliers magiques', 207.35, NULL, 0, 0),
(139, 6, 'Plastron de maille', 1032.02, NULL, 0, 0),
(140, 6, 'Robe de maille', 1032.02, NULL, 0, 0),
(141, 8, 'Pantalon de maille', 1032.02, NULL, 0, 0),
(142, 8, 'Leggings de maille', 1032.02, NULL, 0, 0),
(143, 5, 'Épaulettes de maille', 688.01, NULL, 0, 0),
(144, 5, 'Épaulières de maille', 688.01, NULL, 0, 0),
(145, 4, 'Casque de maille', 688.01, NULL, 0, 0),
(146, 4, 'Couronne de maille', 688.01, NULL, 0, 0),
(147, 7, 'Bottes de maille', 688.01, NULL, 0, 0),
(148, 7, 'Souliers de maille', 688.01, NULL, 0, 0),
(149, 6, 'Plastron de bronze', 1632.84, NULL, 0, 0),
(150, 6, 'Robe de bronze', 1632.84, NULL, 0, 0),
(151, 8, 'Pantalon de bronze', 1632.84, NULL, 0, 0),
(152, 8, 'Leggings de bronze', 1632.84, NULL, 0, 0),
(153, 5, 'Épaulettes de bronze', 1088.56, NULL, 0, 0),
(154, 5, 'Épaulières de bronze', 1088.56, NULL, 0, 0),
(155, 4, 'Casque de bronze', 1088.56, NULL, 0, 0),
(156, 4, 'Couronne de bronze', 1088.56, NULL, 0, 0),
(157, 7, 'Bottes de bronze', 1088.56, NULL, 0, 0),
(158, 7, 'Souliers de bronze', 1088.56, NULL, 0, 0),
(159, 6, 'Plastron de fer', 3456.54, NULL, 0, 0),
(160, 6, 'Robe de fer', 3456.54, NULL, 0, 0),
(161, 8, 'Pantalon de fer', 3456.54, NULL, 0, 0),
(162, 8, 'Leggings de fer', 3456.54, NULL, 0, 0),
(163, 5, 'Épaulettes de fer', 2304.36, NULL, 0, 0),
(164, 5, 'Épaulières de fer', 2304.36, NULL, 0, 0),
(165, 4, 'Casque de fer', 2304.36, NULL, 0, 0),
(166, 4, 'Couronne de fer', 2304.36, NULL, 0, 0),
(167, 7, 'Bottes de fer', 2304.36, NULL, 0, 0),
(168, 7, 'Souliers de fer', 2304.36, NULL, 0, 0),
(169, 6, 'Plastron enchanté', 4735.96, NULL, 0, 0),
(170, 6, 'Robe enchantée', 4735.96, NULL, 0, 0),
(171, 8, 'Pantalon enchanté', 4735.96, NULL, 0, 0),
(172, 8, 'Leggings enchantés', 4735.96, NULL, 0, 0),
(173, 5, 'Épaulettes enchantées', 3157.3, NULL, 0, 0),
(174, 5, 'Épaulières enchantées', 3157.3, NULL, 0, 0),
(175, 4, 'Casque enchanté', 3157.3, NULL, 0, 0),
(176, 4, 'Couronne enchantée', 3157.3, NULL, 0, 0),
(177, 7, 'Bottes enchantées', 3157.3, NULL, 0, 0),
(178, 7, 'Souliers enchantés', 3157.3, NULL, 0, 0),
(179, 6, 'Plastron maudit', 8171.3, NULL, 0, 0),
(180, 6, 'Robe maudite', 8171.3, NULL, 0, 0),
(181, 8, 'Pantalon maudit', 8171.3, NULL, 0, 0),
(182, 8, 'Leggings maudits', 8171.3, NULL, 0, 0),
(183, 5, 'Épaulettes maudites', 5447.53, NULL, 0, 0),
(184, 5, 'Épaulières maudites', 5447.53, NULL, 0, 0),
(185, 4, 'Casque maudit', 5447.53, NULL, 0, 0),
(186, 4, 'Couronne maudite', 5447.53, NULL, 0, 0),
(187, 7, 'Bottes maudites', 5447.53, NULL, 0, 0),
(188, 7, 'Souliers maudits', 5447.53, NULL, 0, 0),
(189, 6, 'Plastron sacré', 10383.77, NULL, 0, 0),
(190, 6, 'Robe sacrée', 10383.77, NULL, 0, 0),
(191, 8, 'Pantalon sacré', 10383.77, NULL, 0, 0),
(192, 8, 'Leggings sacrés', 10383.77, NULL, 0, 0),
(193, 5, 'Épaulettes sacrées', 6922.52, NULL, 0, 0),
(194, 5, 'Épaulières sacrées', 6922.52, NULL, 0, 0),
(195, 4, 'Casque sacré', 6922.52, NULL, 0, 0),
(196, 4, 'Couronne sacrée', 6922.52, NULL, 0, 0),
(197, 7, 'Bottes sacrées', 6922.52, NULL, 0, 0),
(198, 7, 'Souliers sacrés', 6922.52, NULL, 0, 0),
(199, 6, 'Plastron en or', 15939.69, NULL, 0, 0),
(200, 6, 'Robe en or', 15939.69, NULL, 0, 0),
(201, 8, 'Pantalon en or', 15939.69, NULL, 0, 0),
(202, 8, 'Leggings en or', 15939.69, NULL, 0, 0),
(203, 5, 'Épaulettes en or', 10626.46, NULL, 0, 0),
(204, 5, 'Épaulières en or', 10626.46, NULL, 0, 0),
(205, 4, 'Casque en or', 10626.46, NULL, 0, 0),
(206, 4, 'Couronne en or', 10626.46, NULL, 0, 0),
(207, 7, 'Bottes en or', 10626.46, NULL, 0, 0),
(208, 7, 'Souliers en or', 10626.46, NULL, 0, 0),
(209, 6, 'Plastron héroïque', 19339.7, NULL, 0, 0),
(210, 6, 'Robe héroïque', 19339.7, NULL, 0, 0),
(211, 8, 'Pantalon héroïque', 19339.7, NULL, 0, 0),
(212, 8, 'Leggings héroïques', 19339.7, NULL, 0, 0),
(213, 5, 'Épaulettes héroïques', 12893.13, NULL, 0, 0),
(214, 5, 'Épaulières héroïques', 12893.13, NULL, 0, 0),
(215, 4, 'Casque héroïque', 12893.13, NULL, 0, 0),
(216, 4, 'Couronne héroïque', 12893.13, NULL, 0, 0),
(217, 7, 'Bottes héroïques', 12893.13, NULL, 0, 0),
(218, 7, 'Souliers héroïques', 12893.13, NULL, 0, 0),
(219, 6, 'Plastron légendaire', 23192.08, NULL, 0, 0),
(220, 6, 'Robe légendaire', 23192.08, NULL, 0, 0),
(221, 8, 'Pantalon légendaire', 23192.08, NULL, 0, 0),
(222, 8, 'Leggings légendaires', 23192.08, NULL, 0, 0),
(223, 5, 'Épaulettes légendaires', 15461.38, NULL, 0, 0),
(224, 5, 'Épaulières légendaires', 15461.38, NULL, 0, 0),
(225, 4, 'Casque légendaire', 15461.38, NULL, 0, 0),
(226, 4, 'Couronne légendaire', 15461.38, NULL, 0, 0),
(227, 7, 'Bottes légendaires', 15461.38, NULL, 0, 0),
(228, 7, 'Souliers légendaires', 15461.38, NULL, 0, 0),
(229, 6, 'Plastron de diamant', 32367.12, NULL, 0, 0),
(230, 6, 'Robe de diamant', 32367.12, NULL, 0, 0),
(231, 8, 'Pantalon de diamant', 32367.12, NULL, 0, 0),
(232, 8, 'Leggings de diamant', 32367.12, NULL, 0, 0),
(233, 5, 'Épaulettes de diamant', 21578.08, NULL, 0, 0),
(234, 5, 'Épaulières de diamant', 21578.08, NULL, 0, 0),
(235, 4, 'Casque de diamant', 21578.08, NULL, 0, 0),
(236, 4, 'Couronne de diamant', 21578.08, NULL, 0, 0),
(237, 7, 'Bottes de diamant', 21578.08, NULL, 0, 0),
(238, 7, 'Souliers de diamant', 21578.08, NULL, 0, 0),
(239, 6, 'Plastron céleste', 37746.32, NULL, 0, 0),
(240, 6, 'Robe céleste', 37746.32, NULL, 0, 0),
(241, 8, 'Pantalon céleste', 37746.32, NULL, 0, 0),
(242, 8, 'Leggings célestes', 37746.32, NULL, 0, 0),
(243, 5, 'Épaulettes célestes', 25164.22, NULL, 0, 0),
(244, 5, 'Épaulières célestes', 25164.22, NULL, 0, 0),
(245, 4, 'Casque céleste', 25164.22, NULL, 0, 0),
(246, 4, 'Couronne céleste', 25164.22, NULL, 0, 0),
(247, 7, 'Bottes célestes', 25164.22, NULL, 0, 0),
(248, 7, 'Souliers célestes', 25164.22, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `equipementspersonnages`
--

CREATE TABLE IF NOT EXISTS `equipementspersonnages` (
  `idEquipementPersonnage` int(11) NOT NULL AUTO_INCREMENT,
  `idEquipement` int(11) NOT NULL,
  `idPersonnage` int(11) NOT NULL,
  `idModele` int(11) NOT NULL,
  PRIMARY KEY (`idEquipementPersonnage`),
  UNIQUE KEY `idEquipementPersonnage` (`idEquipementPersonnage`),
  KEY `EquipementsPersonnages_Personnages_FK` (`idPersonnage`),
  KEY `EquipementsPersonnages_Equipements_FK` (`idEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `inventaires`
--

CREATE TABLE IF NOT EXISTS `inventaires` (
  `idInventaire` int(11) NOT NULL AUTO_INCREMENT,
  `argent` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idInventaire`),
  UNIQUE KEY `idInventaire` (`idInventaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `inventairesequipements`
--

CREATE TABLE IF NOT EXISTS `inventairesequipements` (
  `idInventaireEquipement` int(11) NOT NULL AUTO_INCREMENT,
  `idInventaire` int(11) NOT NULL,
  `idEquipement` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idInventaireEquipement`),
  UNIQUE KEY `idInventaireEquipement` (`idInventaireEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE IF NOT EXISTS `joueurs` (
  `idJoueur` int(11) NOT NULL AUTO_INCREMENT,
  `pseudonyme` varchar(21) NOT NULL,
  `motDePasse` varchar(32) NOT NULL,
  PRIMARY KEY (`idJoueur`),
  UNIQUE KEY `idJoueur` (`idJoueur`),
  UNIQUE KEY `pseudonyme` (`pseudonyme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `modeles`
--

CREATE TABLE IF NOT EXISTS `modeles` (
  `idModele` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(21) NOT NULL,
  `deuxMains` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idModele`),
  UNIQUE KEY `idModele` (`idModele`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `modeles`
--

INSERT INTO `modeles` (`idModele`, `nom`, `deuxMains`) VALUES
(1, 'Arme à une main', 0),
(2, 'Arme à deux mains', 1),
(3, 'Bouclier', 0),
(4, 'Casque', 0),
(5, 'Épaulette', 0),
(6, 'Plastron', 0),
(7, 'Bottes', 0),
(8, 'Pantalon', 0);

-- --------------------------------------------------------

--
-- Structure de la table `personnages`
--

CREATE TABLE IF NOT EXISTS `personnages` (
  `idPersonnage` int(11) NOT NULL AUTO_INCREMENT,
  `idProfession` int(11) NOT NULL,
  `idInventaire` int(11) NOT NULL,
  `idJoueur` int(11) NOT NULL,
  `idStatistique` int(11) NOT NULL,
  `nom` varchar(21) NOT NULL,
  `niveau` int(11) NOT NULL DEFAULT '1',
  `experience` int(11) NOT NULL DEFAULT '0',
  `vie` int(11) NOT NULL DEFAULT '0',
  `energie` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `estActif` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idPersonnage`),
  UNIQUE KEY `idPersonnage` (`idPersonnage`),
  UNIQUE KEY `nom` (`nom`),
  KEY `Personnages_Professions_FK` (`idProfession`),
  KEY `Personnages_Inventaires_FK` (`idInventaire`),
  KEY `Personnages_Joueurs_FK` (`idJoueur`),
  KEY `Personnages_Statistique_FK` (`idStatistique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `professions`
--

CREATE TABLE IF NOT EXISTS `professions` (
  `idProfession` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(21) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProfession`),
  UNIQUE KEY `idProfession` (`idProfession`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `professions`
--

INSERT INTO `professions` (`idProfession`, `nom`, `image`, `description`) VALUES
(1, 'Paladin', '../images/paladin.png', 'Le paladin est un guerrier croyant en les dieux. Il ne se bat que s''il en sent le besoin.\n    Durant les combats, il les implore pour avoir leur aide pour le guérrir ou simplement enchanter ses\n    attaques.'),
(2, 'Magicien', '../images/magicien.png', 'Le magicien étudie différent type de magie, mais exclut la magie noire. Il contrôle les arcanes,\n    le feu et l''électricité. Il se sert de sorts pour attaquer son ennemi, mais aussi pour se protéger. Les sorts\n    du magicien sont très puissant et effica'),
(3, 'Guerrier', '../images/guerrier.png', 'Le guerrier est une brute ne se fiant qu''à sa force pour abattre ses ennemis, il n''hésite pas une seconde\n    à enfoncer son sur sur ceux-ci. Endurci par les combats au corps à corps, le guerrier est résistant et physiquement\n    très fort.');

-- --------------------------------------------------------

--
-- Structure de la table `statistiques`
--

CREATE TABLE IF NOT EXISTS `statistiques` (
  `idStatistique` int(11) NOT NULL AUTO_INCREMENT,
  `tempsDeJeu` time NOT NULL DEFAULT '00:00:00',
  `nombreDeCombat` int(11) NOT NULL DEFAULT '0',
  `victoire` int(11) NOT NULL DEFAULT '0',
  `defaite` int(11) NOT NULL DEFAULT '0',
  `dommageTotal` int(11) NOT NULL DEFAULT '0',
  `moyenneDommage` int(11) NOT NULL DEFAULT '0',
  `nombreAttaque` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idStatistique`),
  UNIQUE KEY `idStatistique` (`idStatistique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `typescompetences`
--

CREATE TABLE IF NOT EXISTS `typescompetences` (
  `idTypeCompetence` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(21) NOT NULL,
  PRIMARY KEY (`idTypeCompetence`),
  UNIQUE KEY `idTypeCompetence` (`idTypeCompetence`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `typescompetences`
--

INSERT INTO `typescompetences` (`idTypeCompetence`, `nom`) VALUES
(1, 'Magique'),
(2, 'Physique'),
(3, 'Defensive'),
(4, 'Support');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `caracteristiquesennemis`
--
ALTER TABLE `caracteristiquesennemis`
  ADD CONSTRAINT `CaracteristiquesEnnemis_Caracteristiques_FK` FOREIGN KEY (`idCaracteristique`) REFERENCES `caracteristiques` (`idCaracteristique`),
  ADD CONSTRAINT `CaracteristiquesEnnemis_Ennemis_FK` FOREIGN KEY (`idEnnemi`) REFERENCES `ennemis` (`idEnnemi`);

--
-- Contraintes pour la table `caracteristiquespersonnages`
--
ALTER TABLE `caracteristiquespersonnages`
  ADD CONSTRAINT `CaracteristiquesPersonnages_Caracteristiques_FK` FOREIGN KEY (`idCaracteristique`) REFERENCES `caracteristiques` (`idCaracteristique`),
  ADD CONSTRAINT `CaracteristiquesPersonnages_Personnages_FK` FOREIGN KEY (`idPersonnage`) REFERENCES `personnages` (`idPersonnage`);

--
-- Contraintes pour la table `caracteristiquesprofessions`
--
ALTER TABLE `caracteristiquesprofessions`
  ADD CONSTRAINT `CaracteristiquesProfessions_Professions_FK` FOREIGN KEY (`idProfession`) REFERENCES `professions` (`idProfession`),
  ADD CONSTRAINT `CaracteristiquesProfessions_Caracteristiques_FK` FOREIGN KEY (`idCaracteristique`) REFERENCES `caracteristiques` (`idCaracteristique`);

--
-- Contraintes pour la table `competences`
--
ALTER TABLE `competences`
  ADD CONSTRAINT `Competences_TypesCompetences_FK` FOREIGN KEY (`idTypeCompetence`) REFERENCES `typescompetences` (`idTypeCompetence`);

--
-- Contraintes pour la table `competencesennemis`
--
ALTER TABLE `competencesennemis`
  ADD CONSTRAINT `CompetencesEnnemis_Ennemis_FK` FOREIGN KEY (`idEnnemi`) REFERENCES `ennemis` (`idEnnemi`),
  ADD CONSTRAINT `CompetencesEnnemis_Competences_FK` FOREIGN KEY (`idCompetence`) REFERENCES `competences` (`idCompetence`);

--
-- Contraintes pour la table `competencesprofessions`
--
ALTER TABLE `competencesprofessions`
  ADD CONSTRAINT `CompetencesProfessions_Professions_FK` FOREIGN KEY (`idProfession`) REFERENCES `professions` (`idProfession`),
  ADD CONSTRAINT `CompetencesProfessions_Competences_FK` FOREIGN KEY (`idCompetence`) REFERENCES `competences` (`idCompetence`);

--
-- Contraintes pour la table `ennemis`
--
ALTER TABLE `ennemis`
  ADD CONSTRAINT `Ennemis_Inventaires_FK` FOREIGN KEY (`idInventaire`) REFERENCES `inventaires` (`idInventaire`);

--
-- Contraintes pour la table `equipements`
--
ALTER TABLE `equipements`
  ADD CONSTRAINT `Equipements_EquipementsModeles_FK` FOREIGN KEY (`idEquipementModele`) REFERENCES `equipementsmodeles` (`idEquipementModele`);

--
-- Contraintes pour la table `equipementsmodeles`
--
ALTER TABLE `equipementsmodeles`
  ADD CONSTRAINT `EquipementsModeles_Modeles_FK` FOREIGN KEY (`idModele`) REFERENCES `modeles` (`idModele`);

--
-- Contraintes pour la table `equipementspersonnages`
--
ALTER TABLE `equipementspersonnages`
  ADD CONSTRAINT `EquipementsPersonnages_Equipements_FK` FOREIGN KEY (`idEquipement`) REFERENCES `equipements` (`idEquipement`),
  ADD CONSTRAINT `EquipementsPersonnages_Personnages_FK` FOREIGN KEY (`idPersonnage`) REFERENCES `personnages` (`idPersonnage`);

--
-- Contraintes pour la table `personnages`
--
ALTER TABLE `personnages`
  ADD CONSTRAINT `Personnages_Statistique_FK` FOREIGN KEY (`idStatistique`) REFERENCES `statistiques` (`idStatistique`),
  ADD CONSTRAINT `Personnages_Inventaires_FK` FOREIGN KEY (`idInventaire`) REFERENCES `inventaires` (`idInventaire`),
  ADD CONSTRAINT `Personnages_Joueurs_FK` FOREIGN KEY (`idJoueur`) REFERENCES `joueurs` (`idJoueur`),
  ADD CONSTRAINT `Personnages_Professions_FK` FOREIGN KEY (`idProfession`) REFERENCES `professions` (`idProfession`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
