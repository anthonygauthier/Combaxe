INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Épée de pratique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Épée de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Bâton de pratique')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Bâton de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Marteau de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Marteau de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Bouclier de pratique')
,	1
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Bouclier de pratique')
,	1
);


 /* FIN PRATIQUE */
 
INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Épée rouillée')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Épée rouillée')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Bâton rouillé')
,	6
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Bâton rouillé')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Marteau rouillé')
,	2
);

INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
(	
	(SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force')
,	(SELECT idEquipementModele FROM EquipementModeles WHERE nom='Marteau rouillé')
,	3
);


