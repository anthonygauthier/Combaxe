using MiniBD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes.services
{
    public class ConsommationService
    {
        BdService bdCombaxe = new BdService();

        public Consommation RetrieveConsommation(int idInventaire, int idCons)
        {
            int nombreRange = 0;
            List<string>[] infoCons;
            string reqConsommation = "SELECT c.idConsommation, c.idTypeConsommation, c.nom, c.prix, c.valeurPourcentage, c.image, ic.quantite FROM Consommations c INNER JOIN InventairesConsommations ic ON c.idConsommation=ic.idConsommation WHERE c.idConsommation = '" + idCons + "' AND ic.idInventaire='" + idInventaire + "' ;";
            infoCons = bdCombaxe.selection(reqConsommation, 7, ref nombreRange);

            Consommation consommation = new Consommation(Convert.ToInt32(infoCons[0][0]), infoCons[0][1], infoCons[0][2], Convert.ToDouble(infoCons[0][3]),
                                                        Convert.ToDouble(infoCons[0][4]), infoCons[0][5], Convert.ToInt32(infoCons[0][6]));

            return consommation;
        }

        public void MAJConsommation()
        {
            int qPotionVie = VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Vie].Quantite;
            int qPotionEnergie = VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Energie].Quantite;

            string requeteUpdate = "UPDATE InventairesConsommations SET quantite = " + qPotionVie + " WHERE idInventaire = '" + VarGlobales.Personnage.Inventaire.idInventaire + "'AND idConsommation= (SELECT idConsommation FROM Consommations WHERE idTypeConsommation = (SELECT idTypeConsommation FROM TypesConsommations WHERE nom= '"+Consommations.Vie+"'));";

            bdCombaxe.maj(requeteUpdate);

            requeteUpdate = "UPDATE InventairesConsommations SET quantite = " + qPotionEnergie + " WHERE idInventaire = '" + VarGlobales.Personnage.Inventaire.idInventaire + "'AND idConsommation= (SELECT idConsommation FROM Consommations WHERE idTypeConsommation = (SELECT idTypeConsommation FROM TypesConsommations WHERE nom= '" + Consommations.Energie + "'));";

            bdCombaxe.maj(requeteUpdate);
        }
    }
}
