
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Bâton rouillé')
,	2
>>>>>>> origin/master
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
<<<<<<< HEAD
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='DÃ©fense')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir')
,	1
=======
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Marteau rouillé')
,	2
>>>>>>> origin/master
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
<<<<<<< HEAD
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Ã‰nergie')
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
=======
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Marteau rouillé')
,	3
);


>>>>>>> origin/master
