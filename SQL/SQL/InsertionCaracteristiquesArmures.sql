/* DÉBUT CUIR/TISSU */
INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir'),2),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de cuir'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu'),2),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir'),2),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir'),2),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de cuir'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu'),2),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu'),2),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de cuir'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de cuir'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de cuir'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers'),1),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers'),0),
/* FIN CUIR/TISSU */

/* DÉBUT ROUILLÉ */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron rouillé'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de tissu renforcé'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon rouillé'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de tissu renforcé'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes rouillées'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes rouillées'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes rouillées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes rouillées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes rouillées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu renforcé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu renforcé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu renforcé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu renforcé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de tissu renforcé'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque rouillé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque rouillé'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque rouillé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque rouillé'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque rouillé'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne rouillée'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne rouillée'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne rouillée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne rouillée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne rouillée'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes rouillées'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes rouillées'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes rouillées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes rouillées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes rouillées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers rouillés'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers rouillés'),3),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers rouillés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers rouillés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers rouillés'),0),
/* FIN ROUILLÉ */

/* DÉBUT MAGIQUE */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique'),8),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron magique'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique'),8),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe magique'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique'),8),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique'),8),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon magique'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques'),8),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques'),8),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings magiques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes magiques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières magiques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque magique'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque magique'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque magique'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque magique'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque magique'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne magique'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne magique'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne magique'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne magique'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne magique'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes magiques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers magiques'),4),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers magiques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers magiques'),0);
/* FIN MAGIQUE */

/* DÉBUT MAILLE */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de maille'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de maille'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de maille'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de maille'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de maille'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de maille'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de maille'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de maille'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de maille'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de maille'),6),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de maille'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de maille'),0);
/* FIN MAILLE */

/* DÉBUT BRONZE */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de bronze'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de bronze'),14),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de bronze'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de bronze'),14),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de bronze'),14),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de bronze'),14),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de bronze'),14),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de bronze'),14),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de bronze'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de bronze'),7),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de bronze'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de bronze'),0);
/* FIN BRONZE */

/* DÉBUT FER */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de fer'),27),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de fer'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de fer'),27),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de fer'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de fer'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de fer'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de fer'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de fer'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de fer'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de fer'),9),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de fer'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de fer'),0);
/* FIN FER */

/* DÉBUT ENCHANTÉ */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron enchanté'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron enchanté'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron enchanté'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron enchanté'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron enchanté'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe enchantée'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe enchantée'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe enchantée'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe enchantée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe enchantée'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon enchanté'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon enchanté'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon enchanté'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon enchanté'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon enchanté'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings enchantés'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings enchantés'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings enchantés'),21),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings enchantés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings enchantés'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes enchantées'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes enchantées'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes enchantées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes enchantées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes enchantées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières enchantées'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières enchantées'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières enchantées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières enchantées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières enchantées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque enchanté'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque enchanté'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque enchanté'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque enchanté'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque enchanté'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne enchantée'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne enchantée'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne enchantée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne enchantée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne enchantée'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes enchantées'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes enchantées'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes enchantées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes enchantées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes enchantées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers enchantés'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers enchantés'),10),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers enchantés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers enchantés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers enchantés'),0);
/* FIN ENCHANTÉ */

/* DÉBUT MAUDIT */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron maudit'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron maudit'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron maudit'),24),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron maudit'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron maudit'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe maudite'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe maudite'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe maudite'),24),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe maudite'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe maudite'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon maudit'),24),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon maudit'),24),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon maudit'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon maudit'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon maudit'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings maudits'),24),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings maudits'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings maudits'),24),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings maudits'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings maudits'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes maudites'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes maudites'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes maudites'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes maudites'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes maudites'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières maudites'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières maudites'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières maudites'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières maudites'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières maudites'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque maudit'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque maudit'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque maudit'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque maudit'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque maudit'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne maudite'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne maudite'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne maudite'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne maudite'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne maudite'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes maudites'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes maudites'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes maudites'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes maudites'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes maudites'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers maudits'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers maudits'),12),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers maudits'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers maudits'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers maudits'),0);
/* FIN MAUDIT */

