INSERT INTO Campagne
(idEnnemi, histoire)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei'),' w'),
((SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok'),' w'),