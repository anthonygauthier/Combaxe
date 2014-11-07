INSERT INTO Consommations
(idTypeConsommation, nom, valeurPourcentage, prix)
VALUES
(
(SELECT idTypeConsommation FROM TypesConsommations WHERE nom='Vie')
,'Potion de santé'
,30
,120
);

INSERT INTO Consommations
(idTypeConsommation, nom, valeurPourcentage, prix)
VALUES
(
(SELECT idTypeConsommation FROM TypesConsommations WHERE nom='Énergie')
,'Potion d\'énergie'
,30
,120
);