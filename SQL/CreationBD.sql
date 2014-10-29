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

CREATE TABLE IF NOT EXISTS Joueurs
(
	idJoueur INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	pseudonyme VARCHAR(21) NOT NULL UNIQUE
,	motDePasse VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS Inventaires
(
	idInventaire INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	argent DOUBLE NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS Ennemis
(
	idEnnemi INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idInventaire INT
,	nom VARCHAR(31) NOT NULL UNIQUE
,	niveau INT NOT NULL DEFAULT 1
,	image VARCHAR(255)
,	boss BOOL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS Modeles
(
	idModele INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(21) NOT NULL
,	deuxMains BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS EquipementsModeles
(
	idEquipementModele INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idModele INT NOT NULL
,	nom VARCHAR(51) NOT NULL
,	prix DOUBLE NOT NULL DEFAULT 0
,	image VARCHAR(255)
,	degatMin INT NOT NULL DEFAULT 0
,	degatMax INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS Caracteristiques
(
	idCaracteristique INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(31) NOT NULL UNIQUE
/*,	valeur INT NOT NULL DEFAULT 0 DOIT ÊTRE ENLEVÉ */
);

CREATE TABLE IF NOT EXISTS Statistiques
(
	idStatistique INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	tempsDeJeu TIME NOT NULL DEFAULT 0
,	nombreDeCombat INT NOT NULL DEFAULT 0
,	victoire INT NOT NULL DEFAULT 0
,	defaite INT NOT NULL DEFAULT 0
,	dommageTotal INT NOT NULL DEFAULT 0
,	moyenneDommage INT NOT NULL DEFAULT 0
,	nombreAttaque INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS Professions
(
	idProfession INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(21)
,	image VARCHAR(255)
,	description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Personnages
(
	idPersonnage INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idProfession INT NOT NULL
,	idInventaire INT NOT NULL
,	idJoueur INT NOT NULL
,	idStatistique INT NOT NULL
,	nom VARCHAR(21) NOT NULL UNIQUE
,	niveau INT NOT NULL DEFAULT 1
,	experience INT NOT NULL DEFAULT 0
,	image VARCHAR(255)
,	estActif BOOL NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS CaracteristiquesProfessions
(
	idCaracteristiqueProfession INT AUTO_INCREMENT PRIMARY KEY NOT NULL
,	idCaracteristique INT NOT NULL
,	idProfession INT NOT NULL
,	valeur INT NOT NULL
);

CREATE TABLE IF NOT EXISTS CaracteristiquesEnnemis
(
	idCaracteristiqueEnnemi INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idCaracteristique INT NOT NULL
,	idEnnemi INT NOT NULL
,	valeur INT NOT NULL
);

CREATE TABLE IF NOT EXISTS CaracteristiquesEquipementsModeles
(
	idCaracteristiqueEquipementModele INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idCaracteristique INT NOT NULL
,	idEquipementModele INT NOT NULL
,	valeur INT NOT NULL
);

CREATE TABLE IF NOT EXISTS CaracteristiquesPersonnages
(
	idCaracteristiquePersonnage INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idCaracteristique INT NOT NULL
,	idPersonnage INT NOT NULL
, 	valeur INT NOT NULL /* RAJOUTER LA VALEUR ICI */
);

CREATE TABLE IF NOT EXISTS Equipements
(
	idEquipement INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idEquipementModele INT NOT NULL
);

CREATE TABLE IF NOT EXISTS InventairesEquipements
(
	idInventaireEquipement INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idInventaire INT NOT NULL
,	idEquipement INT NOT NULL
,	quantite INT NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS EquipementsPersonnages
(
	idEquipementPersonnage INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idEquipement INT NOT NULL
,	idPersonnage INT NOT NULL
,	idModele INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Effets
(
	idEffet INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(21) NOT NULL
,	description VARCHAR(255) NOT NULL
,	tempsEffets INT NOT NULL
);

CREATE TABLE IF NOT EXISTS TypesCompetences
(
	idTypeCompetence INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(21) NOT NULL
);

CREATE TABLE IF NOT EXISTS Competences
(
	idCompetence INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idTypeCompetence INT NOT NULL
,	idEffet INT
,	nom VARCHAR(31) NOT NULL UNIQUE
,	valeurMin INT NOT NULL DEFAULT 0
,	valeurMax INT NOT NULL DEFAULT 0
,	energieUtilise INT NOT NULL DEFAULT 0
,	tempsRecharge INT NOT NULL DEFAULT 0
,	description VARCHAR(255)
,	image VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CompetencesEnnemis
(
	idCompetenceEnnemi INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idCompetence INT NOT NULL
,	idEnnemi INT NOT NULL
);

CREATE TABLE IF NOT EXISTS CompetencesProfessions
(
	idCompetenceProfession INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idCompetence INT NOT NULL
,	idProfession INT NOT NULL
);

ALTER TABLE Competences
ADD CONSTRAINT Competences_TypesCompetences_FK
FOREIGN KEY (idTypeCompetence) REFERENCES TypesCompetences(idTypeCompetence);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Professions_FK
FOREIGN KEY (idProfession) REFERENCES Professions(idProfession);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Inventaires_FK
FOREIGN KEY (idInventaire) REFERENCES Inventaires(idInventaire);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Joueurs_FK
FOREIGN KEY (idJoueur) REFERENCES Joueurs(idJoueur);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Statistique_FK
FOREIGN KEY (idStatistique) REFERENCES Statistiques(idStatistique);

ALTER TABLE CompetencesProfessions
ADD CONSTRAINT CompetencesProfessions_Competences_FK
FOREIGN KEY (idCompetence) REFERENCES Competences(idCompetence);

ALTER TABLE CompetencesProfessions
ADD CONSTRAINT CompetencesProfessions_Professions_FK
FOREIGN KEY (idProfession) REFERENCES Professions(idProfession);

ALTER TABLE CompetencesEnnemis
ADD CONSTRAINT CompetencesEnnemis_Competences_FK
FOREIGN KEY (idCompetence) REFERENCES Competences(idCompetence);

ALTER TABLE CompetencesEnnemis
ADD CONSTRAINT CompetencesEnnemis_Ennemis_FK
FOREIGN KEY (idEnnemi) REFERENCES Ennemis(idEnnemi);

ALTER TABLE Ennemis
ADD CONSTRAINT Ennemis_Inventaires_FK
FOREIGN KEY (idInventaire) REFERENCES Inventaires(idInventaire);

ALTER TABLE CaracteristiquesEnnemis
ADD CONSTRAINT CaracteristiquesEnnemis_Ennemis_FK
FOREIGN KEY (idEnnemi) REFERENCES Ennemis(idEnnemi);

ALTER TABLE CaracteristiquesEnnemis
ADD CONSTRAINT CaracteristiquesEnnemis_Caracteristiques_FK
FOREIGN KEY (idCaracteristique) REFERENCES Caracteristiques(idCaracteristique);

ALTER TABLE CaracteristiquesPersonnages
ADD CONSTRAINT CaracteristiquesPersonnages_Personnages_FK
FOREIGN KEY (idPersonnage) REFERENCES Personnages(idPersonnage);

ALTER TABLE CaracteristiquesPersonnages
ADD CONSTRAINT CaracteristiquesPersonnages_Caracteristiques_FK
FOREIGN KEY (idCaracteristique) REFERENCES Caracteristiques(idCaracteristique);

ALTER TABLE EquipementsPersonnages
ADD CONSTRAINT EquipementsPersonnages_Personnages_FK
FOREIGN KEY (idPersonnage) REFERENCES Personnages(idPersonnage);

ALTER TABLE EquipementsPersonnages
ADD CONSTRAINT EquipementsPersonnages_Equipements_FK
FOREIGN KEY (idEquipement) REFERENCES Equipements(idEquipement);

ALTER TABLE Equipements
ADD CONSTRAINT Equipements_EquipementsModeles_FK
FOREIGN KEY (idEquipementModele) REFERENCES EquipementsModeles(idEquipementModele);

ALTER TABLE EquipementsModeles
ADD CONSTRAINT EquipementsModeles_Modeles_FK
FOREIGN KEY (idModele) REFERENCES Modeles(idModele);

ALTER TABLE CaracteristiquesProfessions
ADD CONSTRAINT CaracteristiquesProfessions_Caracteristiques_FK
FOREIGN KEY (idCaracteristique) REFERENCES Caracteristiques(idCaracteristique);

ALTER TABLE CaracteristiquesProfessions
ADD CONSTRAINT CaracteristiquesProfessions_Professions_FK
FOREIGN KEY (idProfession) REFERENCES Professions(idProfession);

﻿/* DÉBUT DES BOSS */

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Azazel'
,	3
,	TRUE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Moguarnoch'
,	6
,	TRUE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Zakuta'
,	9
,	TRUE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Ful\'kitak'
,	12
,	TRUE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Harfanghei'
,	15
,	TRUE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Arkanok'
,	18
,	TRUE
);
/* FIN DES BOSS*/

/* DÉBUT ENNEMI COMMUN */
INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Ange déchu'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Bandit'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Centaure'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Dragon'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Elfe'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Farfadet'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Gorgone'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Hydre'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Iguane démoniaque'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Jaguar géant'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Kraken'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Licorne'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Minotaure'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Nécromancien'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Ogre'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Ptérodactyle'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Rhinocéros sauvage'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Satyre'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Troll'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Ubuntu'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Vampire'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Worg'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Yéti'
,	1
,	FALSE
);

INSERT INTO Ennemis
(nom, niveau, boss)
VALUES
(
	'Zombie'
,	1
,	FALSE
);
/* FIN ENNEMI COMMUN */

﻿INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Arme à une main'
,	FALSE
);

INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Arme à deux mains'
,	TRUE
);

INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Bouclier'
,	FALSE
);

INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Casque'
,	FALSE
);

INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Épaulette'
,	FALSE
);

INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Plastron'
,	FALSE
);

INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Bottes'
,	FALSE
);

INSERT INTO Modeles
(nom, deuxMains)
VALUES
(
	'Pantalon'
,	FALSE
);

﻿INSERT INTO Caracteristiques
(nom)
VALUES
(
	'Force'
);

INSERT INTO Caracteristiques
(nom)
VALUES
(
	'Vie'
);

INSERT INTO Caracteristiques
(nom)
VALUES
(
	'Vitesse'
);

INSERT INTO Caracteristiques
(nom)
VALUES
(
	'Défense'
);

INSERT INTO Caracteristiques
(nom)
VALUES
(
	'Énergie'
);

﻿INSERT INTO Professions
(nom, description)
VALUES
(
	'Paladin'
,	'Le paladin est un guerrier croyant en les dieux. Il ne se bat que s\'il en sent le besoin.
	Durant les combats, il les implore pour avoir leur aide pour le guérrir ou simplement enchanter ses
	attaques.'
);

INSERT INTO Professions
(nom, description)
VALUES
(
	'Magicien'
,	'Le magicien étudie différent type de magie, mais exclut la magie noire. Il contrôle les arcanes,
	le feu et l\'électricité. Il se sert de sorts pour attaquer son ennemi, mais aussi pour se protéger. Les sorts
	du magicien sont très puissant et efficaces, cependant, le magicien n\'est pas aussi solide physiquement qu\'un guerrier.'
);

INSERT INTO Professions
(nom, description)
VALUES
(
	'Guerrier'
,	'Le guerrier est une brute ne se fiant qu\'à sa force pour abattre ses ennemis, il n\'hésite pas une seconde
	à enfoncer son sur sur ceux-ci. Endurci par les combats au corps à corps, le guerrier est résistant et physiquement
	très fort.'
);

﻿/* DÉBUT CARACTERISTIQUE GUERRIER */
INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	8
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	3
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(

	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	2
);
/* FIN CARACTERISTIQUE GUERRIER */

/* DÉBUT CARACTERISTIQUE PALADIN */
INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	3
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(

	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	4
);
/* FIN CARACTERISTIQUE PALADIN */

/* DÉBUT CARACTERISTIQUE MAGICIEN */
INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	2
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	3
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	5
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	7
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(

	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	8
);
/* FIN CARACTERISTIQUE MAGICIEN */

﻿/* DÉBUT CARACTERISTIQUE BOSS */
INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	8
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	17
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	13
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(

	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	16
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	35
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	23
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	14
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	25
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	12
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	15
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	39
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	27
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	42
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	31
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	10
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	45
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	36
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	53
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	31
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	23
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	39
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	53
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	75
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	20
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	67
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	82
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	72
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	61
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	59
);
/* FIN CARACTERISTIQUE BOSS */

/* DÉBUT CARACTÉRISTIQUE ENNEMIS A-H */
INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ange déchu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ange déchu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ange déchu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ange déchu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ange déchu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Bandit')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Bandit')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Bandit')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Bandit')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Bandit')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Centaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Centaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Centaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Centaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Centaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Farfadet')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Farfadet')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Farfadet')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Farfadet')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Farfadet')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Gorgone')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Gorgone')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Gorgone')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Gorgone')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Gorgone')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Hydre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Hydre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Hydre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Hydre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Hydre')
,	5
);
/* FIN CARACTÉRISTIQUE ENNEMIS A-H */

