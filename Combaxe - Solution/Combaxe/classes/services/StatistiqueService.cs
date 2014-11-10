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

        /// <summary>
        /// Crée un objet statistique, tommy gingras
        /// </summary>
        /// <param name="where">le id du personnage</param>
        /// <returns>un objet de type statistique</returns>
        public Statistique SelectionStatsPersonnage(string where)
        {
            string reqSelect = "SELECT idStatistique, tempsDeJeu, nombreDeCombat, victoire, defaite, dommageTotal, moyenneDommage, nombreAttaque FROM Statistiques WHERE " + where + ";";
            int nbRow = 0;
            List<string>[] lstStats;
            Statistique Stats = null;
            lstStats = bdCombaxe.selection(reqSelect, 8, ref nbRow);

            for (int i = 0; i < nbRow; i++)
            {
                int id = Convert.ToInt32(lstStats[i][0]);
                TimeSpan tmjeu = TimeSpan.ParseExact(lstStats[i][1], "c", null);
                int nbCombat = Convert.ToInt32(lstStats[i][2]);
                int nbVictoire = Convert.ToInt32(lstStats[i][3]);
                int nbDefaite = Convert.ToInt32(lstStats[i][4]);
                int dmTotal = Convert.ToInt32(lstStats[i][5]);
                int dmMoy = Convert.ToInt32(lstStats[i][6]); 
                int nbAtt = Convert.ToInt32(lstStats[i][7]);

                Stats = new Statistique(id, tmjeu, nbCombat, nbVictoire, nbDefaite, dmTotal, dmMoy, nbAtt);
            }
            return Stats;
        }
    }
}
