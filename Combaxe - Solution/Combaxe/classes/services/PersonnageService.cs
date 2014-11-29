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
        InventaireService inventaireService = new InventaireService();
        CaracteristiqueService caracteristiqueService = new CaracteristiqueService();
        ConsommationService consommationService = new ConsommationService();
        EquipementService equipementService = new EquipementService();

        /// <summary>
        /// Pour récupérer toutes les données des personnages d'un joueur, Tommy Gingras
        /// </summary>
        /// <returns>Liste de toutes les données des personnages</returns>
        public List<Personnage> RetrieveInfoPerso(){
            string reqSelect = ecrireSelect("estActif = TRUE AND idJoueur = '" + VarGlobales.Joueur.idJoueur+"'", "idPersonnage, nom, niveau, image, idProfession");
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 5, ref nbLigne);

            if(nbLigne != 0){
                List<Personnage> lstPersonnage = new List<Personnage>();
                Profession prof;
                
                if(lstPerso.Count() != 0){
                    for (int i = 0; i < lstPerso.Count(); i++) 
                    {
                        prof = professionService.RetrieveIdProfessionAvecId(Convert.ToInt32(lstPerso[i][4]));
                        Personnage perso = new Personnage(Convert.ToInt32(lstPerso[i][0]), lstPerso[i][1].ToString(), Convert.ToInt32(lstPerso[i][2]), prof, lstPerso[i][3].ToString());
                        lstPersonnage.Add(perso);
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
        /// Fonction qui va chercher la progression du personnage dans la campagne - Anthony Gauthier 
        /// </summary>
        /// <returns></returns>
        public void RetrieveInfoCampagnePerso()
        {
            string reqSelect = "SELECT idCampagne FROM Personnages WHERE idPersonnage = "+VarGlobales.Personnage.IdPersonnage+";";
            int nbLigne = 0;
            List<string>[] lstCampagne = bdCombaxe.selection(reqSelect, 1, ref nbLigne);

            VarGlobales.Personnage.IdCampagne = Convert.ToInt32(lstCampagne[0][0]);
        }

        public void MajCampagnePerso()
        {
            string reqMaj = "UPDATE Personnages SET idCampagne = idCampagne+1 WHERE idPersonnage = "+VarGlobales.Personnage.IdPersonnage+";";
            bdCombaxe.maj(reqMaj);
        }

        /// <summary>
        /// On veut sélectionner un personnage selon son ID, Tommy Gingras
        /// </summary>
        /// <param name="id">le id du personnage désirée</param>
        /// <returns>on retourne un objet de type personnage</returns>
        public Personnage selectionUnPersonnage(int id)
        {

            string reqSelect = ecrireSelect("estActif = TRUE AND idJoueur = '" + VarGlobales.Joueur.idJoueur + "' AND idPersonnage = '" + id + "'", "idPersonnage, nom, niveau, experience, vie, energie, image, idProfession, idInventaire");
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 9, ref nbLigne);
            List<Caracteristique> lstCaracteristique = new List<Caracteristique>();
            Profession prof;
            List<Competence> lstComp = new List<Competence>();

            if (nbLigne != 0)
            {
                Personnage perso = null;
                List<Caracteristique> lstCar = new List<Caracteristique>();
                Inventaire inventaire = new Inventaire();

                if (lstPerso.Count() != 0)
                {
                    /* aller chercher leurs caractéristiques */

                    lstCar = caracteristiqueService.RetrieveCaracteristique(lstPerso[0][0], true);
                    prof = professionService.RetrieveIdProfessionAvecId(Convert.ToInt32(lstPerso[0][7]));
                    lstComp = competenceService.RetrieveCompetenceUnPersonnage(prof.IdProfession);
                    inventaire = inventaireService.retrieveInventaire(Convert.ToInt32(lstPerso[0][8]));
                    perso = new Personnage(Convert.ToInt32(lstPerso[0][0]), lstPerso[0][1], Convert.ToInt32(lstPerso[0][2]), Convert.ToInt32(lstPerso[0][3]), Convert.ToInt32(lstPerso[0][4]), Convert.ToInt32(lstPerso[0][5]), lstPerso[0][6], lstCar, prof, lstComp, inventaire);                   
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
        public int CreerPersonnage(int valForce, int valDefense, int valVie, int valEnergie, int valVitesse, int idProfession, string nomPerso)
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

            // On va chercher la bonne sélection
            //string imageURL = "";
            Profession Prof = professionService.RetrieveIdProfessionAvecId(idProfession);
            string image = @"resources\\images\\personnages\\"+nomPerso+".jpg";

            //On insert le personnage
            string reqInsertPerso = "INSERT INTO Personnages (idProfession, idInventaire, idJoueur, nom, niveau, experience, vie, energie, image) VALUES ("+idProfession+"," + idInventaire + "," + VarGlobales.Joueur.idJoueur + ",'" + nomPerso + "',1,0,"+viePersonnage+","+energiePersonnage+",'"+image+"')";
            bdCombaxe.Insertion(reqInsertPerso);
            idPersonnage = bdCombaxe.lastInsertId();

            //On donne des potions de départ au personnage
            string reqInsertPotionVie = "INSERT INTO InventairesConsommations (idInventaire, idConsommation, quantite) VALUES (" + idInventaire + ",(SELECT idConsommation FROM Consommations WHERE nom='Potion de vie'),3);";
            bdCombaxe.Insertion(reqInsertPotionVie);

            string reqInsertPotionEnergie = "INSERT INTO InventairesConsommations (idInventaire, idConsommation, quantite) VALUES (" + idInventaire + ",(SELECT idConsommation FROM Consommations WHERE nom='Potion énergie'),3);";
            bdCombaxe.Insertion(reqInsertPotionEnergie);

            caracteristiqueService.InsertCaracteristique(Caracteristiques.Force.ToString(), idPersonnage, valForce);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Vitesse.ToString(), idPersonnage, valVitesse);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Vie.ToString(), idPersonnage, valVie);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Energie.ToString(), idPersonnage, valEnergie);
            caracteristiqueService.InsertCaracteristique(Caracteristiques.Defense.ToString(), idPersonnage, valDefense);

            //On insert les statistiques et on sauvegarde le id
            statistiqueService.InsertionStatistiques(idPersonnage);
            idStatistique = bdCombaxe.lastInsertId();

            return idPersonnage;
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
        /// Fonction qui fait la mise à jour de la vie du personnage en BD - Modifié Anthony Gauthier 4/11/2014
        /// </summary>
        /// <param name="dmg">Nombre de dégâts infligés au personnage</param>
        public void MAJVieEnergie(bool mort)
        {
            //Si le personnage est mort, on lui remet 50% de sa vie
            if(mort)
            { 
                int vie = (int) (VarGlobales.Personnage.Vie * 0.5);
                int energie = (int) (VarGlobales.Personnage.Energie * 0.5);
                string requeteUpdate = "UPDATE Personnages SET vie = "+vie+", energie = "+energie+" WHERE idPersonnage = '" + VarGlobales.Personnage.IdPersonnage + "';";

                bdCombaxe.maj(requeteUpdate);

                VarGlobales.Personnage.Vie = vie;
                VarGlobales.Personnage.Energie = energie;
            }
            //Sinon, la vie qui lui reste
            else
            {
                string requeteUpdate = "UPDATE Personnages SET vie = " + VarGlobales.Personnage.Vie + ", energie = " + VarGlobales.Personnage.Energie + " WHERE idPersonnage = '" + VarGlobales.Personnage.IdPersonnage + "';";

                bdCombaxe.maj(requeteUpdate);
            }
            consommationService.MAJConsommation();
        }
        
        /// <summary>
        /// Remet la vie et l'énergie du personnage au max en BASE DE DONNÉES - Modifié par Anthony Gauthier 4/11/2014
        /// </summary>
        public void RemiseDeVieEtEnergie()
        {
            string requeteUpdate = "UPDATE Personnages SET vie = " + VarGlobales.Personnage.VieMaximale + " , energie = " + VarGlobales.Personnage.EnergieMaximale + " WHERE idPersonnage = '" + VarGlobales.Personnage.IdPersonnage + "';";

            bdCombaxe.maj(requeteUpdate);
        }

        /// <summary>
        /// Met à jour l'expérience du personnage en BD - Anthony Gauthier 4/11/2014
        /// </summary>
        public void MiseAJourExperience()
        { 
            string requeteUpdate = "UPDATE Personnages SET experience = "+ VarGlobales.Personnage.Experience + " WHERE idPersonnage = " + VarGlobales.Personnage.IdPersonnage + ";";

            bdCombaxe.maj(requeteUpdate);

        }

        /// <summary>
        /// Met à jour le niveau du personnage en BD.  - Anthony Gauthier 4/11/2014
        /// </summary>
        public void MiseAJourNiveau()
        { 
            string requeteUpdate = "UPDATE Personnages SET niveau = "+(VarGlobales.Personnage.Niveau)+" WHERE idPersonnage = "+VarGlobales.Personnage.IdPersonnage+";";
            
            bdCombaxe.maj(requeteUpdate);
        }

        public int idStatistique(int idPersonnage)
        {
            string reqSelect = ecrireSelect("idPersonnage = "+idPersonnage, "idStatistique");
            int nbRange = 0;

            List<string>[] lstid = bdCombaxe.selection(reqSelect, 1, ref nbRange);
            if(nbRange == 1){
                return Convert.ToInt32(lstid[0][0]);
            }
            else
            {
                return 0;
            }
        }

        public void MAJEquipementPersonnage(List<Equipement> lstEquipement)
        {
            List<Equipement> ancienneLstEquipement = new List<Equipement>();
            string reqInsert;
            string reqDelete;
            bool existe;

            //On va chercher la liste d'équipement que le personnage avait équipé
            ancienneLstEquipement = equipementService.retrieveEquipementUtilise(VarGlobales.Personnage.IdPersonnage);

            //On compare l'ancienne liste avec la nouvelle 
            //si l'équipement dans l'ancien n'est plus dans la nouvelle, on la retire de la bd
            for (int i = 0; i < ancienneLstEquipement.Count(); i++)
            {
                existe = false;
                for (int j = 0; j < lstEquipement.Count(); j++)
                {
                    if (ancienneLstEquipement[i].IdEquipement == lstEquipement[j].IdEquipement)
                    {
                        existe = true;
                    }
                }

                if (existe == false)
                {
                    reqDelete = "DELETE FROM EquipementsPersonnages WHERE idPersonnage ='" + VarGlobales.Personnage.IdPersonnage + "' AND idEquipement ='" + ancienneLstEquipement[i].IdEquipement + "';";
                    bdCombaxe.maj(reqDelete);
                }
            }

            //On compare la nouvelle liste avec l'ancienne
            //si l'équipement dans la nouvelle n'est pas dans l'ancienne, on l'ajoute à la bd
            for (int i = 0; i < lstEquipement.Count(); i++)
            {
                existe = false;
                if (ancienneLstEquipement.Count() != 0)
                {
                    for (int j = 0; j < ancienneLstEquipement.Count(); j++)
                    {
                        if (ancienneLstEquipement[j].IdEquipement == lstEquipement[i].IdEquipement)
                        {
                            existe = true;
                        }
                    }
                }

                if (existe == false)
                {
                    reqInsert = "INSERT INTO EquipementsPersonnages (idPersonnage,idEquipement) VALUES ('" + VarGlobales.Personnage.IdPersonnage + "','" + lstEquipement[i].IdEquipement + "');";
                    bdCombaxe.Insertion(reqInsert);
                }
            }
            return;
        }
    }
}
