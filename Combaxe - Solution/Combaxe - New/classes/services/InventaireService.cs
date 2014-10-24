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

        //Méthode pour insérer un inventaire en BD lors de la création d'un personnage - Anthony Gauthier 2014-10-24
        public void InsertionInventaire()
        {
            string reqInsertInventaire = "INSERT INTO Inventaires (argent) VALUES (0);";

            bdCombaxe.Insertion(reqInsertInventaire);
        }
    }
}
