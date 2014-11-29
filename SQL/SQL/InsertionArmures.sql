INSERT INTO EquipementsModeles
(idModele, niveauEquipement, nom, prix, image)
VALUES
/* DÉBUT CUIR/TISSU */
    ((SELECT idModele FROM Modeles WHERE nom='Plastron'),1,'Plastron de cuir',7.07,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),1,'Robe de tissu',7.07,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),1,'Pantalon de cuir',7.07,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),1,'Pantalon de tissu',7.07,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),1,'Épaulettes de cuir',4.71,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),1,'Épaulières de tissu',4.71,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),1,'Casque de cuir',4.71,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),1,'Couronne',4.71,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),1,'Bottes de cuir',4.71,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),1,'Souliers',4.71,'resources/images/objets/soulier.png'),
/* FIN CUIR/TISSU */

/* DÉBUT ROUILLÉ */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),3,'Plastron rouillé',134.30,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),3,'Robe de tissu renforcé',134.30,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),3,'Pantalon rouillé',134.30,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),3,'Pantalon de tissu renforcé',134.30,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),3,'Épaulettes rouillées',89.54,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),3,'Épaulières de tissu renforcé',89.54,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),3,'Casque rouillé',89.54,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),3,'Couronne rouillée',89.54,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),3,'Bottes rouillées',89.54,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),3,'Souliers rouillés',89.54,'resources/images/objets/soulier.png'),
/* FIN ROUILLÉ */

/* DÉBUT MAGIQUE */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),4,'Plastron magique',311.02,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),4,'Robe magique',311.02,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),4,'Pantalon magique',311.02,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),4,'Leggings magiques',311.02,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),4,'Épaulettes magiques',207.35,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),4,'Épaulières magiques',207.35,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),4,'Casque magique',207.35,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),4,'Couronne magique',207.35,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),4,'Bottes magiques',207.35,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),4,'Souliers magiques',207.35,'resources/images/objets/soulier.png'),
/* FIN MAGIQUE */

/* DÉBUT MAILLE */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),6,'Plastron de maille',1032.02,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),6,'Robe de maille',1032.02,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),6,'Pantalon de maille',1032.02,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),6,'Leggings de maille',1032.02,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),6,'Épaulettes de maille',688.01,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),6,'Épaulières de maille',688.01,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),6,'Casque de maille',688.01,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),6,'Couronne de maille',688.01,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),6,'Bottes de maille',688.01,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),6,'Souliers de maille',688.01,'resources/images/objets/soulier.png'),
/* FIN MAILLE */

/* DÉBUT BRONZE */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),7,'Plastron de bronze',1632.84,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),7,'Robe de bronze',1632.84,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),7,'Pantalon de bronze',1632.84,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),7,'Leggings de bronze',1632.84,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),7,'Épaulettes de bronze',1088.56,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),7,'Épaulières de bronze',1088.56,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),7,'Casque de bronze',1088.56,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),7,'Couronne de bronze',1088.56,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),7,'Bottes de bronze',1088.56,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),7,'Souliers de bronze',1088.56,'resources/images/objets/soulier.png'),
/* FIN BRONZE */

/* DÉBUT FER */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),9,'Plastron de fer',3456.54,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),9,'Robe de fer',3456.54,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),9,'Pantalon de fer',3456.54,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),9,'Leggings de fer',3456.54,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),9,'Épaulettes de fer',2304.36,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),9,'Épaulières de fer',2304.36,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),9,'Casque de fer',2304.36,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),9,'Couronne de fer',2304.36,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),9,'Bottes de fer',2304.36,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),9,'Souliers de fer',2304.36,'resources/images/objets/soulier.png'),
/* FIN FER */

/* DÉBUT ENCHANTÉ */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),10,'Plastron enchanté',4735.96,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),10,'Robe enchantée',4735.96,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),10,'Pantalon enchanté',4735.96,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),10,'Leggings enchantés',4735.96,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),10,'Épaulettes enchantées',3157.30,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),10,'Épaulières enchantées',3157.30,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),10,'Casque enchanté',3157.30,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),10,'Couronne enchantée',3157.30,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),10,'Bottes enchantées',3157.30,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),10,'Souliers enchantés',3157.30,'resources/images/objets/soulier.png'),
/* FIN ENCHANTÉ */

