using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Modele
    {
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
