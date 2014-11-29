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