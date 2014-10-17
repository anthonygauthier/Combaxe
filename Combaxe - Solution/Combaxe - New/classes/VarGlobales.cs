using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    class VarGlobales
    {
        static int _idJoueur;

        //Variable qui sauvegarde le idJoueur à travers le programme (lorsqu'il est connecté)
        public static int idJoueur
        {
            get
            {
                return _idJoueur;
            }
            set
            {
                _idJoueur = value;
            }
        }
    }
}
