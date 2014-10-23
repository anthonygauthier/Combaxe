using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    public class PersonnageService
    {
        // on ouvre la connection
        BdService bdCombaxe = new BdService();
        /// <summary>
        /// Pour récupérer toutes les données des personnages d'un joueur
        /// </summary>
        /// <returns>Liste de toutes les données des personnages</returns>
        public List<Personnage> RetrieveInfoPerso(){
            string reqSelect = "SELECT idPersonnage, nom, niveau, experience, image FROM Personnages WHERE idJoueur = '"+VarGlobales.Joueur.idJoueur+"';";
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 5, ref nbLigne);

            if(nbLigne != 0){
                List<Personnage> lstPersonnage = new List<Personnage>();
                List<Caracteristique> lstCar = new List<Caracteristique>();

                if(lstPerso.Count() != 0){
                    for (int i = 0; i < lstPerso.Count(); i++) 
                    {
                            /* aller chercher leurs caractéristiques */
                            lstCar = RetrieveCaracteristiques(Convert.ToInt32(lstPerso[i][0]));
                            
                            Personnage perso = new Personnage(Convert.ToInt32(lstPerso[i][0]), lstPerso[i][1], Convert.ToInt32(lstPerso[i][2]), Convert.ToInt32(lstPerso[i][3]), lstPerso[i][4], lstCar);
                            lstPersonnage.Add(perso);
                            lstCar = new List<Caracteristique>();
                     }
                }
                return lstPersonnage;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Récupère toutes les caractéristiques d'un personnage
        /// </summary>
        /// <param name="idPersonnage">le id du personnage</param>
        /// <returns>retourne sous forme d'objet caractéristique</returns>
        public List<Caracteristique> RetrieveCaracteristiques(int idPersonnage)
        {
            /* pour chaque personnage qui existe je veux ajouter ses caractéristiques
             */
            List<string>[] lstCaracteristiques = null;
            List<Caracteristique> lstCar = new List<Caracteristique>();

            string reqSelect = "SELECT c.idCaracteristique, c.nom, cp.valeur FROM Personnages p INNER JOIN CaracteristiquesPersonnages cp ON cp.idPersonnage =  p.idPersonnage INNER JOIN Caracteristiques c ON c.idCaracteristique = cp.idCaracteristique WHERE p.idPersonnage = '" + idPersonnage + "'";
            int nbLigne = 0;
            lstCaracteristiques = bdCombaxe.selection(reqSelect, 3, ref nbLigne);

            for (int y = 0; y < lstCaracteristiques.Count(); y++)
            {
                /* on doit aller faire le lien des caractéristiques pour chaque personnages donc un autre for du meme genre */
                if (lstCaracteristiques.Count() == 5)
                {
                    Caracteristique caract = new Caracteristique(Convert.ToInt32(lstCaracteristiques[y][0]), Convert.ToInt32(lstCaracteristiques[y][2]), lstCaracteristiques[y][1]);
                    lstCar.Add(caract);
                }
                else
                {
                    return null;
                }
            }
            return lstCar;
        }

        /// <summary>
        /// On veut sélectionner un personnage selon son ID
        /// </summary>
        /// <param name="id">le id du personnage désirée</param>
        /// <returns>on retourne un objet de type personnage</returns>
        public Personnage selectionUnPersonnage(int id)
        {            
            string reqSelect = "SELECT idPersonnage, nom, niveau, experience, image FROM Personnages WHERE idJoueur = '" + VarGlobales.Joueur.idJoueur + "' AND idPersonnage = '"+id+"';";
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 5, ref nbLigne);
            List<Caracteristique> lstCaracteristique = new List<Caracteristique>();

            if (nbLigne != 0)
            {
                Personnage perso = null;
                List<Caracteristique> lstCar = new List<Caracteristique>();

                if (lstPerso.Count() != 0)
                {
                    /* aller chercher leurs caractéristiques */
                    lstCar = RetrieveCaracteristiques(Convert.ToInt32(lstPerso[0][0]));

                    perso = new Personnage(Convert.ToInt32(lstPerso[0][0]), lstPerso[0][1], Convert.ToInt32(lstPerso[0][2]), Convert.ToInt32(lstPerso[0][3]), lstPerso[0][4], lstCar);
                   
                }
                
                return perso;
            }
            else
            {
                return null;
            }
        }

        //Méthode pour vérifier si l'utilisateur a des personnages - Anthony Gauthier 09/10/2014
        public bool VerificationPersonnage(string nom, string mdp)
        {
            JoueurService joueurService = new JoueurService();
            List<string>[] unJoueur;
            unJoueur = joueurService.RetrieveInfoJoueur(nom, mdp);

            string selPerso = "SELECT * FROM personnages WHERE idJoueur = " + unJoueur[0][0] + ";";

            List<string>[] persosDuJoueur;
            int nombreRange = 0;
            persosDuJoueur = bdCombaxe.selection(selPerso, 9, ref nombreRange);

            //Si le joueur n'a pas de personnages, on retourne false - Anthony Gauthier 09/10/2014
            if (persosDuJoueur[0][0].Length == 0)
            {
                return false;
            }
            //S'il en a, on retourne true - Anthony Gauthier 09/10/2014
            else
            {
                VarGlobales.aPersonnage = true;
                return true;
            }
        }

        //Méthode qui va chercher la description de la profession dans la BD et la retourne
        public string selectionDescription(string nom)
        {
            string description = string.Empty;
            string requete = "SELECT description FROM professions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '" + nom + "');";
            List<string>[] maDescription;
            int nombreRange = 0;

            maDescription = bdCombaxe.selection(requete, 1, ref nombreRange);

            description = maDescription[0][0];

            return description;
        }

        //Méthode qui va chercher les caractéristiques de base de chaque profession
        public List<string>[] RetrieveCaracteristiqueBase(string nom)
        {
            string requete = "SELECT valeur FROM caracteristiquesprofessions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '" + nom + "');";
            List<string>[] mesCaracteristiques;
            int nombreRange = 0;

            mesCaracteristiques = bdCombaxe.selection(requete, 1, ref nombreRange);

            return mesCaracteristiques;
        }

        //Méthode qui va chercher le idProfession
        public int RetrieveIdProfession(string nom)
        {
            string requete = "SELECT idProfession FROM Professions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '" + nom + "');";
            List<string>[] lstId;
            int nombreRange = 0;
            int id = 0;

            lstId = bdCombaxe.selection(requete, 1, ref nombreRange);

            id = Int32.Parse(lstId[0][0]);

            return id;
        }

        //Méthode qui va créer le personnage
        public void CreerPersonnage(int valForce, int valDefense, int valVie, int valEnergie, int valVitesse, int idProfession, string nomPerso)
        {
            string reqInsertInventaire = "INSERT INTO Inventaires (argent) VALUES (0);";
            string reqInsertStatistiques = "INSERT INTO Statistiques (tempsDeJeu, nombreDeCombat, victoire, defaite, dommageTotal, moyenneDommage, nombreAttaque) VALUES (0,0,0,0,0,0,0);";
   
            int idInventaire = 0;
            int idStatistique = 0;
            int idPersonnage = 0;

            //On insert l'inventaire et on sauvegarde le id
            bdCombaxe.Insertion(reqInsertInventaire);
            idInventaire = bdCombaxe.lastInsertId();

            //On insert les statistiques et on sauvegarde le id
            bdCombaxe.Insertion(reqInsertStatistiques);
            idStatistique = bdCombaxe.lastInsertId();

            //On insert le personnage
            string reqInsertPerso = "INSERT INTO Personnages (idProfession, idInventaire, idJoueur, idStatistique, nom, niveau, experience, image) VALUES ("+idProfession+"," + idInventaire + "," + VarGlobales.Joueur.idJoueur + "," + idStatistique + ",'" + nomPerso + "',1,0,null)";
            bdCombaxe.Insertion(reqInsertPerso);
            idPersonnage = bdCombaxe.lastInsertId();

            InsertCaracteristique("Force", idPersonnage, valForce);
            InsertCaracteristique("Vitesse", idPersonnage, valVitesse);
            InsertCaracteristique("Vie", idPersonnage, valVie);
            InsertCaracteristique("Énergie", idPersonnage, valEnergie);
            InsertCaracteristique("Défense", idPersonnage, valDefense);
        }

        public void InsertCaracteristique(string nomCaracteristique, int idPersonnage, int valeur)
        { 
            string requeteInsert = "INSERT INTO CaracteristiquesPersonnages (idCaracteristique, idPersonnage, valeur) VALUES ((SELECT idCaracteristique FROM Caracteristiques WHERE nom = '"+nomCaracteristique+"'),"+idPersonnage+","+valeur+")";
            bdCombaxe.Insertion(requeteInsert);
        }

        public bool RetrieveExistancePersonnage(string nomPersonnage)
        {
            string requeteNomPerso = "SELECT nom FROM Personnages WHERE nom = '" + nomPersonnage + "';";

            List<string>[] listNom;
            int nombreRange = 0;

            listNom = bdCombaxe.selection(requeteNomPerso, 1, ref nombreRange);

            //S'il est vrai que le nom de personnage existe déjà, on retourne vrai
            if (listNom[0][0].Length != 0)
            {
                return true;
            }
            else
            { 
                return false;
            }
        }
    }
}
