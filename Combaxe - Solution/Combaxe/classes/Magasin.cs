using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace Combaxe___New.classes
{
    public class Magasin
    {
        private List<Equipement> listeEquipement;
        private Stopwatch tempsDeRecharge;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Magasin ()
	    {
            listeEquipement = null;
            tempsDeRecharge = null;
	    }

        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="lstEq">Liste d'équipement du magasin</param>
        /// <param name="recharge">Temps de recharge avant un nouveau magasin</param>
        public Magasin(List<Equipement> lstEq, Stopwatch recharge, Stopwatch actu)
        {
            listeEquipement = lstEq;
            tempsDeRecharge = recharge;
        }

        public void vendreUnObjet()
        { 
            return;
        }

        public void AcheterUnObjet()
        { 
            return;
        }

        public void afficherCaracteristiques()
        { 
            return;
        }
    }
}
