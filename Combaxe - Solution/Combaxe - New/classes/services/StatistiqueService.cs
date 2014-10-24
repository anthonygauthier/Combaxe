using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    class StatistiqueService
    {
        BdService bdCombaxe = new BdService();

        //Méthode pour insérer un inventaire en BD lors de la création d'un personnage - Anthony Gauthier 2014-10-24
        public void InsertionStatistiques()
        {
            string reqInsertStatistiques = "INSERT INTO Statistiques (tempsDeJeu, nombreDeCombat, victoire, defaite, dommageTotal, moyenneDommage, nombreAttaque) VALUES (0,0,0,0,0,0,0);";

            bdCombaxe.Insertion(reqInsertStatistiques);
        }
    }
}
