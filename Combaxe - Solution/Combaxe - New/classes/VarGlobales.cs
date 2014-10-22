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
        static Personnage _Personnage;
        static int _idProfessionCreation;
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

        //Variable qui sauvegarde le personnage utilisé
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

        //Variable qui sauvegarde le idProfession à travers le programme
        public static int idProfessionCreation
        {
            get
            {
                return _idProfessionCreation;
            }
            set
            {
                _idProfessionCreation = value;
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
    }
}
