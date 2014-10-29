INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Attaque physique'
,2
,5
,0
,1
,'Attaque simple effectué avec les pièces d\'équipements portées. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Rayon horrifiant'
,7
,12
,5
,3
,'Rayon rouge qui fait trembler l\'ennemi de peur. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,(SELECT idEffet FROM Effets WHERE nom='Peur')
,'Hurlement de terreur'
,10
,18
,14
,4
,CONCAT('Hurlement qui fige l\'ennemi de peur. ',(SELECT description FROM Effets WHERE nom='Peur'),' pendant 2 tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Coup mental'
,20
,29
,27
,5
,'Sort magique qui trouble votre esprit et vous affaiblit. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Lancer de l\'épée'
,8
,12
,6
,2
,'Lance une épée qui afflige de lourd dégât à l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Saignement')
,'Torture physique'
,17
,21
,10
,4
,CONCAT('Torture l\'ennemi avec un couteau. ',(SELECT description FROM Effets WHERE nom='Saignement'),' pendant 2 tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Tuerie'
,20
,30
,19
,5
,'Devient en furie et détruit tout sur son passage. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,(SELECT idEffet FROM Effets WHERE nom='Protection')
,'Bouclier des éléments'
,30
,35
,14
,3
,CONCAT('Absorbe les dégâts reçut dans ce bouclier résistant. ',(SELECT description FROM Effets WHERE nom='Protection'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,NULL
,'Guérison chamanistique'
,45
,49
,20
,4
,'Il se guérit avec les pouvoirs chamanique. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Attaque des éléments'
,24
,30
,18
,3
,'Invoque la puissance de la nature puis la déchaine contre l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Attaque squelettique'
,20
,28
,26
,2
,'Envoi une malédiction qui cible le squelette de l\'ennemi . '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Tempête de morts'
,25
,30
,30
,3
,'Libère la colère des revenants sur l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,(SELECT idEffet FROM Effets WHERE nom='Brulure')
,'Feu démoniaque'
,38
,45
,36
,4
,CONCAT('Attaque l\'ennemi avec le feu brûlant des enfers. ',(SELECT description FROM Effets WHERE nom='Brulure'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Brulure') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Saignement')
,'Coup de griffe'
,12
,20
,8
,3
,Concat('Coup de griffe sauvage. ',(SELECT description FROM Effets WHERE nom='Saignement'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Saignement') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Morsure endiablée'
,18
,25
,14
,3
,'Attaque l\'ennemi en le mordant avec la puissance de sa mâchoire. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Furie animale'
,27
,34
,20
,4
,'Déclanche sa furie et attaque l\'ennemi de multiple coups. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Coup demoniaque'
,14
,27
,13
,2
,'Frappe l\'ennemi avec la puissance des démons. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,NULL
,'Rituel de guérison'
,32
,47
,19
,3
,'Guérit la cible grâce à la puissance des ténèbres. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Coup des dieux corrompus'
,29
,50
,29
,3
,'Frappe l\'ennemi de toute sa puissance avec la hache légendaire des dieux célestes corrompu. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Boule de feu'
,5
,10
,4
,2
,'Lance une boule de feu à l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,(SELECT idEffet FROM Effets WHERE nom='Protection')
,'Armure Arcanique'
,6
,14
,12
,3
,Concat('Armure des arcanes. ',(SELECT description FROM Effets WHERE nom='Protection'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Décharge électrique'
,16
,25
,25
,4
,'Lance une boule de feu à l\'ennemi. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Coup divin'
,4
,7
,3
,2
,'Attaque l\'ennemi avec la puissance des dieux célestes. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,NULL
,'Prière de guérison'
,7
,10
,5
,3
,'Implore les dieux pour le guérir de ses douleurs et lui donner de la vie. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Marteau des dieux'
,14
,21
,17
,4
,'Les dieux enchantent l\'arme et la transforme en marteau céleste. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,(SELECT idEffet FROM Effets WHERE nom='Protection')
,'Peau d\'acier'
,4
,8
,2
,3
,Concat('La peau de la cible se durcit et devient aussi dure que l\'acier. ',(SELECT description FROM Effets WHERE nom='Protection'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Attaque précise'
,12
,16
,5
,3
,'Concentre son attaque sur un même point précis. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Vision de sang'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Tir gelé'
,15
,22
,12
,4
,Concat('La peau de la cible se durcit et devient aussi dure que l\'acier. ',(SELECT description FROM Effets WHERE nom='Glacé'),' pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Glacé') ,' tour.')
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Tir explosif'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Empoisonnement'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,NULL
,'Tir rapide'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Defensive')
,(SELECT idEffet FROM Effets WHERE nom='Protection')
,'Gardien'
,15
,20
,7
,4
,Concat('Bouclier divin pouvant absorber les dégats pendant ',(SELECT tempsEffets FROM Effets WHERE nom='Protection'))
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Magique')
,NULL
,'Souffle de feu'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Rapidité accru')
,'Mouvement agile'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Immobile')
,'Pétrification'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Support')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Régénération'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Invisibilité'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Attaque rapide'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Rafale de tentacules'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Invocation des morts'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Tremblement de terre'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Cri strident'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Coup ailé'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Piétinement'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Mélodie enchantée'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Coup foudroyant'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Confusion'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Instabilité'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Morsure'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Coup féroce'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

INSERT INTO Competences
(idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description)
VALUES
(
    (SELECT idTypeCompetence FROM TypesCompetences WHERE nom='Physique')
,(SELECT idEffet FROM Effets WHERE nom='Glacé')
,'Coup de corne'
,15
,22
,12
,4
,'Devient fou et veut voir son ennemi ensanglanté. '
);

