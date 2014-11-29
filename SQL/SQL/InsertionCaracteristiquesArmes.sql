INSERT INTO CaracteristiquesEquipementsModeles
(idCaracteristique, idEquipementModele, valeur)
VALUES
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de pratique'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de pratique'),1),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de pratique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de pratique'),1),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de pratique'),1),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de pratique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de pratique'),1),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de pratique'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de pratique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de pratique'),1),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de pratique'),1),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de pratique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de pratique'),0),
/* FIN PRATIQUE */

/* DÉBUT ROUILLÉ */
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée rouillée'),6),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée rouillée'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée rouillée'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton rouillé'),6),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton rouillé'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton rouillé'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton rouillé'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton rouillé'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau rouillé'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau rouillé'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau rouillé'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau rouillé'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau rouillé'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier rouillé'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier rouillé'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier rouillé'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier rouillé'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier rouillé'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague rouillée'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague rouillée'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague rouillée'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette rouillée'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette rouillée'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette rouillée'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache rouillée'),6),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache rouillée'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache rouillée'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance rouillée'),6),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance rouillée'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance rouillée'),3),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance rouillée'),0),
/* FIN ROUILLÉ */

/* DÉBUT MAGIQUE */
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée magique'),8),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée magique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton magique'),8),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton magique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau magique'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau magique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier magique'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier magique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague magique'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague magique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette magique'),2),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette magique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache magique'),8),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache magique'),0),

((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance magique'),4),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance magique'),8),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance magique'),0),
((SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance magique'),0),
/* FIN MAGIQUE */

/* DÉBUT ÉLÉMENTALE */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée élémentale'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée élémentale'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée élémentale'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton élémental'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton élémental'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton élémental'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton élémental'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton élémental'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau élémental'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau élémental'), 3),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau élémental'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau élémental'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau élémental'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier élémental'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier élémental'), 3),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier élémental'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier élémental'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier élémental'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague élémentale'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague élémentale'), 3),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague élémentale'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette élémentale'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette élémentale'), 3),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette élémentale'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache élémentale'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache élémentale'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache élémentale'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance élémentale'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance élémentale'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance élémentale'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance élémentale'), 0),
/* FIN ÉLÉMENTALE */

/* DÉBUT DE BRONZE */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de bronze'), 14),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de bronze'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de bronze'), 14),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de bronze'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de bronze'), 4),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de bronze'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de bronze'), 4),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de bronze'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de bronze'), 4),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de bronze'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de bronze'), 4),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de bronze'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de bronze'), 14),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de bronze'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de bronze'), 14),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de bronze'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de bronze'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de bronze'), 0),
/* FIN DE BRONZE */

/* DÉBUT DE FER */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de fer'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de fer'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de fer'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de fer'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de fer'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de fer'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de fer'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de fer'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de fer'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de fer'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de fer'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de fer'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de fer'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de fer'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de fer'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de fer'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de fer'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de fer'), 0),
/* FIN DE FER */

/* DÉBUT ENCHANTÉE */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée enchantée'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée enchantée'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée enchantée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton enchanté'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton enchanté'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton enchanté'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton enchanté'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton enchanté'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau enchanté'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau enchanté'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau enchanté'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau enchanté'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau enchanté'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier enchanté'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier enchanté'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier enchanté'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier enchanté'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier enchanté'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague enchantée'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague enchantée'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague enchantée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette enchantée'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette enchantée'), 5),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette enchantée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache enchantée'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache enchantée'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache enchantée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance enchantée'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance enchantée'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance enchantée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance enchantée'), 0),
/* FIN ENCHANTÉE */

/* DÉBUT MAUDIT */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée maudite'), 24),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée maudite'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée maudite'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton maudit'), 24),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton maudit'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton maudit'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton maudit'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton maudit'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau maudit'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau maudit'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau maudit'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau maudit'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau maudit'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier maudit'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier maudit'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier maudit'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier maudit'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier maudit'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague maudite'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague maudite'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague maudite'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette maudite'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette maudite'), 6),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette maudite'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache maudite'), 24),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache maudite'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache maudite'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance maudite'), 24),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance maudite'), 12),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance maudite'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance maudite'), 0),
/* FIN MAUDIT */

/* DÉBUT SACRÉE */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée sacrée'), 26),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée sacrée'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée sacrée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton sacré'), 26),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton sacré'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton sacré'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton sacré'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton sacré'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau sacré'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau sacré'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau sacré'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau sacré'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau sacré'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier sacré'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier sacré'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier sacré'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier sacré'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier sacré'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague sacrée'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague sacrée'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague sacrée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette sacrée'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette sacrée'), 7),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette sacrée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache sacrée'), 26),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache sacrée'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache sacrée'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance sacrée'), 26),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance sacrée'), 13),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance sacrée'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance sacrée'), 0),
/* FIN SACRÉE */

/* DÉBUT CRYSTAL */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de crystal'), 30),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de crystal'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de crystal'), 30),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de crystal'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de crystal'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de crystal'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de crystal'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de crystal'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de crystal'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de crystal'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de crystal'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de crystal'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de crystal'), 30),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de crystal'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de crystal'), 30),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de crystal'), 15),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de crystal'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de crystal'), 0),
/* FIN CRYSTAL */

/* DÉBUT HÉROIQUE */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée héroïque'), 32),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée héroïque'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton héroïque'), 32),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton héroïque'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau héroïque'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau héroïque'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier héroïque'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier héroïque'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague héroïque'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague héroïque'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette héroïque'), 8),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette héroïque'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache héroïque'), 32),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache héroïque'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance héroïque'), 32),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance héroïque'), 16),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance héroïque'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance héroïque'), 0),
/* FIN HÉROIQUE */

/* DÉBUT LÉGENDAIRE */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée légendaire'), 36),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée légendaire'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton légendaire'), 36),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton légendaire'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau légendaire'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau légendaire'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier légendaire'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier légendaire'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague légendaire'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague légendaire'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette légendaire'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette légendaire'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache légendaire'), 36),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache légendaire'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance légendaire'), 36),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance légendaire'), 18),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance légendaire'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance légendaire'), 0),
/* FIN LÉGENDAIRE */

/* DÉBUT DIAMANT */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de diamant'), 38),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée de diamant'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de diamant'), 38),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton de diamant'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de diamant'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau de diamant'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de diamant'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier de diamant'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de diamant'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague de diamant'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de diamant'), 9),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette de diamant'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de diamant'), 38),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache de diamant'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de diamant'), 38),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de diamant'), 19),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de diamant'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance de diamant'), 0),
/* FIN DIAMANT */

/* DÉBUT CÉLESTE */
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée céleste'), 40),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Épée céleste'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton céleste'), 40),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bâton céleste'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau céleste'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Marteau céleste'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier céleste'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Bouclier céleste'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague céleste'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Dague céleste'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette céleste'), 10),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Baguette céleste'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache céleste'), 40),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vie'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Hache céleste'), 0),

( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Force'), (SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance céleste'), 40),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Vitesse'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance céleste'), 20),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Défense'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='Énergie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance céleste'), 0),
( (SELECT idCaracteristique FROM  Caracteristiques WHERE nom='vie'),(SELECT idEquipementModele FROM EquipementsModeles WHERE nom='Lance céleste'), 0);

/* FIN CÉLESTE */