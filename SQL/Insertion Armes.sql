/*DÉBUT PRATIQUE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de pratique'
	,	7.07
	,	2
	,	4
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de pratique'
	,	7.07
	,	2
	,	4
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de pratique'
	,	4.71
	,	1
	,	3
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de pratique'
	,	4.71
	,	0
	,	0
	);
/* FIN PRATIQUE */

/*DÉBUT ROUILLÉ*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée rouillée'
	,	134.30
	,	3
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton rouillé'
	,	134.30
	,	3
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau rouillé'
	,	89.54
	,	2
	,	5
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier rouillé'
	,	89.54
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague rouillée'
	,	89.54
	,	2
	,	5
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette rouillée'
	,	89.54
	,	2
	,	5
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache rouillée'
	,	134.30
	,	3
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance rouillée'
	,	134.30
	,	3
	,	6
	);
/* FIN ROUILLÉ */

/*DÉBUT MAGQIQUE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée magique'
	,	311.02
	,	4
	,	8
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton magique'
	,	311.02
	,	4
	,	8
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau magique'
	,	207.35
	,	2
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier magique'
	,	207.35
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague magique'
	,	207.35
	,	2
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette magique'
	,	207.35
	,	2
	,	6
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache magique'
	,	311.02
	,	4
	,	8
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance magique'
	,	311.02
	,	4
	,	8
	);
/* FIN MAGIQUE */

/*DÉBUT BRONZE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de bronze'
	,	1032.02
	,	6
	,	12
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de bronze'
	,	1032.02
	,	6
	,	12
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de bronze'
	,	688.01
	,	3
	,	9
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de bronze'
	,	688.01
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague de bronze'
	,	688.01
	,	3
	,	9
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette de bronze'
	,	688.01
	,	3
	,	9
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache de bronze'
	,	1032.02
	,	6
	,	12
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance de bronze'
	,	1032.02
	,	6
	,	12
	);
/* FIN BRONZE */

/*DÉBUT FER*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de fer'
	,	1632.84
	,	7
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de fer'
	,	1632.84
	,	7
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de fer'
	,	1088.56
	,	4
	,	11
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de fer'
	,	1088.56
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague de fer'
	,	1088.56
	,	4
	,	11
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette de fer'
	,	1088.56
	,	4
	,	11
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache de fer'
	,	1632.84
	,	7
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance de fer'
	,	1632.84
	,	7
	,	14
	);
/* FIN FER */

/*DÉBUT ENCHANTÉ*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée enchantée'
	,	3456.54
	,	9
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton enchanté'
	,	3456.54
	,	9
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau enchanté'
	,	2304.36
	,	5
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier enchanté'
	,	2304.36
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague enchantée'
	,	2304.36
	,	5
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette enchantée'
	,	2304.36
	,	5
	,	14
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache enchantée'
	,	3456.54
	,	9
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance enchantée'
	,	3456.54
	,	9
	,	18
	);
/* FIN ENCHANTÉ */

/*DÉBUT ÉLÉMENTAL*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée élémentale'
	,	4735.96
	,	10
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton élémental'
	,	4735.96
	,	10
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau élémental'
	,	3157.30
	,	5
	,	15
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier élémental'
	,	3157.30
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague élémentale'
	,	3157.30
	,	5
	,	15
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette élémentale'
	,	3157.30
	,	5
	,	15
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache élémentale'
	,	4735.96
	,	10
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance élémentale'
	,	4735.96
	,	10
	,	20
	);
/* FIN ÉLÉMENTAL */

/*DÉBUT MAUDIT*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée maudite'
	,	8171.30
	,	12
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton maudit'
	,	8171.30
	,	12
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau maudit'
	,	5447.53
	,	6
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier maudit'
	,	5447.53
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague maudite'
	,	5447.53
	,	6
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette maudite'
	,	5447.53
	,	6
	,	18
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache maudite'
	,	8171.30
	,	12
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance maudite'
	,	8171.30
	,	12
	,	24
	);
/* FIN MAUDIT */

/*DÉBUT SACRÉ*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée sacrée'
	,	10383.77
	,	13
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton sacré'
	,	10383.77
	,	13
	,	16
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau sacré'
	,	6922.52
	,	7
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier sacré'
	,	6922.52
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague sacrée'
	,	6922.52
	,	7
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette sacrée'
	,	6922.52
	,	7
	,	20
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache sacrée'
	,	10383.77
	,	13
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance sacrée'
	,	10383.77
	,	13
	,	26
	);
/* FIN SACRÉ */

/*DÉBUT CRYSTAL*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée crystale'
	,	15939.69
	,	15
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton crystal'
	,	15939.69
	,	15
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau crystal'
	,	10626.46
	,	8
	,	23
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier crystal'
	,	10626.46
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague crystale'
	,	10626.46
	,	8
	,	23
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette crystale'
	,	10626.46
	,	8
	,	23
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache crystale'
	,	15939.69
	,	15
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance crystale'
	,	15939.69
	,	15
	,	30
	);
/* FIN CRYSTAL*/

/*DÉBUT HÉROÏQUE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée héroïque'
	,	19339.70
	,	16
	,	32
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton héroïque'
	,	19339.70
	,	16
	,	32
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau héroïque'
	,	12893.13
	,	8
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier héroïque'
	,	12893.13
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague héroïque'
	,	12893.13
	,	8
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette héroïque'
	,	12893.13
	,	8
	,	24
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache héroïque'
	,	19339.70
	,	16
	,	32
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance héroïque'
	,	19339.70
	,	16
	,	32
	);
/* FIN HÉROÏQUE */

/*DÉBUT LÉGENDAIRE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée légendaire'
	,	23192.08
	,	17
	,	34
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton légendaire'
	,	23192.08
	,	17
	,	34
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau légendaire'
	,	15461.38
	,	9
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier légendaire'
	,	15461.38
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague légendaire'
	,	15461.38
	,	9
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette légendaire'
	,	15461.38
	,	9
	,	26
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache légendaire'
	,	23192.08
	,	17
	,	34
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance légendaire'
	,	23192.08
	,	17
	,	34
	);
/* FIN LÉGENDAIRE */

/*DÉBUT DIAMANT*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée de diamant'
	,	32367.12
	,	19
	,	38
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton de diamant'
	,	32367.12
	,	19
	,	38
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau de diamant'
	,	21578.08
	,	10
	,	29
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier de diamant'
	,	21578.08
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague de diamant'
	,	21578.08
	,	10
	,	29
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette de diamant'
	,	21578.08
	,	10
	,	29
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache de diamant'
	,	32367.12
	,	19
	,	38
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance de diamant'
	,	32367.12
	,	19
	,	38
	);
/* FIN DIAMAND */

/*DÉBUT CÉLESTE*/
	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Épée céleste'
	,	37746.32
	,	20
	,	40
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Bâton céleste'
	,	37746.32
	,	20
	,	40
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Marteau céleste'
	,	25164.22
	,	10
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Bouclier')
	,	'Bouclier céleste'
	,	25164.22
	,	0
	,	0
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Dague céleste'
	,	25164.22
	,	10
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à une main')
	,	'Baguette céleste'
	,	25164.22
	,	10
	,	30
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Hache céleste'
	,	37746.32
	,	20
	,	40
	);

	INSERT INTO EquipementsModeles
	(idModele, nom, prix, degatMin, degatMax)
	VALUES
	(
		(SELECT idModele FROM Modeles WHERE nom='Arme à deux mains')
	,	'Lance céleste'
	,	37746.32
	,	20
	,	40
	);
/* FIN CÉLESTE */