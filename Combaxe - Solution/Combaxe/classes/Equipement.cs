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
        public int IdEquipementModele;
        public Modele Modele;
        public string Nom;
        public string ImageUrl;
        public double Prix;
        public int DegatMin;
        public int DegatMax;
        public List<Caracteristique> lstCaracteristique;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Equipement()
        {
            IdEquipement = 0;
            IdEquipementModele = 0;
            Modele = null;
            Nom = "";
            ImageUrl = "";
            Prix = 0;
            DegatMin = 0;
            DegatMax = 0;
            lstCaracteristique = new List<Caracteristique>();
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
        public Equipement(int id, int idM, Modele m, string n, string uri, double pr, int min, int max, List<Caracteristique> c)
        {
            IdEquipement = id;
            IdEquipementModele = idM;
            Modele = m;
            Nom = n;
            ImageUrl = uri;
            Prix = pr;
            DegatMin = min;
            DegatMax = max;
            lstCaracteristique = c;
        }

        /// <summary>
        /// Constructeur paramétré si l'équipement n'est pas mit en jeu - William Themens
        /// </summary>
        /// <param name="n">nom de l'équipement</param>
        /// <param name="uri">url de l'image</param>
        /// <param name="pr">prix de l'équipement</param>
        /// <param name="min">degatMinimum</param>
        /// <param name="max">degatMaximum</param>
        public Equipement(int idM, Modele m, string n, string uri, double pr, int min, int max, List<Caracteristique> c)
        {
            IdEquipementModele = idM;
            Modele = m;
            Nom = n;
            ImageUrl = uri;
            Prix = pr;
            DegatMin = min;
            DegatMax = max;
            lstCaracteristique = c;
        }
    }
}
