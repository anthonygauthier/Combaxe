INSERT INTO Campagnes
(idEnnemi, histoireDebut, histoireFin)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
, 'Lors de la recherche pour trouver Arkanos, vous apercevez une générale de l’armée des enfers, Azazel. Cette magicienne de l’ombre spécialisée dans le contrôle de l’esprit communique avec l’un de ses messagers. Il vous faut ce message.'
, 'Une fois avoir vaincu Azazel, vous prenez le message et recherchez des informations. Le message vous dit l’emplacement où se trouve le campement du groupe d’Arkanos.'
);

INSERT INTO Campagnes
(idEnnemi, histoireDebut, histoireFin)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,  'Au loin, vous attendez des chants de guerres au loin. Vous vous approchez, regardez votre message et vous rendez compte que vous êtes bien au campement. Moguarnoch, le chef de guerre et autre général d\'Arkanos vous attaque.'
,  'Moguarnoch est vaincu, suite à la défaite du chef de guerre, les soldats du campement se sont enfuis dans la peur. Après une examination du campement, vous tombez sur un bout de parchemin indiquant la prochaine destination: un village tribal'
);

INSERT INTO Campagnes
(idEnnemi, histoireDebut, histoireFin)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,  'Arrivé au village tribal, vous demandez de l\'information au personnes de la tribu. Vous trouvant trop curieux, un chaman du nom de Zakuta vous défi à un duel. Si vous gagnez, il vous donnera de l\'information.'
,  'La défaite de Zakuta était inévitable, avant de mourir il cria : "LA CITÉ DES MORTS". À cet instant, vous savez où vous devez allez. Vous avez un rendez-vous avec les morts.'
);

INSERT INTO Campagnes
(idEnnemi, histoireDebut, histoireFin)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,  'Arrivé à la cité des morts, vous voyez que les portes de la forteresse sont gardées par un guarde. Mais ce garde n\'a pas l\'air d\'un simple guarde. Il semble communiquer avec les morts, il semble être un nécromencien son accueil est plutôt agressive.'
,  'Vous avez battu le guarde de la cité des morts. Vous ramassez la clé qui est tombé par terre suite à sa défaite et vous entrez.'
);

INSERT INTO Campagnes
(idEnnemi, histoireDebut, histoireFin)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,  'Au loin, vous voyez Arkanos qui vous dit: "Félicitations héro, vous êtes noble et fort. Vous avez battu tous mes généraux, sauf un. À table Harfanghei!"'
,  'Harfanghei est battu et vous êtes maintenant face à face avec le paladin corrompu.'
);

INSERT INTO Campagnes
(idEnnemi, histoireDebut, histoireFin)
VALUES(
(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanos')
,  'Arkanos: "SUFFIT! Je vais vous éliminez par moi même, sale rat!"'
,  'L\'énergie qui émane de la défaite d\'Arkanos vous trouble, mais vous y êtes arrivé, vous avez battu l\'armée des enfers. Vous prenez "Combaxe" et retourner voir les Dieux avec la hache.'
);
