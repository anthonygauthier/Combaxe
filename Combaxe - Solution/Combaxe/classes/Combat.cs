using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Combat
    {
        public int viePersonnage;
        public int energiePersonnage;
        public int vieEnnemi;
        public int energieEnnemi;

        public Combat()
        {
            viePersonnage = 0;
            energiePersonnage = 0;
            vieEnnemi = 0;
            energieEnnemi = 0;
        }

        public Combat(Personnage personnage, Ennemi ennemi)
        {
            viePersonnage = Convert.ToInt32((personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416);
            energiePersonnage = Convert.ToInt32((personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 10) / 3.1416);
            vieEnnemi = Convert.ToInt32((ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416);
            energieEnnemi = Convert.ToInt32((ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 10) / 3.1416);
        }
    }
}