/* DÉBUT CARACTÉRISTIQUE ENNEMIS I-P */
INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Iguane démoniaque')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Iguane démoniaque')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Iguane démoniaque')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Iguane démoniaque')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Iguane démoniaque')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Jaguar géant')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Jaguar géant')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Jaguar géant')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Jaguar géant')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Jaguar géant')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Kraken')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Kraken')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Kraken')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Kraken')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Kraken')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Licorne')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Licorne')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Licorne')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Licorne')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Licorne')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Minotaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Minotaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Minotaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Minotaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Minotaure')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Nécromancien')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Nécromancien')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Nécromancien')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Nécromancien')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Nécromancien')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ogre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ogre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ogre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ogre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ogre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	5
);
/* FIN CARACTÉRISTIQUE ENNEMIS I-P */

/* DÉBUT CARACTÉRISTIQUE ENNEMIS Q-Z */
INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Satyre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Satyre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Satyre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Satyre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Satyre')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Troll')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Troll')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Troll')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Troll')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Troll')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Worg')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Worg')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Worg')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Worg')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Worg')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Yéti')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Yéti')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Yéti')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Yéti')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Yéti')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	5
);

INSERT INTO CaracteristiquesEnnemis
(idCaracteristique, idEnnemi, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	5
);
/* FIN CARACTÉRISTIQUE ENNEMIS Q-Z */

