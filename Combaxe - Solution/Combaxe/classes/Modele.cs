using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Modele
    {
        public enum Modeles : int
        {
            ArmeUneMain=1,
            ArmeDeuxMains=2,
            Bouclier=3,
            Casque=4,
            Épaulette=5,
            Plastron=6,
            Bottes=7,
            Pantalon=8
        }

        public int IdModele { get; set; }
        public string Nom { get; set; }
        public bool DeuxMains { get; set; }

        public Modele()
        {
            IdModele = 0;
            Nom = "";
            DeuxMains = false;
        }

        public Modele(int id, string n, bool dm)
        {
            IdModele = id;
            Nom = n;
            DeuxMains = dm;
        }
    }
}
