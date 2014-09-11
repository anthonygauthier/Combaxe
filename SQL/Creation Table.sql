DROP TABLE IF EXISTS CompetencesClasses;
DROP TABLE IF EXISTS CompetencesEnnemis;
DROP TABLE IF EXISTS Competences;
DROP TABLE IF EXISTS EquipementsPersonnages;
DROP TABLE IF EXISTS InventairesEquipements;
DROP TABLE IF EXISTS Equipements;
DROP TABLE IF EXISTS AttributsPersonnages;
DROP TABLE IF EXISTS AttributsEquipementsModeles;
DROP TABLE IF EXISTS AttributsEnnemis;
DROP TABLE IF EXISTS Personnages;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Statistiques;
DROP TABLE IF EXISTS Attributs;
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
,	nom VARCHAR(21) NOT NULL
);

CREATE TABLE IF NOT EXISTS Ennemis
(
	idEnnemi INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idInventaire INT
,	nom VARCHAR(31) NOT NULL UNIQUE
,	niveau INT NOT NULL DEFAULT 1
,	image VARCHAR(255)
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
);

CREATE TABLE IF NOT EXISTS Attributs
(
	idAttribut INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(31) NOT NULL UNIQUE
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

CREATE TABLE IF NOT EXISTS Classes
(
	idClasse INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(21)
,	image VARCHAR(255)
,	description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Personnages
(
	idPersonnage INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idClasse INT NOT NULL
,	idInventaire INT NOT NULL
,	idJoueur INT NOT NULL
,	idStatistique INT NOT NULL
,	nom VARCHAR(21) NOT NULL UNIQUE
,	niveau INT NOT NULL DEFAULT 1
,	experience INT NOT NULL DEFAULT 0
,	image VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS AttributsEnnemis
(
	idAttributEnnemi INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idAttribut INT NOT NULL
,	idEnnemi INT NOT NULL
);

CREATE TABLE IF NOT EXISTS AttributsEquipementsModeles
(
	idAttributEquipementModele INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idAttribut INT NOT NULL
,	idEquipementModele INT NOT NULL
);

CREATE TABLE IF NOT EXISTS AttributsPersonnages
(
	idAttributPersonnage INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idAttribut INT NOT NULL
,	idPersonnage INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Equipements
(
	idEquipement INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idEquipementModele INT NOT NULL
,	prix DOUBLE NOT NULL DEFAULT 0
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

CREATE TABLE IF NOT EXISTS Competences
(
	idCompetence INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	nom VARCHAR(21) NOT NULL UNIQUE
,	degatMin INT NOT NULL DEFAULT 0
,	degatMax INT NOT NULL DEFAULT 0
,	energieUtilise INT NOT NULL DEFAULT 0
,	tempsRecharge INT NOT NULL DEFAULT 0
,	tempsEffect TIME NOT NULL DEFAULT 0
,	description VARCHAR(255)
,	image VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CompetencesEnnemis
(
	idCompetenceEnnemi INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idCompetence INT NOT NULL
,	idEnnemis INT NOT NULL
);

CREATE TABLE IF NOT EXISTS CompetencesClasses
(
	idCompetenceClasse INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL
,	idCompetence INT NOT NULL
,	idClasse INT NOT NULL
);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Classes_FK
FOREIGN KEY (idClasse) REFERENCES Classes(idClasse);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Inventaires_FK
FOREIGN KEY (idInventaire) REFERENCES Inventaires(idInventaire);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Joueurs_FK
FOREIGN KEY (idJoueur) REFERENCES Joueurs(idJoueur);

ALTER TABLE Personnages
ADD CONSTRAINT Personnages_Statistique_FK
FOREIGN KEY (idStatistique) REFERENCES Statistiques(idStatistique);

ALTER TABLE CompetencesClasses
ADD CONSTRAINT CompetencesClasses_Competences_FK
FOREIGN KEY (idCompetence) REFERENCES Competences(idCompetence);

ALTER TABLE CompetencesClasses
ADD CONSTRAINT CompetencesClasses_Classes_FK
FOREIGN KEY (idClasse) REFERENCES Classes(idClasse);

ALTER TABLE CompetencesEnnemis
ADD CONSTRAINT CompetencesEnnemis_Competences_FK
FOREIGN KEY (idCompetence) REFERENCES Competences(idCompetence);

ALTER TABLE CompetencesEnnemis
ADD CONSTRAINT CompetencesEnnemis_Ennemis_FK
FOREIGN KEY (idEnnemi) REFERENCES Ennemis(idEnnemi);

ALTER TABLE Ennemis
ADD CONSTRAINT Ennemis_Inventaires_FK
FOREIGN KEY (idInventaire) REFERENCES Inventaires(idInventaire);

ALTER TABLE AttributsEnnemis
ADD CONSTRAINT AttributsEnnemis_Ennemis_FK
FOREIGN KEY (idEnnemi) REFERENCES Ennemis(idEnnemi);

ALTER TABLE AttributsEnnemis
ADD CONSTRAINT AttributsEnnemis_Attributs_FK
FOREIGN KEY (idAttribut) REFERENCES Attributs(idAttribut);

ALTER TABLE AttributsPersonnages
ADD CONSTRAINT AttributsPersonnages_Personnages_FK
FOREIGN KEY (idPersonnage) REFERENCES Personnages(idPersonnage);

ALTER TABLE AttributsPersonnages
ADD CONSTRAINT AttributsPersonnages_Attributs_FK
FOREIGN KEY (idAttribut) REFERENCES Attributs(idAttribut);

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