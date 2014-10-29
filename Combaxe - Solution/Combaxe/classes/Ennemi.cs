using Combaxe___New.classes.services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Combaxe___New.écrans;
using Combaxe___New.classes.abstraites;

namespace Combaxe___New.classes
{
    public class Ennemi : Unite
    {
        public int IdEnnemi { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Ennemi() : base()
        {
            IdEnnemi = 0;
        }

        /// <summary>
        /// Constructeur paramétrés - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de l'ennemi</param>
        /// <param name="niv">niveau de l'ennemi</param>
        /// <param name="url">url de l'image</param>
        /// <param name="n">nom de l'ennemi</param>
        /// <param name="lstCar">list des caractéristiques de l'ennemi</param>
        public Ennemi(int id, int niv, string lien, string n, List<Caracteristique> lstCar, List<Competence> lstComp)
            : base(n, niv, lien, lstCar, lstComp)
        {
            IdEnnemi = id;
        }

        /// <summary>
        /// Fonction qui définit si un ennemi est un boss - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <returns>valeur booléenne (true/false (1,0))</returns>
        public bool estBoss()
        { 
            return false;
        }

        /// <summary>
        /// Définit le butin donné par l'ennemi - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <returns>Le nombre d'or donné par l'ennemi</returns>
        public int butinDonne()
        { 
            return 0;
        }

        /// <summary>
        /// Fonction qui choisi un ennemi aléatoirement - William Themens
        /// </summary>
        /// <returns></returns>
        public void ennemiAleatoire()
        {
            EnnemiService ennemiService = new EnnemiService();
            List<string>[] tousEnnemi;
            tousEnnemi = ennemiService.RetrieveIdTousEnnemis();


            Random aleatoire = new Random();
            int idEnnemiAleatoire = aleatoire.Next(0, tousEnnemi.Count());
            Ennemi ennemi;
            ennemi = ennemiService.RetrieveInfoEnnemi(tousEnnemi[idEnnemiAleatoire][0]);

            VarGlobales.Ennemi = ennemi;
        }
    }
}
