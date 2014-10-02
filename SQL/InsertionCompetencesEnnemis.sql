/* COMPÉTENCES AZAZEL */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Rayon horrifiant')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Hurlement de terreur')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Azazel')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup mental')
);

/* FIN COMPÉTENCES AZAZEL */
/* COMPÉTENCES Moguarnoch*/
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Lancer de l\'épée')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Torture physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Moguarnoch')
,	(SELECT idCompetence FROM Competences WHERE nom='Tuerie')
);

/* FIN COMPÉTENCES Moguarnoch*/

/* COMPÉTENCES Zakuta*/
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Bouclier des éléments')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Guérison chamanistique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Zakuta')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque des éléments')
);
/* FIN COMPÉTENCES Zakuta*/


/* COMPÉTENCES Ful'kitak */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque squelettique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Feu démoniaque')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Ful\'kitak')
,	(SELECT idCompetence FROM Competences WHERE nom='Tempête de morts')
);
/* FIN COMPÉTENCES Ful'kitak */

/* COMPÉTENCES Harfanghei */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup de griffe')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Morsure endiablée')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Harfanghei')
,	(SELECT idCompetence FROM Competences WHERE nom='Furie animale')
);

/* FIN COMPÉTENCES Harfanghei */

/* COMPÉTENCES Arkanok */
INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Attaque physique')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup démoniaque')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Rituel de guérison')
);

INSERT INTO CompetencesEnnemis
(idEnnemi, idCompetence)
VALUES
(
	(SELECT idEnnemi FROM Ennemis WHERE nom='Arkanok')
,	(SELECT idCompetence FROM Competences WHERE nom='Coup des dieux corrompus')
);
/* FIN COMPÉTENCES Arkanok */
