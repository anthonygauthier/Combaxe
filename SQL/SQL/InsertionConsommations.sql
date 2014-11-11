INSERT INTO Consommations
(idTypeConsommation, nom, valeurPourcentage, prix)
VALUES
(
(SELECT idTypeConsommation FROM TypesConsommations WHERE nom='Vie')
,'Potion de vie'
,30
,120
);

INSERT INTO Consommations
(idTypeConsommation, nom, valeurPourcentage, prix)
VALUES
(
(SELECT idTypeConsommation FROM TypesConsommations WHERE nom='Énergie')
,'Potion énergie'
,30
,120
);