INSERT INTO Campagne
(idEnnemi, histoireDebut, histoireFin)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel'),
	'Lors de la recherche pour trouver Arkanos, le héros aperçoit une générale de l’armée des enfers, Azazel.
	Cette magicienne de l’ombre spécialisée dans le contrôle de l’esprit communiquait avec l’un de ses messagers.
	Ce disant que le message qu’elle venait de recevoir pouvait être important, le héros se rapprocher de Azazel 
	pour tenter lui voler son message, cependant celle-ci le remarqua et le défia dans un combat.',
	'Une fois avoir vaincu Azazel, le héros prit le message et rechercha des informations. 
	Le message lui dit l’emplacement où se trouvait le campement du groupe d’Arkanos.'),

((SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok'),' w'),