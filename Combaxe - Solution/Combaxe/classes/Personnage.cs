using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Combaxe___New.classes.services;
using Combaxe___New.écrans;
using System.Windows.Media.Imaging;
using Combaxe___New.classes.abstraites;

namespace Combaxe___New.classes
{
    public class Personnage : Unite
    {
        public int IdPersonnage { get; set; }
        public int Experience { get; set; }
        public int Vie { get; set; }
        public int Energie { get; set; }
        public Profession profession { get; set; }
        public int VieMaximale { get; set; }
        public int EnergieMaximale { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Personnage() : base()
        {
            IdPersonnage = 0;
            Experience = 0;
            profession = null;
            Vie = 0;
            Energie = 0;
        }

        /// <summary>
        /// Constructeur paramétré - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id du personnage</param>
        /// <param name="n">nom du personnage</param>
        /// <param name="niv">niveau du personage</param>
        /// <param name="xp">expérience du personnage</param>
        /// <param name="lien">url de l'image du personnage</param>
        /// <param name="lstCar">list de caractéristiques du personnage</param>
        public Personnage(int id, string n, int niv, int xp, int hp, int mana, string lien, List<Caracteristique> lstCar, Profession prof, List<Competence> lstComp)
            : base(n,niv,lien,lstCar,lstComp)
        {

            IdPersonnage = id;
            Experience = xp;
            Vie = hp;
            Energie = mana;
            profession = prof;
            VieMaximale = Convert.ToInt32(((lstCar[(int)Caracteristiques.Vie].Valeur)*20)/3.1416);
            EnergieMaximale = Convert.ToInt32(((lstCar[(int)Caracteristiques.Energie].Valeur) * 10) / 3.1416);
        }

        /// <summary>
        /// Méthode pour supprimer un personnage - Anthony Gauthier 02/10/2014
        /// </summary>
        public void Supprimer()
        { 
            /* FAIT PAR Tommy Gingas */
            //on appel le service qui va supprimer le personnage
            PersonnageService personnageService = new PersonnageService();
            personnageService.desactivePersonnage(this.IdPersonnage);
            MessageBox.Show("Votre personnage "+this.Nom+" a bien été supprimé", "Suppression de personnage", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            // on vide la variable actuelle
            this.IdPersonnage = 0;
            this.Nom = "";
            this.Niveau = 0;
            this.Experience = 0;
            this.Image = null;
            this.ListeCaracteristique = null;
            this.profession = null;
            // si c'est le personnage utilisé on retourne à choisir personnage
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

        /// <summary>
        /// Permet de vider la mémoire de la variable, fait par tommy gingras
        /// </summary>
        public void Deconnexion()
        {
            this.IdPersonnage = 0;
            this.Nom = "";
            this.Niveau = 0;
            this.Experience = 0;
            this.Image = null;
            this.ListeCaracteristique = null;
        }
    }
}
