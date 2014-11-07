using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public enum Caracteristiques : int
    {
        Force,
        Defense,
        Vie, 
        Energie, 
        Vitesse
    }

    public class Caracteristique
    {
    
        public int IdCaracterstique { get; set; }
        public int Valeur { get; set; }
        public string Nom { get; set; }
        public Caracteristiques CaracteristiqueEnum { get;set;}

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Caracteristique()
        { 
            IdCaracterstique = 0;
            Valeur = 0;
            Nom = "";   
        }

        /// <summary>
        /// Constructeur paramétrée - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">le id de la caractéristique</param>
        /// <param name="val">valeur de la caractéristique</param>
        /// <param name="n">nom de la caractéristique</param>
        /// <param name="car">sert à simplifier et repéré plus facilement laquelle caractéristique est traité</param>
        public Caracteristique(int id, int val, string nom)
        { 
            /* Tommy Gingras */
            IdCaracterstique = id;
            Valeur = val;
            Nom = nom;
            /* Pour l'enum */
            if(this.Nom == Caracteristiques.Force.ToString())
                CaracteristiqueEnum = Caracteristiques.Force;
            else if(this.Nom == Caracteristiques.Vie.ToString())
                CaracteristiqueEnum = Caracteristiques.Vie;
            else if(this.Nom == Caracteristiques.Defense.ToString())
                CaracteristiqueEnum = Caracteristiques.Defense;
            else if(this.Nom == Caracteristiques.Energie.ToString())
                CaracteristiqueEnum = Caracteristiques.Energie;
            else if(this.Nom == Caracteristiques.Vitesse.ToString())
                CaracteristiqueEnum = Caracteristiques.Vitesse;
        }
    }
}
