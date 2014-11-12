using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Statistique
    {
        //tommy gingras
        public int idStatistique { get; set; }
        public TimeSpan tempsDeJeu { get; set; }
        public int nombreDeCombat { get; set; }
        public int nombreVictoires { get; set; }
        public int nombreDefaites { get; set; }
        public int dommageTotal { get; set; }
        public double moyenneDommage { get; set; }
        public int nombreAttaque { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Statistique()
        {
            idStatistique = 0;
            tempsDeJeu = new TimeSpan(0,0,0);
            nombreAttaque = 0;
            nombreDeCombat = 0;
            nombreDefaites = 0;
            nombreVictoires = 0;
            dommageTotal = 0;
            moyenneDommage = 0;
        }


        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de la statistique</param>
        /// <param name="temps">temps joué par le personnage</param>
        /// <param name="nbrComb">nombre de combats effectués</param>
        /// <param name="nbrVic">nombre de victoires</param>
        /// <param name="nbrDef">nombre de défaites</param>
        /// <param name="dmgTotal">dommage total effectué par le personnage</param>
        /// <param name="moyDmg">moyenne de domage effectué par le personnage</param>
        /// <param name="nbrAtk">nombre d'attaques effectuées par le personnage</param>
        public Statistique(int id, TimeSpan temps, int nbrComb, int nbrVic, int nbrDef, int dmgTotal, int nbrAtk)
        {
            idStatistique = id;
            tempsDeJeu = temps;
            nombreDeCombat = nbrComb;
            nombreVictoires = nbrVic;
            nombreDefaites = nbrDef;
            dommageTotal = dmgTotal;
            moyenneDommage = dmgTotal/nbrAtk;
;
            nombreAttaque = nbrAtk;
        }

        /// <summary>
        /// Méthode qui modifie une statistique - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="uneStats">La statistique a modifier</param>
        public void modifierStatistique(Statistique uneStats)
        { 
            return;
        }
    }
}
