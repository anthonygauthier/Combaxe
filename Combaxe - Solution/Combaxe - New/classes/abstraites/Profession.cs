using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;

namespace Combaxe___New.classes
{
    public class Profession
    {
        public int IdProfession { get; set; }
        public string Nom { get; set; }
        public BitmapImage Image { get; set; }
        public string Description { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Profession()
        {
            IdProfession = 0;
            Nom = "";
            Image = null;
            Description = "";
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
            IdProfession = id;
            Nom = n;
            Image = new BitmapImage(new Uri(image, UriKind.RelativeOrAbsolute));
            Description = desc;
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
