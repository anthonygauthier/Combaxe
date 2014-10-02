INSERT INTO Competences
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
	(SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensif')
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
,	CONCAT('Attaque l\'ennemi avec le feu brulant des enfers. ',(SELECT description FROM Effets WHERE nom='Brulure'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Brulure') ,' tour.')
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
,	Concat('Coup de griffe sauvage . ',(SELECT description FROM Effets WHERE nom='Saignement'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Saignement') ,' tour.')
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
,	'Attaque l\'ennemi avec le feu brulant des enfers. '
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
,	'Attaque l\'ennemi avec le feu brulant des enfers. '
);