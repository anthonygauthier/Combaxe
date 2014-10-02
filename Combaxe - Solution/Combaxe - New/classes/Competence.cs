using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Competence
    {
        private int idCompetence;
        private string nom;
        private int degatMin;
        private int degatMax;
        private int energieUtilise;
        private int tempsRecarge;
        private int tempsEffet;
        private string description;
        private string imageURL;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Competence()
        {
            idCompetence = 0;
            nom = "";
            degatMin = 0;
            degatMax = 0;
            energieUtilise = 0;
            tempsRecarge = 0;
            tempsEffet = 0;
            description = "";
            imageURL = "";
        }

        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de la compétence</param>
        /// <param name="n">nom de la compétence</param>
        /// <param name="dmgMin">dommage minimum (de base)</param>
        /// <param name="dmgMax">dommage maximum (de base)</param>
        /// <param name="energie">energie utilisée par la compétence</param>
        /// <param name="cooldown">temps de recharge de la compétence</param>
        /// <param name="effet">temps de l'effet de la compétence</param>
        /// <param name="desc">description de la compétence</param>
        /// <param name="url">url de l'image de la compétence</param>
        public Competence(int id, string n, int dmgMin, int dmgMax, int energie, int cooldown, int effet, string desc, string url)
        {
            idCompetence = id;
            nom = n;
            degatMin = dmgMin;
            degatMax = dmgMax;
            energieUtilise = energie;
            tempsRecarge = cooldown;
            tempsEffet = effet;
            description = desc;
            imageURL = url;
        }
    }
}
