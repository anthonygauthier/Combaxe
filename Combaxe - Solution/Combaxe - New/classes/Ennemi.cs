using Combaxe___New.classes.services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Combaxe___New.écrans;

namespace Combaxe___New.classes
{
    public class Ennemi
    {
        public int idEnnemi { get; set; }
        public string imageUrl { get; set; }
        public int niveau { get; set; }
        public string nom { get; set; }
        public List<Caracteristique> listeCaracteristique { get; set; }
        public List<Competence> listeCompetence { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Ennemi()
        {
            idEnnemi = 0;
            imageUrl = "";
            niveau = 0;
            nom = "";
            listeCaracteristique = null;
            listeCompetence = null;
        }

        /// <summary>
        /// Constructeur paramétrés - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de l'ennemi</param>
        /// <param name="niv">niveau de l'ennemi</param>
        /// <param name="url">url de l'image</param>
        /// <param name="n">nom de l'ennemi</param>
        /// <param name="lstCar">list des caractéristiques de l'ennemi</param>
        public Ennemi(int id, int niv, string url, string n, List<Caracteristique> lstCar, List<Competence> lstComp)
        {
            idEnnemi = id;
            niveau = niv;
            imageUrl = url;
            nom = n;
            listeCaracteristique = lstCar;
            listeCompetence = lstComp;
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
        public Ennemi ennemiAleatoire()
        {
            EnnemiService ennemiService = new EnnemiService();
            List<string>[] tousEnnemi;
            tousEnnemi = ennemiService.RetrieveIdTousEnnemis();


            Random aleatoire = new Random();
            int idEnnemiAleatoire = aleatoire.Next(0, tousEnnemi.Count());
            Ennemi ennemi;
            ennemi = ennemiService.RetrieveInfoEnnemi(tousEnnemi[idEnnemiAleatoire][0]);

            return ennemi;
        }

        public void AfficherEnnemi()
        {
            Ennemi ennemi;
            ennemi = ennemiAleatoire();

        }
    }
}
