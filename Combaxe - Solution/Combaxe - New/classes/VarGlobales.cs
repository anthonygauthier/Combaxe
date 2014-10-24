using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class VarGlobales
    {
<<<<<<< HEAD
        public static Joueur Joueur{ get; set; }
        public static Personnage Personnage { get; set; }
        public static bool aPersonnage { get; set; }
        public static bool EstConnecte { get; set; }
=======
        static Joueur _Joueur;
        static Personnage _Personnage;
        static bool _aPersonnage;

        //Variable qui sauvegarde le joueur à travers le programme (lorsqu'il est connecté)
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

        //Variable qui sauvegarde le personnage utilisé, tommy gingras
        public static Personnage Personnage
        {
            get
            {
                return _Personnage;
            }
            set
            {
                _Personnage = value;
            }
        }

        //Variable qui sauvegarde si le joueur a des personnages
        public static bool aPersonnage
        {
            get
            {
                return _aPersonnage;
            }
            set
            {
                _aPersonnage = value;
            }
        }
>>>>>>> parent of 7284d3b... Revert "continuation modification pour les images"
    }
}
