using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Guerrier : Profession
    {
        List<Competence> listeCompetence;

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Guerrier() :base ()
        {
            listeCompetence = null;
        }

        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de la profession</param>
        /// <param name="n">nom de la profession</param>
        /// <param name="image">image du guerrier</param>
        /// <param name="desc">description du guerrier</param>
        /// <param name="lstComp">liste de compétence du guerrier</param>
        public Guerrier(int id, string n, string image, string desc, List<Competence> lstComp) 
            : base(id,n,image,desc)
        {
            listeCompetence = lstComp;
        }
    }
}