﻿/*DÉBUT PRATIQUE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de pratique'
	,	7.07
	,	2
	,	4
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de pratique'
	,	7.07
	,	2
	,	4
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de pratique'
	,	4.71
	,	1
	,	3
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de pratique'
	,	4.71
	,	0
	,	0
	);
/* FIN PRATIQUE */

/*DÉBUT ROUILLÉ*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée rouillée'
	,	134.30
	,	3
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton rouillé'
	,	134.30
	,	3
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau rouillé'
	,	89.54
	,	2
	,	5
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier rouillé'
	,	89.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague rouillée'
	,	89.54
	,	2
	,	5
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette rouillée'
	,	89.54
	,	2
	,	5
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache rouillée'
	,	134.30
	,	3
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance rouillée'
	,	134.30
	,	3
	,	6
	);
/* FIN ROUILLÉ */

/*DÉBUT MAGIQUE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée magique'
	,	311.02
	,	4
	,	8
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton magique'
	,	311.02
	,	4
	,	8
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau magique'
	,	207.35
	,	2
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier magique'
	,	207.35
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague magique'
	,	207.35
	,	2
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette magique'
	,	207.35
	,	2
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache magique'
	,	311.02
	,	4
	,	8
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance magique'
	,	311.02
	,	4
	,	8
	);
/* FIN MAGIQUE */

