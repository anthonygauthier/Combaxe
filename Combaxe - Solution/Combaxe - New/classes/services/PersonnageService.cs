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
        ProfessionService professionService = new ProfessionService();
        /// <summary>
        /// Pour récupérer toutes les données des personnages d'un joueur, Tommy Gingras
        /// </summary>
        /// <returns>Liste de toutes les données des personnages</returns>
        public List<Personnage> RetrieveInfoPerso(){
            string reqSelect = ecrireSelect("estActif = TRUE AND idJoueur = '" + VarGlobales.Joueur.idJoueur+"'", "idPersonnage, nom, niveau, experience, image, idProfession");
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 6, ref nbLigne);

            if(nbLigne != 0){
                List<Personnage> lstPersonnage = new List<Personnage>();
                List<Caracteristique> lstCar = new List<Caracteristique>();
                Profession prof;
                if(lstPerso.Count() != 0){
                    for (int i = 0; i < lstPerso.Count(); i++) 
                    {
                            /* aller chercher leurs caractéristiques */
                            lstCar = RetrieveCaracteristiques(Convert.ToInt32(lstPerso[i][0]));
                            prof = professionService.RetrieveIdProfessionAvecId(Convert.ToInt32(lstPerso[i][5]));

                            Personnage perso = new Personnage(Convert.ToInt32(lstPerso[i][0]), lstPerso[i][1], Convert.ToInt32(lstPerso[i][2]), Convert.ToInt32(lstPerso[i][3]), lstPerso[i][4], lstCar, prof);
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
        /// Récupère toutes les caractéristiques d'un personnage, Tommy Gingras
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
        /// On veut sélectionner un personnage selon son ID, Tommy Gingras
        /// </summary>
        /// <param name="id">le id du personnage désirée</param>
        /// <returns>on retourne un objet de type personnage</returns>
        public Personnage selectionUnPersonnage(int id)
        {

            string reqSelect = ecrireSelect("estActif = TRUE AND idJoueur = '" + VarGlobales.Joueur.idJoueur + "' AND idPersonnage = '" + id + "'", "idPersonnage, nom, niveau, experience, image, idProfession");
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 6, ref nbLigne);
            List<Caracteristique> lstCaracteristique = new List<Caracteristique>();
            Profession prof;
            if (nbLigne != 0)
            {
                Personnage perso = null;
                List<Caracteristique> lstCar = new List<Caracteristique>();

                if (lstPerso.Count() != 0)
                {
                    /* aller chercher leurs caractéristiques */
                    lstCar = RetrieveCaracteristiques(Convert.ToInt32(lstPerso[0][0]));
                    prof = professionService.RetrieveIdProfessionAvecId(Convert.ToInt32(lstPerso[0][5]));
                    perso = new Personnage(Convert.ToInt32(lstPerso[0][0]), lstPerso[0][1], Convert.ToInt32(lstPerso[0][2]), Convert.ToInt32(lstPerso[0][3]), lstPerso[0][4], lstCar, prof);
                   
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

            string selPerso = "SELECT * FROM personnages WHERE idJoueur = " + unJoueur[0][0] + " AND estActif = TRUE;";

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

        //Méthode qui va créer le personnage - Anthony Gauthier 2014-10-24
        public void CreerPersonnage(int valForce, int valDefense, int valVie, int valEnergie, int valVitesse, int idProfession, string nomPerso)
        {
            InventaireService inventaireService = new InventaireService();
            StatistiqueService statistiqueService = new StatistiqueService();
            CaracteristiqueService caracteristiqueService = new CaracteristiqueService();
   
            int idInventaire = 0;
            int idStatistique = 0;
            int idPersonnage = 0;

            //On insert l'inventaire et on sauvegarde le id
            inventaireService.InsertionInventaire();
            idInventaire = bdCombaxe.lastInsertId();

            //On insert les statistiques et on sauvegarde le id
            statistiqueService.InsertionStatistiques();
            idStatistique = bdCombaxe.lastInsertId();

            //On insert le personnage
            string reqInsertPerso = "INSERT INTO Personnages (idProfession, idInventaire, idJoueur, idStatistique, nom, niveau, experience, image) VALUES ("+idProfession+"," + idInventaire + "," + VarGlobales.Joueur.idJoueur + "," + idStatistique + ",'" + nomPerso + "',1,0,null)";
            bdCombaxe.Insertion(reqInsertPerso);
            idPersonnage = bdCombaxe.lastInsertId();

            caracteristiqueService.InsertCaracteristique("Force", idPersonnage, valForce);
            caracteristiqueService.InsertCaracteristique("Vitesse", idPersonnage, valVitesse);
            caracteristiqueService.InsertCaracteristique("Vie", idPersonnage, valVie);
            caracteristiqueService.InsertCaracteristique("Énergie", idPersonnage, valEnergie);
            caracteristiqueService.InsertCaracteristique("Défense", idPersonnage, valDefense);
        }

        //Méthode qui va retourner si le personnage existe ou non (pour la création de personnage) - Anthony Gauthier 2014-10-24
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

        /// <summary>
        /// Pour "supprimer" un personnage, tommy gingras
        /// </summary>
        /// <param name="id">on passe le ID du personnage</param>
        public void desactivePersonnage(int id)
        {
            string requeteUpdate = "UPDATE Personnages SET estActif = FALSE WHERE idPersonnage = '"+id+"';";

            bdCombaxe.maj(requeteUpdate);
        }

        /// <summary>
        /// Pour éviter les répétitions pour mes select, tommy gingras
        /// </summary>
        /// <param name="where">le champs where de la requete</param>
        /// <param name="champs">les champs qu'on veut résupérer dans la table</param>
        /// <returns>retourne la requete en string</returns>
        public string ecrireSelect(string where, string champs)
        {
            string select = "";
            if (where.Length != 0 && champs.Length != 0)
            {
                select = "SELECT " + champs + " FROM Personnages WHERE " + where + ";";
            }
            else
            {
                return select;
            }
            return select;
        }
    }
}
