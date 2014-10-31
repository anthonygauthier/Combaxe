using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;
using System.Windows.Media.Imaging;

namespace Combaxe___New.classes.services
{
    public class PersonnageService
    {
        // on ouvre la connection
        BdService bdCombaxe = new BdService();
        ProfessionService professionService = new ProfessionService();
        CompetenceService competenceService = new CompetenceService();

        /// <summary>
        /// Pour récupérer toutes les données des personnages d'un joueur, Tommy Gingras
        /// </summary>
        /// <returns>Liste de toutes les données des personnages</returns>
        public List<Personnage> RetrieveInfoPerso(){
            string reqSelect = ecrireSelect("estActif = TRUE AND idJoueur = '" + VarGlobales.Joueur.idJoueur+"'", "idPersonnage, nom, niveau, experience, vie, energie, image, idProfession");
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 8, ref nbLigne);

            if(nbLigne != 0){
                List<Personnage> lstPersonnage = new List<Personnage>();
                List<Caracteristique> lstCar = new List<Caracteristique>();
                CaracteristiqueService caracteristiqueService = new CaracteristiqueService();
                Profession prof;
                
                if(lstPerso.Count() != 0){
                    for (int i = 0; i < lstPerso.Count(); i++) 
                    {
                        /* aller chercher leurs caractéristiques */
                        lstCar = caracteristiqueService.RetrieveCaracteristique(lstPerso[i][0], true);
                        prof = professionService.RetrieveIdProfessionAvecId(Convert.ToInt32(lstPerso[i][7]));
                            
                        Personnage perso = new Personnage(Convert.ToInt32(lstPerso[i][0]), lstPerso[i][1], Convert.ToInt32(lstPerso[i][2]), Convert.ToInt32(lstPerso[i][3]), Convert.ToInt32(lstPerso[i][4]), Convert.ToInt32(lstPerso[i][5]), lstPerso[i][6], lstCar, prof, null);
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
        /// On veut sélectionner un personnage selon son ID, Tommy Gingras
        /// </summary>
        /// <param name="id">le id du personnage désirée</param>
        /// <returns>on retourne un objet de type personnage</returns>
        public Personnage selectionUnPersonnage(int id)
        {

            string reqSelect = ecrireSelect("estActif = TRUE AND idJoueur = '" + VarGlobales.Joueur.idJoueur + "' AND idPersonnage = '" + id + "'", "idPersonnage, nom, niveau, experience, vie, energie, image, idProfession");
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 8, ref nbLigne);
            List<Caracteristique> lstCaracteristique = new List<Caracteristique>();
            Profession prof;
            List<Competence> lstComp = new List<Competence>();

            if (nbLigne != 0)
            {
                Personnage perso = null;
                List<Caracteristique> lstCar = new List<Caracteristique>();
                CaracteristiqueService caracteristiqueService = new CaracteristiqueService();

                if (lstPerso.Count() != 0)
                {
                    /* aller chercher leurs caractéristiques */

                    lstCar = caracteristiqueService.RetrieveCaracteristique(lstPerso[0][0], true);
                    prof = professionService.RetrieveIdProfessionAvecId(Convert.ToInt32(lstPerso[0][7]));
                    lstComp = competenceService.RetrieveCompetenceUnPersonnage(prof.IdProfession);
                    perso = new Personnage(Convert.ToInt32(lstPerso[0][0]), lstPerso[0][1], Convert.ToInt32(lstPerso[0][2]), Convert.ToInt32(lstPerso[0][3]), Convert.ToInt32(lstPerso[0][4]), Convert.ToInt32(lstPerso[0][5]), lstPerso[0][6], lstCar, prof, lstComp);                   
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
            ProfessionService professionService = new ProfessionService();
   
            int idInventaire = 0;
            int idStatistique = 0;
            int idPersonnage = 0;
            int viePersonnage = Convert.ToInt32(((valVie)*20)/3.1416);
            int energiePersonnage = Convert.ToInt32(((valEnergie)*10)/3.1416);

            //On insert l'inventaire et on sauvegarde le id
            inventaireService.InsertionInventaire();
            idInventaire = bdCombaxe.lastInsertId();

            //On insert les statistiques et on sauvegarde le id
            statistiqueService.InsertionStatistiques();
            idStatistique = bdCombaxe.lastInsertId();
            // On va chercher la bonne sélection
            //string imageURL = "";
            Profession Prof = professionService.RetrieveIdProfessionAvecId(idProfession);
            string image = Prof.Image.UriSource.OriginalString;

            //On insert le personnage
            string reqInsertPerso = "INSERT INTO Personnages (idProfession, idInventaire, idJoueur, idStatistique, nom, niveau, experience, vie, energie, image) VALUES ("+idProfession+"," + idInventaire + "," + VarGlobales.Joueur.idJoueur + "," + idStatistique + ",'" + nomPerso + "',1,0,"+viePersonnage+","+energiePersonnage+",'"+image+"')";
            bdCombaxe.Insertion(reqInsertPerso);
            idPersonnage = bdCombaxe.lastInsertId();

            caracteristiqueService.InsertCaracteristique(Caracteristiques.Force.ToString(), idPersonnage, valForce);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Vitesse.ToString(), idPersonnage, valVitesse);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Vie.ToString(), idPersonnage, valVie);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Energie.ToString(), idPersonnage, valEnergie);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Defense.ToString(), idPersonnage, valDefense);
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

        /// <summary>
        /// Fonction qui fait la mise à jour de la vie du personnage en BD
        /// </summary>
        /// <param name="dmg">Nombre de dégâts infligés au personnage</param>
        public void MAJVieEnergie()
        {
            string requeteUpdate = "UPDATE Personnages SET vie = "+VarGlobales.Personnage.Vie+", energie = "+VarGlobales.Personnage.Energie+" WHERE idPersonnage = '" + VarGlobales.Personnage.IdPersonnage + "';";

            bdCombaxe.maj(requeteUpdate);
        }
        
        /// <summary>
        /// Remet la vie et l'énergie du personnage au max en BASE DE DONNÉES
        /// </summary>
        public void RemiseDeVieEtEnergie()
        {
            string requeteUpdate = "UPDATE Personnages SET vie = " + VarGlobales.Personnage.VieMaximale + " , energie = " + VarGlobales.Personnage.EnergieMaximale + " WHERE idPersonnage = '" + VarGlobales.Personnage.IdPersonnage + "';";

            bdCombaxe.maj(requeteUpdate);
        }

        public void MiseAJourExperience()
        { 
            string requeteUpdate = "UPDATE Personnages SET experience = "+ VarGlobales.Personnage.Experience + " WHERE idPersonnage = " + VarGlobales.Personnage.IdPersonnage + ";";

            bdCombaxe.maj(requeteUpdate);
        }
    }
}
