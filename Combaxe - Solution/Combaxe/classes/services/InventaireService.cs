using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    class InventaireService
    {
        BdService bdCombaxe = new BdService();
        ConsommationService consommationService = new ConsommationService();
        EquipementService equipementService = new EquipementService();

        //Méthode pour insérer un inventaire en BD lors de la création d'un personnage - Anthony Gauthier 2014-10-24
        public void InsertionInventaire()
        {
            string reqInsertInventaire = "INSERT INTO Inventaires (argent) VALUES (0);";

            bdCombaxe.Insertion(reqInsertInventaire);
        }

        /// <summary>
        /// Fonction qui va chercher un inventaire dans la bd
        /// </summary>
        /// <param name="idInventaire">Le idInventaire que l'on cherche</param>
        /// <returns>Retourne l'inventaire qui est recherché</returns>
        public Inventaire retrieveInventaire(int idInventaire)
        {
            List<string>[] contenuInventaire;
            List<Equipement> equipementInventaire = new List<Equipement>();
            List<Equipement> equipementUtilise = new List<Equipement>();
            List<Consommation> lstConsommation = new List<Consommation>();
            int nombreRange = 0;

            string reqInventaire = "SELECT argent FROM Inventaires WHERE idInventaire = '"+idInventaire+"';";
            contenuInventaire = bdCombaxe.selection(reqInventaire, 1, ref nombreRange);

            string reqNbCons = "SELECT ic.idConsommation FROM InventairesConsommations ic INNER JOIN Consommations c ON c.idConsommation = ic.idConsommation WHERE idInventaire='"+idInventaire+"' AND c.idTypeConsommation=(SELECT idTypeConsommation FROM TypesConsommations WHERE nom='"+Consommations.Vie+"');";
            List<string>[] idCons = bdCombaxe.selection(reqNbCons, 1, ref nombreRange);

            lstConsommation.Add(consommationService.RetrieveConsommation(idInventaire, Convert.ToInt32(idCons[0][0])));

            reqNbCons = "SELECT ic.idConsommation FROM InventairesConsommations ic INNER JOIN Consommations c ON c.idConsommation = ic.idConsommation WHERE idInventaire='" + idInventaire + "' AND c.idTypeConsommation=(SELECT idTypeConsommation FROM TypesConsommations WHERE nom='" + Consommations.Energie + "');";
            idCons = bdCombaxe.selection(reqNbCons, 1, ref nombreRange);

            lstConsommation.Add(consommationService.RetrieveConsommation(idInventaire, Convert.ToInt32(idCons[0][0])));

            equipementInventaire = equipementService.retrieveEquipementInventaire(idInventaire);
            equipementUtilise = equipementService.retrieveEquipementUtilise(idInventaire);

            Inventaire inventaire = new Inventaire(idInventaire, Convert.ToDouble(contenuInventaire[0][0]), equipementInventaire, equipementUtilise, lstConsommation);

            return inventaire;
        }

        /// <summary>
        /// Fonction qui met à jour l'argent dans la bd
        /// </summary>
        public void MAJArgent()
        {
            string argent = VarGlobales.Personnage.Inventaire.argent.ToString().Replace(',', '.');
            string requeteUpdate = "UPDATE Inventaires SET argent = " + argent + " WHERE idInventaire = " + VarGlobales.Personnage.Inventaire.idInventaire + ";";

            bdCombaxe.maj(requeteUpdate);
        }

        /// <summary>
        /// Fonction qui met à jour les équipements de l'inventaire dans la bd
        /// </summary>
        public void MAJEquipementInventaire(List<Equipement> lstEquipement)
        {
            List<Equipement> ancienneLstEquipement = new List<Equipement>();
            string reqInsert;
            string reqDelete;
            bool existe;

            //On va chercher la liste d'équipement que le personnage avait dans son inventaire
            ancienneLstEquipement = equipementService.retrieveEquipementInventaire(VarGlobales.Personnage.Inventaire.idInventaire);

            //On compare l'ancienne liste avec la nouvelle 
            //si l'équipement dans l'ancien n'est plus dans la nouvelle, on la retire de la bd
            for (int i = 0; i < ancienneLstEquipement.Count(); i++)
            {
                existe = false;
                for (int j = 0; j < lstEquipement.Count(); j++)
                {
                    if(ancienneLstEquipement[i].IdEquipement == lstEquipement[j].IdEquipement)
                    {
                        existe = true;
                    }
                }

                if(existe == false)
                {
                    reqDelete = "DELETE FROM InventairesEquipements WHERE idInventaire ='"+VarGlobales.Personnage.Inventaire.idInventaire+"' AND idEquipement ='"+ancienneLstEquipement[i].IdEquipement+"';";
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
                    reqInsert = "INSERT INTO InventairesEquipements (idInventaire,idEquipement) VALUES ('" + VarGlobales.Personnage.Inventaire.idInventaire + "','" + lstEquipement[i].IdEquipement + "');";
                    bdCombaxe.Insertion(reqInsert);
                }
            }
            return;
        }
    }
}
