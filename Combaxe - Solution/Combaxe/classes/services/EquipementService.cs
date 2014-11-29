using MiniBD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes.services
{
    class EquipementService
    {
        BdService bdCombaxe = new BdService();
        ModeleService modeleService = new ModeleService();
        CaracteristiqueService caracteristiqueService = new CaracteristiqueService();

        /// <summary>
        /// Fonction qui va chercher les informations d'un equipement.
        /// </summary>
        /// <param name="idEquipementModele">Le id de l'equipementModele</param>
        /// <param name="idEquipement">Le id de l'équipement</param>
        /// <returns>Un objet equipement</returns>
        public Equipement retrieveEquipementModele(int idEquipementModele, int idEquipement)
        {
            Equipement unEquipement = new Equipement();
            Modele modele = new Modele();
            List<string>[] lstEquipement;
            List<Caracteristique> lstCaracteristique = new List<Caracteristique>();
            int nombreRange = 0;

            //On fait un select dans la bd pour trouver les informations de l'equipementModele
            string selEquipement = "SELECT idModele, nom, image, prix, degatMin, degatMax FROM EquipementsModeles WHERE idEquipementModele = '" + idEquipementModele + "';";
            lstEquipement = bdCombaxe.selection(selEquipement, 6, ref nombreRange);

            //On va chercher le modele d'équipement
            modele = modeleService.retreiveModele(Convert.ToInt32(lstEquipement[0][0]));
            lstCaracteristique = caracteristiqueService.RetrieveCaracteristique(idEquipementModele.ToString(), typeof(Equipement));

            //On créer l'équipement et on le retourne
            unEquipement = new Equipement(idEquipement, idEquipementModele, modele, lstEquipement[0][1], lstEquipement[0][2], Convert.ToDouble(lstEquipement[0][3]), Convert.ToInt32(lstEquipement[0][4]), Convert.ToInt32(lstEquipement[0][5]), lstCaracteristique);
            return unEquipement;
        }

        /// <summary>
        /// Fonction qui va chercher la liste d'équipement qui sont dans l'inventaire
        /// </summary>
        /// <param name="idInventaire">Le id de l'inventaire</param>
        /// <returns>Une liste d'équipement</returns>
        public List<Equipement> retrieveEquipementInventaire(int idInventaire)
        {
            List<Equipement> lstEquipementInventaire = new List<Equipement>();
            List<string>[] lstEquipement = null;
            List<string>[] lstEquipementModele;
            int nombreRange = 0;

            //On fait un select des idEquipement des équipements qui se trouve dans l'inventaire
            string selEquipementInventaire = "SELECT idEquipement FROM InventairesEquipements WHERE idInventaire = '"+idInventaire+"';";
            lstEquipement = bdCombaxe.selection(selEquipementInventaire, 1, ref nombreRange);

            //Si l'inventaire n'est pas vide
            if (lstEquipement.Count() != 0 && lstEquipement[0][0]!="")
            {
                string selEquipement;
                
                for (int i = 0; i < lstEquipement.Count(); i++)
                {
                    //On va chercher les idEquipementModele des équipements de l'inventaire
                    //En donnant le idEquipementModele à la fonction retrieveEquipementModele, on reçoit les informations de l'équipement désiré
                    selEquipement = "SELECT idEquipementModele FROM Equipements WHERE idEquipement = '" + lstEquipement[i][0] + "';";
                    lstEquipementModele = bdCombaxe.selection(selEquipement, 1, ref nombreRange);

                    //On ajoute l'équipement à lstEquipementInventaire
                    lstEquipementInventaire.Add(retrieveEquipementModele(Convert.ToInt32(lstEquipementModele[0][0]),Convert.ToInt32(lstEquipement[i][0])));
                }
            }
            return lstEquipementInventaire;
        }

        /// <summary>
        /// Fonction qui va chercher la liste d'équipement qui sont équipés par le personnage
        /// </summary>
        /// <param name="idPersonnage">le id du personnage</param>
        /// <returns>Une liste d'équipement</returns>
        public List<Equipement> retrieveEquipementUtilise(int idPersonnage)
        {
            List<Equipement> lstEquipementUtilise = new List<Equipement>();
            List<string>[] lstEquipement = null;
            List<string>[] lstEquipementModele;
            int nombreRange = 0;

            //On fait un select des idEquipement des équipements qui sont portés par le personnage
            string selEquipementUtilise = "SELECT idEquipement FROM EquipementsPersonnages WHERE idPersonnage = '" + idPersonnage + "';";
            lstEquipement = bdCombaxe.selection(selEquipementUtilise, 1, ref nombreRange);

            //Si l'inventaire n'est pas vide
            if (lstEquipement[0][0] != "")
            {
                string selEquipement;
                for (int i = 0; i < lstEquipement.Count(); i++)
                {
                    //On va chercher les idEquipementModele des équipements qui sont portés par le personnage
                    //En donnant le idEquipementModele à la fonction retrieveEquipementModele, on reçoit les informations de l'équipement désiré
                    selEquipement = "SELECT idEquipementModele FROM Equipements WHERE idEquipement = '" + lstEquipement[i][0] + "';";
                    lstEquipementModele = bdCombaxe.selection(selEquipement, 1, ref nombreRange);
                    
                    //On ajoute l'équipement à lstEquipementUtilise
                    lstEquipementUtilise.Add(retrieveEquipementModele(Convert.ToInt32(lstEquipementModele[0][0]), Convert.ToInt32(lstEquipement[i][0])));
                }

                if(VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Force].Valeur==0
                    && VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Defense].Valeur == 0
                    && VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Energie].Valeur == 0
                    && VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vie].Valeur == 0
                    && VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vitesse].Valeur == 0)
                for (int i = 0; i < lstEquipementUtilise.Count(); i++)
                {
                    for (int j = 0; j < 5; j++)
                    {
                        switch(j)
                        {
                            case (int)Caracteristiques.Force:
                                VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Force].Valeur += lstEquipementUtilise[i].lstCaracteristique[j].Valeur;
                                break;
                            case (int)Caracteristiques.Defense:
                                VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Defense].Valeur += lstEquipementUtilise[i].lstCaracteristique[j].Valeur;
                                break;
                            case (int)Caracteristiques.Energie:
                                VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Energie].Valeur += lstEquipementUtilise[i].lstCaracteristique[j].Valeur;
                                break;
                            case (int)Caracteristiques.Vie:
                                VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vie].Valeur += lstEquipementUtilise[i].lstCaracteristique[j].Valeur;
                                break;
                            case (int)Caracteristiques.Vitesse:
                                VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vitesse].Valeur += lstEquipementUtilise[i].lstCaracteristique[j].Valeur;
                                break;
                        }
                    }
                }
            }
            return lstEquipementUtilise;
        }

        /// <summary>
        /// Fonction qui va chercher les équipements selon leur niveau
        /// </summary>
        /// <param name="niveau">Le niveau demandé pour les équipements</param>
        /// <returns>Une liste d'équipement</returns>
        public List<Equipement> retrieveEquipements(int niveau, int idEquipement)
        {
            List<Equipement> lstEquipementButin = new List<Equipement>();
            List<string>[] lstEquipement;
            int nombreRange = 0;

            //Selectionne les idEquipementModele des équipements recherchés
            string selEquipement = "SELECT idEquipementModele FROM EquipementsModeles WHERE niveauEquipement = '" + niveau + "';";
            lstEquipement=bdCombaxe.selection(selEquipement,1,ref nombreRange);

            //Si la liste n'est pas vide
            if (lstEquipement.Count() != 1)
            {
                for (int i = 0; i < lstEquipement.Count(); i++)
                {
                    //On ajoute l'équipement à lstEquipementButin
                    lstEquipementButin.Add(retrieveEquipementModele(Convert.ToInt32(lstEquipement[i][0]), idEquipement));
                }
            }
            return lstEquipementButin;
        }

        public int insertEquipement(int idEquipementModele)
        {
            string reqInsertEquipement = "INSERT INTO Equipements(idEquipementModele) VALUES ('" + idEquipementModele + "');";
            bdCombaxe.Insertion(reqInsertEquipement);
            return bdCombaxe.lastInsertId();
        }
    }
}
