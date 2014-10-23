using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public enum Caracteristiques
    {
        Force,
        Defense, 
        Vie, 
        Energie, 
        Vitesse, 
        Rien
    }

    public class Caracteristique
    {
    
        public int idCaracterstique { get; set; }
        public int valeur { get; set; }
        public string nom { get; set; }
        public Caracteristiques CaracteristiqueEnum { get;set;}

        /*private enum cara { force, defense, vie, energie, vitesse, rien };
        private cara uneCaracteristique { get; set; }*/

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Caracteristique()
        { 
            idCaracterstique = 0;
            valeur = 0;
            nom = "";
            

            if (this.nom == "Force")
            {
                CaracteristiqueEnum  =Caracteristiques.Force;
            }
            /*uneCaracteristique = cara.rien;*/

            
        }

        /// <summary>
        /// Constructeur paramétrée - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">le id de la caractéristique</param>
        /// <param name="val">valeur de la caractéristique</param>
        /// <param name="n">nom de la caractéristique</param>
        /// <param name="car">sert à simplifier et repéré plus facilement laquelle caractéristique est traité</param>
        public Caracteristique(int id, int val, string n/*, cara car*/)
        { 
            idCaracterstique = id;
            valeur = val;
            nom = n;
            /*uneCaracteristique = car;*/
        }
    }
}