/*DÉBUT ÉLÉMENTAL*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée élémentale'
	,	1032.02
	,	6
	,	12
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton élémental'
	,	1032.02
	,	6
	,	12
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau élémental'
	,	688.01
	,	3
	,	9
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier élémental'
	,	688.01
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague élémentale'
	,	688.01
	,	3
	,	9
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette élémentale'
	,	688.01
	,	3
	,	9
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache élémentale'
	,	1032.02
	,	6
	,	12
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance élémentale'
	,	1032.02
	,	6
	,	12
	);
/* FIN ÉLÉMENTAL */

/*DÉBUT BRONZE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de bronze'
	,	1632.84
	,	7
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de bronze'
	,	1632.84
	,	7
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de bronze'
	,	1088.56
	,	4
	,	11
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de bronze'
	,	1088.56
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague de bronze'
	,	1088.56
	,	4
	,	11
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette de bronze'
	,	1088.56
	,	4
	,	11
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache de bronze'
	,	1632.84
	,	7
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance de bronze'
	,	1632.84
	,	7
	,	14
	);
/* FIN BRONZE */

/*DÉBUT FER*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de fer'
	,	3456.54
	,	9
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de fer'
	,	3456.54
	,	9
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de fer'
	,	2304.36
	,	5
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de fer'
	,	2304.36
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague de fer'
	,	2304.36
	,	5
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette de fer'
	,	2304.36
	,	5
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache de fer'
	,	3456.54
	,	9
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance de fer'
	,	3456.54
	,	9
	,	18
	);
/* FIN FER */

/*DÉBUT ENCHANTÉ*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée enchantée'
	,	4735.96
	,	10
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton enchanté'
	,	4735.96
	,	10
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau enchanté'
	,	3157.30
	,	5
	,	15
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier enchanté'
	,	3157.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague enchantée'
	,	3157.30
	,	5
	,	15
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette enchantée'
	,	3157.30
	,	5
	,	15
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache enchantée'
	,	4735.96
	,	10
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance enchantée'
	,	4735.96
	,	10
	,	20
	);
/* FIN ENCHANTÉ */

/*DÉBUT MAUDIT*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée maudite'
	,	8171.30
	,	12
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton maudit'
	,	8171.30
	,	12
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau maudit'
	,	5447.53
	,	6
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier maudit'
	,	5447.53
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague maudite'
	,	5447.53
	,	6
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette maudite'
	,	5447.53
	,	6
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache maudite'
	,	8171.30
	,	12
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance maudite'
	,	8171.30
	,	12
	,	24
	);
/* FIN MAUDIT */

/*DÉBUT SACRÉ*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée sacrée'
	,	10383.77
	,	13
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton sacré'
	,	10383.77
	,	13
	,	16
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau sacré'
	,	6922.52
	,	7
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier sacré'
	,	6922.52
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague sacrée'
	,	6922.52
	,	7
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette sacrée'
	,	6922.52
	,	7
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache sacrée'
	,	10383.77
	,	13
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance sacrée'
	,	10383.77
	,	13
	,	26
	);
/* FIN SACRÉ */

/*DÉBUT CRYSTAL*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de crystal'
	,	15939.69
	,	15
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de crystal'
	,	15939.69
	,	15
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de crystal'
	,	10626.46
	,	8
	,	23
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de crystal'
	,	10626.46
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague de crystal'
	,	10626.46
	,	8
	,	23
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette de crystal'
	,	10626.46
	,	8
	,	23
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache de crystal'
	,	15939.69
	,	15
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance de crystal'
	,	15939.69
	,	15
	,	30
	);
/* FIN CRYSTAL*/

/*DÉBUT HÉROÏQUE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée héroïque'
	,	19339.70
	,	16
	,	32
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton héroïque'
	,	19339.70
	,	16
	,	32
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau héroïque'
	,	12893.13
	,	8
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier héroïque'
	,	12893.13
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague héroïque'
	,	12893.13
	,	8
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette héroïque'
	,	12893.13
	,	8
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache héroïque'
	,	19339.70
	,	16
	,	32
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance héroïque'
	,	19339.70
	,	16
	,	32
	);
/* FIN HÉROÏQUE */

/*DÉBUT LÉGENDAIRE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée légendaire'
	,	23192.08
	,	17
	,	34
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton légendaire'
	,	23192.08
	,	17
	,	34
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau légendaire'
	,	15461.38
	,	9
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier légendaire'
	,	15461.38
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague légendaire'
	,	15461.38
	,	9
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette légendaire'
	,	15461.38
	,	9
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache légendaire'
	,	23192.08
	,	17
	,	34
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance légendaire'
	,	23192.08
	,	17
	,	34
	);
/* FIN LÉGENDAIRE */

/*DÉBUT DIAMANT*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de diamant'
	,	32367.12
	,	19
	,	38
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de diamant'
	,	32367.12
	,	19
	,	38
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de diamant'
	,	21578.08
	,	10
	,	29
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de diamant'
	,	21578.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague de diamant'
	,	21578.08
	,	10
	,	29
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette de diamant'
	,	21578.08
	,	10
	,	29
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache de diamant'
	,	32367.12
	,	19
	,	38
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance de diamant'
	,	32367.12
	,	19
	,	38
	);
/* FIN DIAMAND */

