using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Personnage
    {
        private int idPersonnage;
        private string nom;
        private int niveau;
        private int experience;
        private string imageUrl;
        private List<Caracteristique> listeCaracteristique;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Personnage()
        {
            idPersonnage = 0;
            nom = "";
            niveau = 0;
            experience = 0;
            imageUrl = "";
            listeCaracteristique = null;
        }

        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id du personnage</param>
        /// <param name="n">nom du personnage</param>
        /// <param name="niv">niveau du personage</param>
        /// <param name="xp">expérience du personnage</param>
        /// <param name="image">url de l'image du personnage</param>
        /// <param name="lstCar">list de caractéristiques du personnage</param>
        public Personnage(int id, string n, int niv, int xp, string image, List<Caracteristique> lstCar)
        {
            idPersonnage = id;
            nom = n;
            niveau = niv;
            experience = xp;
            imageUrl = image;
            listeCaracteristique = lstCar;
        }

        /// <summary>
        /// Méthode pour supprimer un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Supprimer()
        { 
            return;
        }

        /// <summary>
        /// Méthode pour modifier un personage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Modifier()
        { 
            return;
        }

        /// <summary>
        /// Méthode pour monter le niveau d'un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void MonterNiveau()
        { 
            return;
        }

        /// <summary>
        ///  Méthode pour faire équiper une item à un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Equiper()
        {
            return;
        }

        /// <summary>
        /// Méthode pour faire déséquipper un item à un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Desequiper()
        { 
            return;
        }
    }
}
