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
,   vie INT NOT NULL DEFAULT 0
,   energie INT NOT NULL DEFAULT 0
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