/* DÉBUT MAUDIT */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),12,'Plastron maudit',8171.30,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),12,'Robe maudite',8171.30,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),12,'Pantalon maudit',8171.30,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),12,'Leggings maudits',8171.30,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),12,'Épaulettes maudites',5447.53,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),12,'Épaulières maudites',5447.53,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),12,'Casque maudit',5447.53,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),12,'Couronne maudite',5447.53,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),12,'Bottes maudites',5447.53,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),12,'Souliers maudites',5447.53,'resources/images/objets/soulier.png'),
/* FIN MAUDIT */

/* DÉBUT SACRÉ */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),13,'Plastron sacré',10383.77,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),13,'Robe sacrée',10383.77,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),13,'Pantalon sacré',10383.77,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),13,'Leggings sacrés',10383.77,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),13,'Épaulettes sacrées',6922.52,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),13,'Épaulières sacrées',6922.52,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),13,'Casque sacré',6922.52,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),13,'Couronne sacrée',6922.52,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),13,'Bottes sacrées',6922.52,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),13,'Souliers sacrés',6922.52,'resources/images/objets/soulier.png'),
/* FIN SACRÉ */

/* DÉBUT OR */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),15,'Plastron en or',15939.69,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),15,'Robe en or',15939.69,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),15,'Pantalon en or',15939.69,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),15,'Leggings en or',15939.69,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),15,'Épaulettes en or',10626.46,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),15,'Épaulières en or',10626.46,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),15,'Casque en or',10626.46,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),15,'Couronne en or',10626.46,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),15,'Bottes en or',10626.46,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),15,'Souliers en or',10626.46,'resources/images/objets/soulier.png'),
/* FIN OR */

/* DÉBUT HÉROÏQUE */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),16,'Plastron héroïque',19339.70,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),16,'Robe héroïque',19339.70,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),16,'Pantalon héroïque',19339.70,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),16,'Leggings héroïques',19339.70,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),16,'Épaulettes héroïques',12893.13,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),16,'Épaulières héroïques',12893.13,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),16,'Casque héroïque',12893.13,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),16,'Couronne héroïque',12893.13,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),16,'Bottes héroïques',12893.13,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),16,'Souliers héroïques',12893.13,'resources/images/objets/soulier.png'),
/* FIN HÉROÏQUE */

/* DÉBUT LÉGENDAIRE */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),18,'Plastron légendaire',23192.08,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),18,'Robe légendaire',23192.08,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),18,'Pantalon légendaire',23192.08,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),18,'Leggings légendaires',23192.08,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),18,'Épaulettes légendaires',15461.38,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),18,'Épaulières légendaires',15461.38,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),18,'Casque légendaire',15461.38,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),18,'Couronne légendaire',15461.38,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),18,'Bottes légendaires',15461.38,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),18,'Souliers légendaires',15461.38,'resources/images/objets/soulier.png'),
/* FIN LÉGENDAIRE */

/* DÉBUT DIAMANT */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),19,'Plastron de diamant',32367.12,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),19,'Robe de diamant',32367.12,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),19,'Pantalon de diamant',32367.12,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),19,'Leggings de diamant',32367.12,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),19,'Épaulettes de diamant',21578.08,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),19,'Épaulières de diamant',21578.08,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),19,'Casque de diamant',21578.08,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),19,'Couronne de diamant',21578.08,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),19,'Bottes de diamant',21578.08,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),19,'Souliers de diamant',21578.08,'resources/images/objets/soulier.png'),
/* FIN DIAMANT */

/* DÉBUT CÉLESTE */
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),20,'Plastron céleste',37746.32,'resources/images/objets/plate.png'),
	((SELECT idModele FROM Modeles WHERE nom='Plastron'),20,'Robe céleste',37746.32,'resources/images/objets/robe.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),20,'Pantalon céleste',37746.32,'resources/images/objets/pants.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Pantalon'),20,'Leggings célestes',37746.32,'resources/images/objets/legging.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),20,'Épaulettes célestes',25164.22,'resources/images/objets/epaulette.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Épaulette'),20,'Épaulières célestes',25164.22,'resources/images/objets/epauletteCuir.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),20,'Casque céleste',25164.22,'resources/images/objets/casque.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Casque'),20,'Couronne céleste',25164.22,'resources/images/objets/couronne.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),20,'Bottes célestes',25164.22,'resources/images/objets/bottes.png'),
    ((SELECT idModele FROM Modeles WHERE nom='Bottes'),20,'Souliers célestes',25164.22,'resources/images/objets/soulier.png');
/* FIN CÉLESTE */