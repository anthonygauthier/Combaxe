using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{

    public enum TypeCompetence
    {
        Physique,
        Magique,
        Defensive,
        Support
    }

    public class Competence
    {
        public int IdCompetence { get; set; }
        public string Nom { get; set; }
        public int ValeurMin { get; set; }
        public int ValeurMax { get; set; }
        public int EnergieUtilise { get; set; }
        public int TempsRecarge { get; set; }
        public string Description { get; set; }
        public string ImageURL { get; set; }
        public string NomTypeCompetence { get; set; }
        //public Effet Effet { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Competence()
        {
            IdCompetence = 0;
            Nom = "";
            ValeurMin = 0;
            ValeurMax = 0;
            EnergieUtilise = 0;
            TempsRecarge = 0;
            Description = "";
            ImageURL = "";
            NomTypeCompetence = "";
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
        public Competence(int id, string n, int dmgMin, int dmgMax, int energie, int cooldown, string desc, string url, string tCompetence)
        {
            IdCompetence = id;
            Nom = n;
            ValeurMin = dmgMin;
            ValeurMax = dmgMax;
            EnergieUtilise = energie;
            TempsRecarge = cooldown;
            Description = desc;
            ImageURL = url;
            NomTypeCompetence = tCompetence;
        }
    }
}
