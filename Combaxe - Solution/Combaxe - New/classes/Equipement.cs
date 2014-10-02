using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Equipement
    {
        private int idEquipement;
        private string nom;
        private string imageUrl;
        private double prix;
        private int degatMin;
        private int degatMax;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Equipement()
        {
            idEquipement = 0;
            nom = "";
            imageUrl = "";
            prix = 0;
            degatMin = 0;
            degatMax = 0;
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
        public Equipement(int id, string n, string uri, double pr, int min, int max)
        {
            idEquipement = id;
            nom = n;
            imageUrl = uri;
            prix = pr;
            degatMin = min;
            degatMax = max;
        }
    }
}
