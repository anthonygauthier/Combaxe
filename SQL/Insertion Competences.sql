INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Attaque physique'
,	2
,	5
,	0
,	1
,	0
,	'Attaque simple effectué avec les pièces d\'équipements portées. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Rayon horrifiant'
,	7
,	12
,	5
,	3
,	0
,	'Rayon rouge qui fait trembler l\'ennemi de peur. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	(SELECT idEffet FROM Effets WHERE nom='Peur')
,	'Hurlement de terreur'
,	10
,	18
,	14
,	4
,	2
,	CONCAT('Hurlement qui fige l\'ennemi de peur. ',(SELECT description FROM Effets WHERE nom='Peur'),' pendant 2 tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,	NULL
,	'Coup mental'
,	20
,	29
,	27
,	5
,	0
,	'Sort magique qui trouble votre esprit et vous affaiblit. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Lancer de l\'épée'
,	8
,	12
,	6
,	2
,	0
,	'Lance une épée qui afflige de lourd dégât à l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	(SELECT idEffet FROM Effets WHERE nom='Saignement')
,	'Torture physique'
,	17
,	21
,	10
,	4
,	2
,	CONCAT('Torture l\'ennemi avec un couteau. ',(SELECT description FROM Effets WHERE nom='Saignement'),' pendant 2 tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Tuerie'
,	20
,	30
,	19
,	5
,	0
,	'Devient en furie et détruit tout sur son passage. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensif')
,	NULL
,	'Bouclier des éléments'
,	30
,	35
,	14
,	3
,	0
,	'Absorbe les dégâts reçut dans ce bouclier résistant. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,	NULL
,	'Guérison chamanistique'
,	45
,	49
,	20
,	4
,	0
,	'Il se guérit avec les pouvoirs chamanique. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, tempsEffets, description)
VALUES
(
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,	NULL
,	'Attaque des éléments'
,	24
,	30
,	18
,	3
,	0
,	'Invoque la puissance de la nature puis la déchaine contre l\'ennemi. '
);