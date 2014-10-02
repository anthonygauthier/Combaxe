using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    class Ennemi
    {
        private int idEnnemi;
        private string imageUrl;
        private int niveau;
        private string nom;
        private List<Caracteristique> listeCaracteristique;

        /// <summary>
        /// Constructeur de base
        /// </summary>
        public Ennemi()
        {
            idEnnemi = 0;
            imageUrl = "";
            niveau = 0;
            nom = "";
            listeCaracteristique = null;
        }

        /// <summary>
        /// Constructeur paramétrés
        /// </summary>
        /// <param name="id">id de l'ennemi</param>
        /// <param name="niv">niveau de l'ennemi</param>
        /// <param name="url">url de l'image</param>
        /// <param name="n">nom de l'ennemi</param>
        /// <param name="lstCar">list des caractéristiques de l'ennemi</param>
        public Ennemi(int id, int niv, string url, string n, List<Caracteristique> lstCar)
        {
            idEnnemi = id;
            niveau = niv;
            imageUrl = url;
            nom = n;
            listeCaracteristique = lstCar;
        }

        public bool estBoss()
        { 
            return false;
        }

        public int butinDonne()
        { 
            return 0;
        }
    }
}
