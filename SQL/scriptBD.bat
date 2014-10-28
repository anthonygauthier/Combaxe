@echo off
type .\SQL\CreationTable.sql >> CreationBD.sql;
type .\SQL\InsertionEnnemis.sql >> CreationBD.sql;
type .\SQL\InsertionModeles.sql >> CreationBD.sql;
type .\SQL\InsertionCaracteristique.sql >> CreationBD.sql;
type .\SQL\InsertionProfessions.sql >> CreationBD.sql;
type .\SQL\InsertionCaracteristiquesProfessions.sql >> CreationBD.sql;
type .\SQL\InsertionCaracteristiquesEnnemis.sql >> CreationBD.sql;
type .\SQL\InsertionArmes.sql >> CreationBD.sql;
type .\SQL\InsertionArmures.sql >> CreationBD.sql;
type .\SQL\InsertionCaracteristiquesArmures.sql >> CreationBD.sql;
type .\SQL\InsertionCaracteristiquesArmes.sql >> CreationBD.sql;
type .\SQL\InsertionsEffets.sql >> CreationBD.sql;
type .\SQL\InsertiontypesCompetences.sql >> CreationBD.sql;
type .\SQL\InsertionCompetences.sql >> CreationBD.sql;
type .\SQL\InsertionCompetencesEnnemis.sql >> CreationBD.sql;
type .\SQL\InsertionCompetencesProfessions.sql >> CreationBD.sql;

echo Fichier de création de BD créer.
PAUSE;