/* DÉBUT SACRÉ */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron sacré'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron sacré'),39),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron sacré'),26),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron sacré'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron sacré'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe sacrée'),39),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe sacrée'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe sacrée'),26),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe sacrée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe sacrée'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon sacré'),26),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon sacré'),26),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon sacré'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon sacré'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon sacré'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings sacrés'),26),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings sacrés'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings sacrés'),26),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings sacrés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings sacrés'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes sacrées'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes sacrées'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes sacrées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes sacrées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes sacrées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières sacrées'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières sacrées'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières sacrées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières sacrées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières sacrées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque sacré'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque sacré'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque sacré'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque sacré'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque sacré'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne sacrée'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne sacrée'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne sacrée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne sacrée'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne sacrée'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes sacrées'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes sacrées'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes sacrées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes sacrées'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes sacrées'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers sacrés'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers sacrés'),13),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers sacrés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers sacrés'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers sacrés'),0);
/* FIN SACRÉ */

/* DÉBUT OR */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron en or'),45),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron en or'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe en or'),45),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe en or'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon en or'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon en or'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings en or'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings en or'),30),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes en or'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers en or'),15),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers en or'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers en or'),0);
/* FIN OR */

/* DÉBUT HÉROÏQUE */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron héroïque'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron héroïque'),48),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron héroïque'),32),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron héroïque'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron héroïque'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe héroïque'),48),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe héroïque'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe héroïque'),32),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe héroïque'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe héroïque'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon héroïque'),32),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon héroïque'),32),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon héroïque'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon héroïque'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon héroïque'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings héroïques'),32),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings héroïques'),32),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings héroïques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes héroïques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières héroïques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque héroïque'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque héroïque'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque héroïque'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque héroïque'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque héroïque'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne héroïque'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne héroïque'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne héroïque'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne héroïque'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne héroïque'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes héroïques'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers héroïques'),16),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers héroïques'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers héroïques'),0);
/* FIN HÉROÏQUE */

/* DÉBUT LÉGENDAIRE */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron légendaire'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron légendaire'),54),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron légendaire'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron légendaire'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron légendaire'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe légendaire'),54),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe légendaire'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe légendaire'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe légendaire'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe légendaire'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon légendaire'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon légendaire'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon légendaire'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon légendaire'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon légendaire'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings légendaires'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings légendaires'),36),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings légendaires'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes légendaires'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières légendaires'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque légendaire'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque légendaire'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque légendaire'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque légendaire'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque légendaire'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne légendaire'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne légendaire'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne légendaire'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne légendaire'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne légendaire'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes légendaires'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers légendaires'),18),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers légendaires'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers légendaires'),0);
/* FIN LÉGENDAIRE */

/* DÉBUT DIAMANT */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de diamant'),57),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de diamant'),38),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de diamant'),57),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de diamant'),38),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de diamant'),38),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de diamant'),38),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de diamant'),38),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de diamant'),38),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes de diamant'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de diamant'),19),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de diamant'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers de diamant'),0);
/* FIN DIAMANT */

/* DÉBUT CÉLESTE */
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron céleste'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron céleste'),60),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron céleste'),40),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron céleste'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Plastron céleste'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe céleste'),60),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe céleste'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe céleste'),40),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe céleste'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Robe céleste'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon céleste'),40),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon céleste'),40),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon céleste'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon céleste'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Pantalon céleste'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings célestes'),40),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings célestes'),40),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Leggings célestes'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulettes célestes'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épaulières célestes'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque céleste'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque céleste'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque céleste'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque céleste'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Casque céleste'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne céleste'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne céleste'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne céleste'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne céleste'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Couronne céleste'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bottes célestes'),0),

((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers célestes'),20),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers célestes'),0),
((SELECT idCaracteristique FROM Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Souliers célestes'),0);
/* FIN CÉLESTE */