using Combaxe___New.classes.abstraites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Equipement
    {
        public int IdEquipement;
        public Modele Modele;
        public string Nom;
        public string ImageUrl;
        public double Prix;
        public int DegatMin;
        public int DegatMax;
        public int Quantite;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Equipement()
        {
            IdEquipement = 0;
            Modele = null;
            Nom = "";
            ImageUrl = "";
            Prix = 0;
            DegatMin = 0;
            DegatMax = 0;
            Quantite = 0;
        }

        /// <summary>
        /// Constructeur paramétré  - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de l'équipement</param>
        /// <param name="n">nom de l'équipement</param>
        /// <param name="uri">url de l'image</param>
        /// <param name="pr">prix de l'équipement</param>
        /// <param name="min">degatMinimum</param>
        /// <param name="max">degatMaximum</param>
        public Equipement(int id, Modele m, string n, string uri, double pr, int min, int max, int q)
        {
            IdEquipement = id;
            Modele = m;
            Nom = n;
            ImageUrl = uri;
            Prix = pr;
            DegatMin = min;
            DegatMax = max;
            Quantite = q;
        }
    }
}
