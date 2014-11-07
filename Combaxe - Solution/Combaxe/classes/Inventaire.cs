using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Inventaire
    {
        public int idInventaire { get; set; }
        public double argent { get; set; }
        public List<Equipement> listeEquipement { get; set; }
        public List<Equipement> listeEquipementUtilise { get; set; }
        public List<Consommation> listeConsommation { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Inventaire()
        {
            idInventaire = 0;
            argent = 0;
            listeEquipement = null;
            listeEquipementUtilise  = null;
            listeConsommation = null;
        }

        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de l'inventaire</param>
        /// <param name="or">l'argent relié à l'inventaire</param>
        /// <param name="lstEq">la liste d'équipement de l'inventaire</param>
        /// <param name="lstEqUt">la list d'équipement utilisé dans l'inventaire</param>
        public Inventaire(int id, double or, List<Equipement> lstEq, List<Equipement> lstEqUt, List<Consommation> lstCons)
        {
            idInventaire = id;
            argent = or;
            listeEquipement = lstEq;
            listeEquipementUtilise = lstEqUt;
            listeConsommation = lstCons;
        }

        /// <summary>
        /// Méthode pour modifier l'argent de l'inventaire - Anthony Gauthier 02/10/2014
        /// </summary>
        public void ModifierArgent()
        {
            return;
        }

        /// <summary>
        /// Méthode pour ajouter une pièce d'équipement à l'inventaire - Anthony Gauthier 02/10/2014
        /// </summary>
        public void AjouterEquipement()
        { 
            return;
        }

        /// <summary>
        /// Méthode pour modifier la quantité d'un équipement de l'inventaire - Anthony Gauthier 02/10/2014
        /// </summary>
        public void ModifierQuantite()
        { 
            return;
        }
    }
}
