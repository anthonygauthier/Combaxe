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
            IdCaracterstique = id;
            Valeur = val;
            Nom = nom;
            /* Pour l'enum */
            switch (this.Nom)
            {
                case "Force":
                    CaracteristiqueEnum = Caracteristiques.Force;
                    break;
                case "Vie":
                    CaracteristiqueEnum = Caracteristiques.Vie;
                    break;
                case "Défense":
                    CaracteristiqueEnum = Caracteristiques.Defense;
                    break;
                case "Énergie":
                    CaracteristiqueEnum = Caracteristiques.Energie;
                    break;
                case "Vitesse":
                    CaracteristiqueEnum = Caracteristiques.Vitesse;
                    break;
            }   
        }
    }
}
