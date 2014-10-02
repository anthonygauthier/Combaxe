using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public virtual class Profession
    {
        private int idProfession;
        private string nom;
        private string imageUrl;
        private string description;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Profession()
        {
            idProfession = 0;
            nom = "";
            imageUrl = "";
            description = "";
        }


        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de la profession</param>
        /// <param name="n">nom de la profession</param>
        /// <param name="image">url de l'image de la profession</param>
        /// <param name="desc">description de la profession</param>
        public Profession(int id, string n, string image, string desc)
        {
            idProfession = id;
            nom = n;
            imageUrl = image; 
            description = desc;
        }

        /// <summary>
        /// Méthode pour attribuer les caracteristiques - Anthony Gauthier 02/10/2014
        /// </summary>
        public void AttribuerCaracteristiques()
        {
            return;
        }
    }
}
