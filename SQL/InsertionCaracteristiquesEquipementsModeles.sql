INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
<<<<<<< HEAD
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir')
,	1
);
=======
(		(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
	,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Épée de pratique')
	,	7.07
	,	2
	,	4
	);
>>>>>>> origin/master
