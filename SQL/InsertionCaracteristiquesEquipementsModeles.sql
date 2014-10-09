INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(
	(SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir')
,	1
);