/*DÉBUT CÉLESTE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée céleste'
	,	37746.32
	,	20
	,	40
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton céleste'
	,	37746.32
	,	20
	,	40
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau céleste'
	,	25164.22
	,	10
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier céleste'
	,	25164.22
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague céleste'
	,	25164.22
	,	10
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette céleste'
	,	25164.22
	,	10
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache céleste'
	,	37746.32
	,	20
	,	40
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance céleste'
	,	37746.32
	,	20
	,	40
	);
/* FIN CÉLESTE */

﻿/* DÉBUT CUIR/TISSU */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron de cuir'
	,	7.07
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe de tissu'
	,	7.07
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon de cuir'
	,	7.07
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon de tissu'
	,	7.07
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes de cuir'
	,	4.71
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes de tissu'
	,	4.71
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque de cuir'
	,	4.71
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne'
	,	4.71
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes de cuir'
	,	4.71
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers'
	,	4.71
	,	0
	,	0
	);
/* FIN CUIR/TISSU */

/* DÉBUT ROUILLÉ */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron rouillé'
	,	134.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe de tissu renforcé'
	,	134.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon rouillé'
	,	134.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon de tissu renforcé'
	,	134.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes rouillées'
	,	89.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes de tissu renforcé'
	,	89.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque rouillé'
	,	89.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne rouillée'
	,	89.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes rouillées'
	,	89.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers rouillés'
	,	89.54
	,	0
	,	0
	);
/* FIN ROUILLÉ */

/* DÉBUT MAGIQUE */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron magique'
	,	311.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe magique'
	,	311.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon magique'
	,	311.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings magiques'
	,	311.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes magiques'
	,	207.35
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières magiques'
	,	207.35
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque magique'
	,	207.35
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne magique'
	,	207.35
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes magiques'
	,	207.35
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers magiques'
	,	207.35
	,	0
	,	0
	);
/* FIN MAGIQUE */

/* DÉBUT MAILLE */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron de maille'
	,	1032.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe de maille'
	,	1032.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon de maille'
	,	1032.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings de maille'
	,	1032.02
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes de maille'
	,	688.01
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières de maille'
	,	688.01
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque de maille'
	,	688.01
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne de maille'
	,	688.01
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes de maille'
	,	688.01
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers de maille'
	,	688.01
	,	0
	,	0
	);
/* FIN MAILLE */

/* DÉBUT BRONZE */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron de bronze'
	,	1632.84
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe de bronze'
	,	1632.84
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon de bronze'
	,	1632.84
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings de bronze'
	,	1632.84
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes de bronze'
	,	1088.56
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières de bronze'
	,	1088.56
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque de bronze'
	,	1088.56
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne de bronze'
	,	1088.56
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes de bronze'
	,	1088.56
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers de bronze'
	,	1088.56
	,	0
	,	0
	);
/* FIN BRONZE */

/* DÉBUT FER */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron de fer'
	,	3456.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe de fer'
	,	3456.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon de fer'
	,	3456.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings de fer'
	,	3456.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes de fer'
	,	2304.36
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières de fer'
	,	2304.36
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque de fer'
	,	2304.36
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne de fer'
	,	2304.36
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes de fer'
	,	2304.36
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers de fer'
	,	2304.36
	,	0
	,	0
	);
/* FIN FER */

/* DÉBUT ENCHANTÉ */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron enchanté'
	,	4735.96
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe enchantée'
	,	4735.96
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon enchanté'
	,	4735.96
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings enchantés'
	,	4735.96
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes enchantées'
	,	3157.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières enchantées'
	,	3157.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque enchanté'
	,	3157.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne enchantée'
	,	3157.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes enchantées'
	,	3157.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers enchantés'
	,	3157.30
	,	0
	,	0
	);
/* FIN ENCHANTÉ */

/* DÉBUT MAUDIT */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron maudit'
	,	8171.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe maudite'
	,	8171.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon maudit'
	,	8171.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings maudits'
	,	8171.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes maudites'
	,	5447.53
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières maudites'
	,	5447.53
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque maudit'
	,	5447.53
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne maudite'
	,	5447.53
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes maudites'
	,	5447.53
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers maudits'
	,	5447.53
	,	0
	,	0
	);
/* FIN MAUDIT */

/* DÉBUT SACRÉ */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron sacré'
	,	10383.77
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe sacrée'
	,	10383.77
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon sacré'
	,	10383.77
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings sacrés'
	,	10383.77
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes sacrées'
	,	6922.52
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières sacrées'
	,	6922.52
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque sacré'
	,	6922.52
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne sacrée'
	,	6922.52
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes sacrées'
	,	6922.52
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers sacrés'
	,	6922.52
	,	0
	,	0
	);
/* FIN SACRÉ */

/* DÉBUT OR */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron en or'
	,	15939.69
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe en or'
	,	15939.69
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon en or'
	,	15939.69
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings en or'
	,	15939.69
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes en or'
	,	10626.46
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières en or'
	,	10626.46
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque en or'
	,	10626.46
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne en or'
	,	10626.46
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes en or'
	,	10626.46
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers en or'
	,	10626.46
	,	0
	,	0
	);
