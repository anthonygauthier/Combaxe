
/* COMPÉTENCES Guerrier */
INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Guerrier')
,(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Guerrier')
,(SELECT idCompetence FROM Competences WHERE nom='Peau d\'acier')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Guerrier')
,(SELECT idCompetence FROM Competences WHERE nom='Attaque précise')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Guerrier')
,(SELECT idCompetence FROM Competences WHERE nom='Vision de sang')
);

/* FIN COMPÉTENCES Guerrier */

/* COMPÉTENCES Paladin */
INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Paladin')
,(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Paladin')
,(SELECT idCompetence FROM Competences WHERE nom='Coup divin')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Paladin')
,(SELECT idCompetence FROM Competences WHERE nom='Prière de guérison')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Paladin')
,(SELECT idCompetence FROM Competences WHERE nom='Marteau des dieux')
);
/* FIN COMPÉTENCES Paladin */

/* COMPÉTENCESMagicien */
INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Magicien')
,(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Magicien')
,(SELECT idCompetence FROM Competences WHERE nom='Boule de feu')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Magicien')
,(SELECT idCompetence FROM Competences WHERE nom='Armure arcanique')
);

INSERT INTO CompetencesProfessions
(idProfession, idCompetence)
VALUES
(
    (SELECT idProfession FROM Professions WHERE nom='Magicien')
,(SELECT idCompetence FROM Competences WHERE nom='Décharge électrique')
);
/* FIN COMPÉTENCESMagicien */

