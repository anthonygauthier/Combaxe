using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Personnage
    {
        private int _idPersonnage;
        private string _nom;
        private int _niveau;
        private int _experience;
        private string _imageUrl;
        private List<Caracteristique> _listeCaracteristique;

        public string nom
        {
            get { return _nom; }
            set { _nom = value; }
        }

        public int niveau
        {
            get { return _niveau; }
            set { _niveau = value; }
        }

        public string imageUrl
        {
            get { return _imageUrl; }
            set { _imageUrl = value; }
        }

        public int idPersonnage
        {
            get { return _idPersonnage; }
            set { _idPersonnage = value; }
        }



        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Personnage()
        {
            _idPersonnage = 0;
            _nom = "";
            _niveau = 0;
            _experience = 0;
            _imageUrl = "";
            _listeCaracteristique = null;
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
            _idPersonnage = id;
            _nom = n;
            _niveau = niv;
            _experience = xp;
            _imageUrl = image;
            _listeCaracteristique = lstCar;
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