/* FIN OR */

/* DÉBUT HÉROÏQUE */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron héroïque'
	,	19339.70
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe héroïque'
	,	19339.70
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon héroïque'
	,	19339.70
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings héroïques'
	,	19339.70
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes héroïques'
	,	12893.13
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières héroïques'
	,	12893.13
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque héroïque'
	,	12893.13
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne héroïque'
	,	12893.13
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes héroïques'
	,	12893.13
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers héroïques'
	,	12893.13
	,	0
	,	0
	);
/* FIN HÉROÏQUE */

/* DÉBUT LÉGENDAIRE */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron légendaire'
	,	23192.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe légendaire'
	,	23192.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon légendaire'
	,	23192.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings légendaires'
	,	23192.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes légendaires'
	,	15461.38
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières légendaires'
	,	15461.38
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque légendaire'
	,	15461.38
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne légendaire'
	,	15461.38
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes légendaires'
	,	15461.38
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers légendaires'
	,	15461.38
	,	0
	,	0
	);
/* FIN LÉGENDAIRE */

/* DÉBUT DIAMANT */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron de diamant'
	,	32367.12
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe de diamant'
	,	32367.12
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon de diamant'
	,	32367.12
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings de diamant'
	,	32367.12
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes de diamant'
	,	21578.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières de diamant'
	,	21578.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque de diamant'
	,	21578.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne de diamant'
	,	21578.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes de diamant'
	,	21578.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers de diamant'
	,	21578.08
	,	0
	,	0
	);
/* FIN DIAMANT */

/* DÉBUT CÉLESTE */
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Plastron céleste'
	,	37746.32
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Plastron')
	,	'Robe céleste'
	,	37746.32
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Pantalon céleste'
	,	37746.32
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Pantalon')
	,	'Leggings célestes'
	,	37746.32
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulettes célestes'
	,	25164.22
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Épaulette')
	,	'Épaulières célestes'
	,	25164.22
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Casque céleste'
	,	25164.22
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Casque')
	,	'Couronne céleste'
	,	25164.22
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Bottes célestes'
	,	25164.22
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bottes')
	,	'Souliers célestes'
	,	25164.22
	,	0
	,	0
	);
/* FIN CÉLESTE */

﻿/* DÉBUT CUIR/TISSU */
INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de tissu')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de tissu')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers')
,	1
);
/* FIN CUIR/TISSU */

/* DÉBUT ROUILLÉ */
INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé')
,	9
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé')
,	9
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes rouillées')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes rouillées')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de tissu renforcé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de tissu renforcé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque rouillé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque rouillé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne rouillée')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne rouillée')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes rouillées')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes rouillées')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers rouillés')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers rouillés')
,	3
);
/* FIN ROUILLÉ */

/* DÉBUT MAGIQUE */
INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique')
,	12
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique')
,	12
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers magiques')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers magiques')
,	4
);
/* FIN MAGIQUE */

﻿INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de pratique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de pratique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de pratique')
,	1
);

/* FIN PRATIQUE */

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée rouillée')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée rouillée')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton rouillé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton rouillé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau rouillé')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau rouillé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier rouillé')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier rouillé')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague rouillée')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague rouillée')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette rouillée')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette rouillée')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache rouillée')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache rouillée')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance rouillée')
,	3
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance rouillée')
,	6
);

/* FIN ROUILLÉ */

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée magique')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton magique')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau magique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier magique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague magique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette magique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache magique')
,	4
);


INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache magique')
,	8
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance magique')
,	4
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance magique')
,	8
);

/* FIN MAGIQUE */


﻿INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Peur'
,	'La cible ne peut pas attaquer'
,	2
);
INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Saignement'
,	'La cible reçoit des dégâts par tour'
,	2
);

INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Brulure'
,	'La cible reçoit des dégâts de feu par tour'
,	3
);

INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Protection'
,	'Le sort absorbe des dégats'
,	3
);

INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Glacé'
,	'L\'ennemi est gelé et sa vitesse est baissé de moitié'
,	3
);

INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Rapidité accru'
,	'La vitesse est augmenté de 50%'
,	3
);

INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Immobile'
,	'L\'ennemi ne peut pas attaqué'
,	2
);

INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Manipulation'
,	'La cible s\'inflige des dégats avec sa propre attaque'
,	0
);

INSERT INTO Effets
(nom, description, tempsEffets)
VALUES
(
	'Empoisonné'
,	'La cible reçoit des dégâts par tour'
,	3
);

﻿INSERT INTO TypesCompetences
(nom)
VALUES
(
	'Magique'
);

INSERT INTO TypesCompetences
(nom)
VALUES
(
	'Physique'
);

INSERT INTO TypesCompetences
(nom)
VALUES
(
	'Defensive'
);

INSERT INTO TypesCompetences
(nom)
VALUES
(
	'Support'
);

