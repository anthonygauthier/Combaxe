using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    class VarGlobales
    {
        static Joueur _Joueur;

        //Variable qui sauvegarde le idJoueur à travers le programme (lorsqu'il est connecté)
        public static Joueur Joueur
        {
            get
            {
                return _Joueur;
            }
            set
            {
                _Joueur = value;
            }
        }
    }
}
