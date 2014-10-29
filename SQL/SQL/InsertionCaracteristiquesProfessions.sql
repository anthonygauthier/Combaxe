/* DÉBUT CARACTERISTIQUE GUERRIER */
INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,8
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,3
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(

    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,(SELECT idProfession FROM Professions WHERE nom='Guerrier')
,2
);
/* FIN CARACTERISTIQUE GUERRIER */

/* DÉBUT CARACTERISTIQUE PALADIN */
INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,(SELECT idProfession FROM Professions WHERE nom='Paladin')
,6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,(SELECT idProfession FROM Professions WHERE nom='Paladin')
,6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,(SELECT idProfession FROM Professions WHERE nom='Paladin')
,6
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,(SELECT idProfession FROM Professions WHERE nom='Paladin')
,3
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(

    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,(SELECT idProfession FROM Professions WHERE nom='Paladin')
,4
);
/* FIN CARACTERISTIQUE PALADIN */

/* DÉBUT CARACTERISTIQUE MAGICIEN */
INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,(SELECT idProfession FROM Professions WHERE nom='Magicien')
,2
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense')
,(SELECT idProfession FROM Professions WHERE nom='Magicien')
,3
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie')
,(SELECT idProfession FROM Professions WHERE nom='Magicien')
,5
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(
    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,(SELECT idProfession FROM Professions WHERE nom='Magicien')
,7
);

INSERT INTO CaracteristiquesProfessions
(idCaracteristique, idProfession, valeur)
VALUES
(

    (SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie')
,(SELECT idProfession FROM Professions WHERE nom='Magicien')
,8
);
/* FIN CARACTERISTIQUE MAGICIEN */