﻿INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Attaque physique'
,	2
,	5
,	0
,	1
,	'Attaque simple effectué avec les pièces d\'équipements portées. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Rayon horrifiant'
,	7
,	12
,	5
,	3
,	'Rayon rouge qui fait trembler l\'ennemi de peur. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	(SELECT idEffet FROM Effets WHERE nom='Peur')
,	'Hurlement de terreur'
,	10
,	18
,	14
,	4
,	CONCAT('Hurlement qui fige l\'ennemi de peur. ',(SELECT description FROM Effets WHERE nom='Peur'),' pendant 2 tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Coup mental'
,	20
,	29
,	27
,	5
,	'Sort magique qui trouble votre esprit et vous affaiblit. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Lancer de l\'épée'
,	8
,	12
,	6
,	2
,	'Lance une épée qui afflige de lourd dégât à l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Saignement')
,	'Torture physique'
,	17
,	21
,	10
,	4
,	CONCAT('Torture l\'ennemi avec un couteau. ',(SELECT description FROM Effets WHERE nom='Saignement'),' pendant 2 tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Tuerie'
,	20
,	30
,	19
,	5
,	'Devient en furie et détruit tout sur son passage. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,	(SELECT idEffet FROM Effets WHERE nom='Protection')
,	'Bouclier des éléments'
,	30
,	35
,	14
,	3
,	CONCAT('Absorbe les dégâts reçut dans ce bouclier résistant. ',(SELECT description FROM Effets WHERE nom='Protection'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,	NULL
,	'Guérison chamanistique'
,	45
,	49
,	20
,	4
,	'Il se guérit avec les pouvoirs chamanique. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Attaque des éléments'
,	24
,	30
,	18
,	3
,	'Invoque la puissance de la nature puis la déchaine contre l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Attaque squelettique'
,	20
,	28
,	26
,	2
,	'Envoi une malédiction qui cible le squelette de l\'ennemi . '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Tempête de morts'
,	25
,	30
,	30
,	3
,	'Libère la colère des revenants sur l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	(SELECT idEffet FROM Effets WHERE nom='Brulure')
,	'Feu démoniaque'
,	38
,	45
,	36
,	4
,	CONCAT('Attaque l\'ennemi avec le feu brûlant des enfers. ',(SELECT description FROM Effets WHERE nom='Brulure'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Brulure') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Saignement')
,	'Coup de griffe'
,	12
,	20
,	8
,	3
,	Concat('Coup de griffe sauvage. ',(SELECT description FROM Effets WHERE nom='Saignement'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Saignement') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Morsure endiablée'
,	18
,	25
,	14
,	3
,	'Attaque l\'ennemi en le mordant avec la puissance de sa mâchoire. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Furie animale'
,	27
,	34
,	20
,	4
,	'Déclanche sa furie et attaque l\'ennemi de multiple coups. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Coup demoniaque'
,	14
,	27
,	13
,	2
,	'Frappe l\'ennemi avec la puissance des démons. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,	NULL
,	'Rituel de guérison'
,	32
,	47
,	19
,	3
,	'Guérit la cible grâce à la puissance des ténèbres. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Coup des dieux corrompus'
,	29
,	50
,	29
,	3
,	'Frappe l\'ennemi de toute sa puissance avec la hache légendaire des dieux célestes corrompu. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Boule de feu'
,	5
,	10
,	4
,	2
,	'Lance une boule de feu à l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,	(SELECT idEffet FROM Effets WHERE nom='Protection')
,	'Armure Arcanique'
,	6
,	14
,	12
,	3
,	Concat('Armure des arcanes. ',(SELECT description FROM Effets WHERE nom='Protection'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Décharge électrique'
,	16
,	25
,	25
,	4
,	'Lance une boule de feu à l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Coup divin'
,	4
,	7
,	3
,	2
,	'Attaque l\'ennemi avec la puissance des dieux célestes. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,	NULL
,	'Prière de guérison'
,	7
,	10
,	5
,	3
,	'Implore les dieux pour le guérir de ses douleurs et lui donner de la vie. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Marteau des dieux'
,	14
,	21
,	17
,	4
,	'Les dieux enchantent l\'arme et la transforme en marteau céleste. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,	(SELECT idEffet FROM Effets WHERE nom='Protection')
,	'Peau d\'acier'
,	4
,	8
,	2
,	3
,	Concat('La peau de la cible se durcit et devient aussi dure que l\'acier. ',(SELECT description FROM Effets WHERE nom='Protection'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Attaque précise'
,	12
,	16
,	5
,	3
,	'Concentre son attaque sur un même point précis. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Vision de sang'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Tir gelé'
,	15
,	22
,	12
,	4
,	Concat('La peau de la cible se durcit et devient aussi dure que l\'acier. ',(SELECT description FROM Effets WHERE nom='Glacé'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Glacé') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Tir explosif'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Empoisonnement'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Tir rapide'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,	(SELECT idEffet FROM Effets WHERE nom='Protection')
,	'Gardien'
,	15
,	20
,	7
,	4
,	Concat('Bouclier divin pouvant absorber les dégats pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection'))
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Souffle de feu'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Rapidité accru')
,	'Mouvement agile'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Immobile')
,	'Pétrification'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Régénération'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Invisibilité'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Attaque rapide'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Rafale de tentacules'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Invocation des morts'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Tremblement de terre'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Cri strident'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Coup ailé'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Piétinement'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Mélodie enchantée'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Coup foudroyant'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Confusion'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Instabilité'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Morsure'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Coup féroce'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Glacé')
,	'Coup de corne'
,	15
,	22
,	12
,	4
,	'Devient fou et veut voir son ennemi ensanglanté. '
);

﻿/* COMPÉTENCES AZAZEL */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Rayon horrifiant')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Hurlement de terreur')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup mental')
);
/* FIN COMPÉTENCES AZAZEL */

/* COMPÉTENCES Moguarnoch*/
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Lancer de l\'épée')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Torture physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Tuerie')
);
/* FIN COMPÉTENCES Moguarnoch*/

/* COMPÉTENCES Zakuta*/
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Bouclier des éléments')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Guérison chamanistique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque des éléments')
);
/* FIN COMPÉTENCES Zakuta*/

/* COMPÉTENCES Ful'kitak */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque squelettique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Feu démoniaque')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Tempête de morts')
);
/* FIN COMPÉTENCES Ful'kitak */

