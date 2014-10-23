﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Personnage
    {
        public int IdPersonnage { get; set; }
        public string Nom { get; set; }
        public int Niveau { get; set; }
        public int Experience { get; set; }
        public string ImageUrl { get; set; }
        public List<Caracteristique> ListeCaracteristique { get; set; }



        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Personnage()
        {
            IdPersonnage = 0;
            Nom = "";
            Niveau = 0;
            Experience = 0;
            ImageUrl = "";
            ListeCaracteristique = null;
        }

        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id du personnage</param>
        /// <param name="n">nom du personnage</param>
        /// <param name="niv">niveau du personage</param>
        /// <param name="xp">expérience du personnage</param>
        /// <param name="image">url de l'image du personnage</param>
        /// <param name="lstCar">list de caractéristiques du personnage</param>
        public Personnage(int id, string n, int niv, int xp, string image, List<Caracteristique> lstCar)
        {

            IdPersonnage = id;
            Nom = n;
            Niveau = niv;
            Experience = xp;
            ImageUrl = image;
            ListeCaracteristique = lstCar;
        }

        /// <summary>
        /// Méthode pour supprimer un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Supprimer()
        { 
            // à faire tommy
            return;
        }

        /// <summary>
        /// Méthode pour modifier un personage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Modifier()
        { 
            return;
        }

        /// <summary>
        /// Méthode pour monter le niveau d'un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void MonterNiveau()
        { 
            return;
        }

        /// <summary>
        ///  Méthode pour faire équiper une item à un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Equiper()
        {
            return;
        }

        /// <summary>
        /// Méthode pour faire déséquipper un item à un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Desequiper()
        { 
            return;
        }

        public void Deconnexion()
        {
            this.IdPersonnage = 0;
            this.Nom = "";
            this.Niveau = 0;
            this.Experience = 0;
            this.ImageUrl = "";
            this.ListeCaracteristique = null;
        }
    }
}
