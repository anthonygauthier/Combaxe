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

            equipementInventaire = equipementService.retreiveEquipementInventaire(idInventaire);
            equipementUtilise = equipementService.retreiveEquipementUtilise(idInventaire);

            Inventaire inventaire = new Inventaire(idInventaire, Convert.ToInt64(contenuInventaire[0][0]), equipementInventaire, equipementUtilise, lstConsommation);

            return inventaire;
        }
    }
}