/* COMPÉTENCES Harfanghei */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup de griffe')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Morsure endiablée')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Furie animale')
);
/* FIN COMPÉTENCES Harfanghei */

/* COMPÉTENCES ARKANOK */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup démoniaque')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Rituel de guérison')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup des dieux corrompus')
);
/* FIN COMPÉTENCES ARKANOK */

/* DÉBUT COMPÉTENCES ENNEMI A-H*/
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ange déchu')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ange déchu')
,	(SELECT idCompetence FROM Competences WHERE nom='Gardien')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Bandit')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Bandit')
,	(SELECT idCompetence FROM Competences WHERE nom='Empoisonnement')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Centaure')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Centaure')
,	(SELECT idCompetence FROM Competences WHERE nom='Tir rapide')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	(SELECT idCompetence FROM Competences WHERE nom='Souffle de feu')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Dragon')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup de griffe')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	(SELECT idCompetence FROM Competences WHERE nom='Tir gelé')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Elfe')
,	(SELECT idCompetence FROM Competences WHERE nom='Tir explosif')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Farfadet')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Farfadet')
,	(SELECT idCompetence FROM Competences WHERE nom='Mouvement agile')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Gorgone')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Gorgone')
,	(SELECT idCompetence FROM Competences WHERE nom='Pétrification')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Hydre')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Hydre')
,	(SELECT idCompetence FROM Competences WHERE nom='Régénération')
);
/* FIN COMPÉTENCES ENNEMI A-H*/

/* DÉBUT COMPÉTENCES ENNEMI I-P*/
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Iguane démoniaque')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Iguane démoniaque')
,	(SELECT idCompetence FROM Competences WHERE nom='Invisibilité')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Jaguar géant')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Jaguar géant')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque rapide')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Kraken')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Kraken')
,	(SELECT idCompetence FROM Competences WHERE nom='Rafale de tentacules')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Licorne')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);


INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Licorne')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup de corne')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Minotaure')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Minotaure')
,	(SELECT idCompetence FROM Competences WHERE nom='Furie animale')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Nécromancien')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Nécromancien')
,	(SELECT idCompetence FROM Competences WHERE nom='Invocation des morts')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ogre')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ogre')
,	(SELECT idCompetence FROM Competences WHERE nom='Tremblement de terre')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	(SELECT idCompetence FROM Competences WHERE nom='Cri strident')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ptérodactyle')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup ailé')
);
/* FIN COMPÉTENCES ENNEMI I-P*/

/* DÉBUT COMPÉTENCES ENNEMI Q-Z*/
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup de corne')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Rhinocéros sauvage')
,	(SELECT idCompetence FROM Competences WHERE nom='Piétinement')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Satyre')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Satyre')
,	(SELECT idCompetence FROM Competences WHERE nom='Mélodie enchantée')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Troll')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);


INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Troll')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup foudroyant')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	(SELECT idCompetence FROM Competences WHERE nom='Confusion')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ubuntu')
,	(SELECT idCompetence FROM Competences WHERE nom='Instabilité')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	(SELECT idCompetence FROM Competences WHERE nom='Morsure')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Vampire')
,	(SELECT idCompetence FROM Competences WHERE nom='Mouvement agile')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Worg')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Worg')
,	(SELECT idCompetence FROM Competences WHERE nom='Morsure endiablée')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Yéti')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Yéti')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup féroce')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	(SELECT idCompetence FROM Competences WHERE nom='Régénération')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zombie')
,	(SELECT idCompetence FROM Competences WHERE nom='Empoisonnement')
);
/* FIN COMPÉTENCES ENNEMI Q-Z*/


/* COMPÉTENCES Guerrier */
INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	(SELECT idCompetence FROM Competences WHERE nom='Peau d\'acier')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque précise')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,	(SELECT idCompetence FROM Competences WHERE nom='Vision de sang')
);

/* FIN COMPÉTENCES Guerrier */

/* COMPÉTENCES Paladin */
INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup divin')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	(SELECT idCompetence FROM Competences WHERE nom='Prière de guérison')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Paladin')
,	(SELECT idCompetence FROM Competences WHERE nom='Marteau des dieux')
);
/* FIN COMPÉTENCES Paladin */

/* COMPÉTENCESMagicien */
INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	(SELECT idCompetence FROM Competences WHERE nom='Boule de feu')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	(SELECT idCompetence FROM Competences WHERE nom='Armure arcanique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
	(SELECT idProfession FROM Professions WHERE nom='Magicien')
,	(SELECT idCompetence FROM Competences WHERE nom='Décharge électrique')
);
/* FIN COMPÉTENCESMagicien */