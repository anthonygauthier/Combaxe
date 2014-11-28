using Combaxe___New.classes.abstraites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Media;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace Combaxe___New.classes
{
    public class VarGlobales
    {

        public static Joueur Joueur{ get; set; }
        public static Personnage Personnage { get; set; }
        public static Ennemi Ennemi { get; set; }

        public static DateTime HeureConnexion { get; set; }

        public static bool aPersonnage { get; set; }
        public static bool EstConnecte { get; set; }
        public static bool etaitMort { get; set; }
        public static bool aMonterNiveau { get; set; }
        public static bool fermerModifCaracteristique { get; set; }
        public static bool aAssezEnergie { get; set; }
        public static bool ChoixPersoFait { get; set; }
        public static bool campagne { get; set; }
        public static bool connexion { get; set; }

        public static SoundPlayer sonPotion { get; set; }

        public static bool Retour { get; set; }
    }
}
