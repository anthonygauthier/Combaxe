INSERT INTO EquipementsModeles
(idModele, niveauEquipement, nom, prix, degatMin, degatMax)
VALUES
/*DÉBUT PRATIQUE*/
    ((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),1,'Épée de pratique',7.07,2,4),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),1,'Bâton de pratique',7.07,2,4),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),1,'Marteau de pratique',4.71,1,3),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),1,'Bouclier de pratique',4.71,0,0),
/* FIN PRATIQUE */

/*DÉBUT ROUILLÉ*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),3,'Épée rouillée',134.30,3,6),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),3,'Bâton rouillé',134.30,3,6),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),3,'Marteau rouillé',89.54,2,5),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),3,'Bouclier rouillé',89.54,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),3,'Dague rouillée',89.54,2,5),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),3,'Baguette rouillée',89.54,2,5),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),3,'Hache rouillée',134.30,3,6),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),3,'Lance rouillée',134.30,3,6),
/* FIN ROUILLÉ */

/*DÉBUT MAGIQUE*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),4,'Épée magique',311.02,4,8),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),4,'Bâton magique',311.02,4,8),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),4,'Marteau magique',207.35,2,6),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),4,'Bouclier magique',207.35,2,6),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),4,'Dague magique',207.35,2,6),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),4,'Baguette magique',207.35,2,6),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),4,'Hache magique',311.02,4,8),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),4,'Lance magique',311.02,4,8),
/* FIN MAGIQUE */

/*DÉBUT ÉLÉMENTAL*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),6,'Épée élémentale',1032.02,6,12),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),6,'Bâton élémental',1032.02,6,12),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),6,'Marteau élémental',688.01,3,9),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),6,'Bouclier élémental',688.01,3,9),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),6,'Dague élémentale',688.01,3,9),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),6,'Baguette élémentale',688.01,3,9),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),6,'Hache élémentale',1032.02,6,12),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),6,'Lance élémentale',1032.02,6,12),
/* FIN ÉLÉMENTAL */

/*DÉBUT BRONZE*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),7,'Épée de bronze',1632.84,7,14),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),7,'Bâton de bronze',1632.84,7,14),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),7,'Marteau de bronze',1088.56,4,11),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),7,'Bouclier de bronze',1088.56,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),7,'Dague de bronze',1088.56,4,11),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),7,'Baguette de bronze',1088.56,4,11),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),7,'Hache de bronze',1632.84,7,14),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),7,'Lance de bronze',1632.84,7,14),
/* FIN BRONZE */

/*DÉBUT FER*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),9,'Épée de fer',3456.54,9,18),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),9,'Bâton de fer',3456.54,9,18),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),9,'Marteau de fer',2304.36,5,14),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),9,'Bouclier de fer',2304.36,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),9,'Dague de fer',2304.36,5,14),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),9,'Baguette de fer',2304.36,5,14),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),9,'Hache de fer',3456.54,9,18),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),9,'Lance de fer',3456.54,9,18),
/* FIN FER */

/*DÉBUT ENCHANTÉ*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),10,'Épée enchantée',4735.96,10,20),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),10,'Bâton enchanté',4735.96,10,20),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),10,'Marteau enchanté',3157.30,5,15),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),10,'Bouclier enchanté',3157.30,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),10,'Dague enchantée',3157.30,5,15),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),10,'Baguette enchantée',3157.30,5,15),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),10,'Hache enchantée',4735.96,10,20),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),10,'Lance enchantée',4735.96,10,20),
/* FIN ENCHANTÉ */

/*DÉBUT MAUDIT*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),12,'Épée maudite',8171.30,12,24),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),12,'Bâton maudit',8171.30,12,24),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),12,'Marteau maudit',5447.53,6,18),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),12,'Bouclier maudit',5447.53,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),12,'Dague maudite',5447.53,6,18),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),12,'Baguette maudite',5447.53,6,18),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),12,'Hache maudite',8171.30,12,24),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),12,'Lance maudite',8171.30,12,24),
/* FIN MAUDIT */

/*DÉBUT SACRÉ*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),13,'Épée sacrée',10383.77,13,26),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),13,'Bâton sacré',10383.77,13,26),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),13,'Marteau sacré',6922.52,7,20),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),13,'Bouclier sacré',6922.52,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),13,'Dague sacrée',6922.52,7,20),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),13,'Baguette sacrée',6922.52,7,20),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),13,'Hache sacrée',10383.77,13,26),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),13,'Lance sacrée',10383.77,13,26),
/* FIN SACRÉ */

/*DÉBUT CRYSTAL*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),15,'Épée de crystal',15939.69,15,30),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),15,'Bâton de crystal',15939.69,15,30),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),15,'Marteau de crystal',10626.46,8,23),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),15,'Bouclier de crystal',10626.46,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),15,'Dague de crystal',10626.46,8,23),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),15,'Baguette de crystal',10626.46,8,23),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),15,'Hache de crystal',15939.69,15,30),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),15,'Lance de crystal',15939.69,15,30),
/* FIN CRYSTAL*/

/*DÉBUT HÉROÏQUE*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),16,'Épée héroïque',19339.70,16,32),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),16,'Bâton héroïque',19339.70,16,32),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),16,'Marteau héroïque',12893.13,8,24),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),16,'Bouclier héroïque',12893.13,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),16,'Dague héroïque',12893.13,8,24),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),16,'Baguette héroïque',12893.13,8,24),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),16,'Hache héroïque',19339.70,16,32),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),16,'Lance héroïque',19339.70,16,32),
/* FIN HÉROÏQUE */

/*DÉBUT LÉGENDAIRE*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),18,'Épée légendaire',23192.08,17,34),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),18,'Bâton légendaire',23192.08,17,34),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),18,'Marteau légendaire',15461.38,9,26),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),18,'Bouclier légendaire',15461.38,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),18,'Dague légendaire',15461.38,9,26),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),18,'Baguette légendaire',15461.38,9,26),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),18,'Hache légendaire',23192.08,17,34),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),18,'Lance légendaire',23192.08,17,34),
/* FIN LÉGENDAIRE */

/*DÉBUT DIAMANT*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),19,'Épée de diamant',32367.12,19,38),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),19,'Bâton de diamant',32367.12,19,38),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),19,'Marteau de diamant',21578.08,10,29),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),19,'Bouclier de diamant',21578.08,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),19,'Dague de diamant',21578.08,10,29),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),19,'Baguette de diamant',21578.08,10,29),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),19,'Hache de diamant',32367.12,19,38),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),19,'Lance de diamant',32367.12,19,38),
/* FIN DIAMAND */

/*DÉBUT CÉLESTE*/
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),20,'Épée céleste',37746.32,20,40),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),20,'Bâton céleste',37746.32,20,40),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),20,'Marteau céleste',25164.22,10,30),
	((SELECT idModele FROM Modeles WHERE nom='Bouclier'),20,'Bouclier céleste',25164.22,0,0),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),20,'Dague céleste',25164.22,10,30),
	((SELECT idModele FROM Modeles WHERE nom='Arme à une main'),20,'Baguette céleste',25164.22,10,30),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),20,'Hache céleste',37746.32,20,40),
	((SELECT idModele FROM Modeles WHERE nom='Arme à deux mains'),20,'Lance céleste',37746.32,20,40);
/* FIN CÉLESTE */