using MiniBD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes.services
{
    public class ModeleService
    {
        BdService bdCombaxe = new BdService();

        public Modele retreiveModele(int idModele)
        {
            Modele modele = new Modele();
            int nombreRange = 0;
            List<string>[] lstModele;

            string selModele = "SELECT nom, deuxMains FROM Modeles WHERE idModele = '"+idModele+"';";
            lstModele=bdCombaxe.selection(selModele, 2, ref nombreRange);
            modele = new Modele(idModele, lstModele[0][0], Convert.ToBoolean(lstModele[0][1]));

            return modele;
        }
    }
}
