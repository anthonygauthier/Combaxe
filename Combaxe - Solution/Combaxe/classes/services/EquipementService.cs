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

        public List<Equipement> retreiveEquipementInventaire(int idInventaire)
        {
            List<Equipement> lstEquipementInventaire = new List<Equipement>();
            Equipement unEquipement = new Equipement();
            Modele modele = new Modele();
            List<string>[] lstEquipementQuantite = null;
            List<string>[] lstEquipement;
            int nombreRange = 0;

            string selQuantiteEquipementInventaire = "SELECT idEquipement, quantite FROM InventairesEquipements WHERE idInventaire = '"+idInventaire+"';";
            lstEquipementQuantite = bdCombaxe.selection(selQuantiteEquipementInventaire, 2, ref nombreRange);

            if (lstEquipementQuantite.Count() == 0)
            {
                string selEquipement;
                for (int i = 0; i < lstEquipementQuantite.Count(); i++)
                {
                    selEquipement = "SELECT idModele, nom, image, prix, degatMin, degatMax FROM EquipementsModeles em INNER JOIN Equipements e ON e.idEquipementModele = em.idEquipementModele WHERE e.idEquipement = '" + lstEquipementQuantite[i][0] + "';";
                    lstEquipement = bdCombaxe.selection(selEquipement, 6, ref nombreRange);
                    modele = modeleService.retreiveModele(Convert.ToInt32(lstEquipement[0][0]));
                    unEquipement = new Equipement(Convert.ToInt32(lstEquipementQuantite[i][0]), modele, lstEquipement[0][1], lstEquipement[0][2], Convert.ToDouble(lstEquipement[0][3]), Convert.ToInt32(lstEquipement[0][4]), Convert.ToInt32(lstEquipement[0][5]), Convert.ToInt32(lstEquipementQuantite[i][1]));
                    lstEquipementInventaire.Add(unEquipement);
                }
            }
            return lstEquipementInventaire;
        }

        public List<Equipement> retreiveEquipementUtilise(int idPersonnage)
        {
            List<Equipement> lstEquipementInventaire = new List<Equipement>();
            Equipement unEquipement = new Equipement();
            Modele modele = new Modele();
            List<string>[] lstEquipementQuantite = null;
            List<string>[] lstEquipement;
            int nombreRange = 0;

            string selQuantiteEquipementInventaire = "SELECT idEquipement FROM EquipementsPersonnages WHERE idPersonnage = '" + idPersonnage + "';";
            lstEquipementQuantite = bdCombaxe.selection(selQuantiteEquipementInventaire, 1, ref nombreRange);

            if (lstEquipementQuantite.Count() == 0)
            {
                string selEquipement;
                for (int i = 0; i < lstEquipementQuantite.Count(); i++)
                {
                    selEquipement = "SELECT idModele, nom, image, prix, degatMin, degatMax FROM EquipementsModeles em INNER JOIN Equipements e ON e.idEquipementModele = em.idEquipementModele WHERE e.idEquipement = '" + lstEquipementQuantite[i][0] + "';";
                    lstEquipement = bdCombaxe.selection(selEquipement, 6, ref nombreRange);
                    modele = modeleService.retreiveModele(Convert.ToInt32(lstEquipement[0][0]));
                    unEquipement = new Equipement(Convert.ToInt32(lstEquipementQuantite[i][0]), modele, lstEquipement[0][1], lstEquipement[0][2], Convert.ToDouble(lstEquipement[0][3]), Convert.ToInt32(lstEquipement[0][4]), Convert.ToInt32(lstEquipement[0][5]), 1);
                    lstEquipementInventaire.Add(unEquipement);
                }
            }
            return lstEquipementInventaire;
        }
    }
}
