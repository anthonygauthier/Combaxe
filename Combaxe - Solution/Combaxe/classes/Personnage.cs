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
using System.Windows.Threading;

namespace Combaxe___New.classes
{
    public class Personnage : Unite
    {
        public int IdPersonnage { get; set; }
        public int IdCampagne { get; set; }
        public int Experience { get; set; }
        public int Vie { get; set; }
        public int Energie { get; set; }
        public Profession profession { get; set; }
        public int VieMaximale { get; set; }
        public int EnergieMaximale { get; set; }
        public int ExperienceMaximale { get; set; }

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
            VarGlobales.HeureConnexion = DateTime.Now;
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
        public Personnage(int id, string n, int niv, int xp, int hp, int mana, string lien, List<Caracteristique> lstCar, Profession prof, List<Competence> lstComp, Inventaire inv)
            : base(n,niv,lien,lstCar,lstComp, inv)
        {

            IdPersonnage = id;
            Experience = xp;
            Vie = hp;
            Energie = mana;
            profession = prof;
            //Vie, Énergie maximale et Expérience maximum - Anthony Gauthier 30/10/2014
            VieMaximale = Convert.ToInt32(((lstCar[(int)Caracteristiques.Vie].Valeur+VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vie].Valeur)*20)/3.1416);
            EnergieMaximale = Convert.ToInt32(((lstCar[(int)Caracteristiques.Energie].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Energie].Valeur) * 10) / 3.1416);
            ExperienceMaximale = (int)((((this.Niveau * 10) * (this.Niveau * 10) + 10) * 3.1416));
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
            //Partie de la fonction ajouté le 30 octobre 2014 - Anthony Gauthier 30/10/2014
            PersonnageService persoService = new PersonnageService();
            VarGlobales.Personnage.Niveau = VarGlobales.Personnage.Niveau + 1;
            VarGlobales.Personnage.Experience = VarGlobales.Personnage.Experience - VarGlobales.Personnage.ExperienceMaximale;
            VarGlobales.Personnage.ExperienceMaximale = (int)((((this.Niveau * 10) * (this.Niveau * 10) + 10) * 3.1416));

            //Partie de la fonction ajouté le 2 novembre 2014 - Anthony Gauthier 4/11/2014
            persoService.MiseAJourNiveau(); //On augmente le niveau du personnage
            persoService.MiseAJourExperience(); //On met à jour l'expérience du personnage en BD

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
            DateTime moment = DateTime.Now;
            TimeSpan temps = moment - VarGlobales.HeureConnexion;

            if (VarGlobales.Personnage != null)
            {
                StatistiqueService statsService = new StatistiqueService();
                statsService.miseAjourStatistiques("tempsDeJeu = ADDTIME(tempsDeJeu, '" + temps + "')");
            }

            this.IdPersonnage = 0;
            this.Nom = "";
            this.Niveau = 0;
            this.Experience = 0;
            this.Image = null;
            this.ListeCaracteristique = null;
        }

        /// <summary>
        /// Remet la vie et l'énergie du personnage au maximum
        /// </summary>
        public void Regeneration()
        { 
            this.Vie = this.VieMaximale;
            this.Energie = this.EnergieMaximale;
        }

        public void Mort(int nbrTour, DispatcherTimer chrono, int expPerdu)
        {
            PersonnageService persoService = new PersonnageService();
            this.Vie = 0;
            
            if (MessageBox.Show("Combat terminé...\n Vous êtes mort et avez perdu " + expPerdu + " points d'expérience.\n", "Défaite...", MessageBoxButton.OK, MessageBoxImage.Exclamation) == MessageBoxResult.OK)
            {
                Regeneration();
                persoService.MAJVieEnergie(true);
                chrono.Stop();
            }
            
        }

        /// <summary>
        /// Fonction qui vérifie si la vie et l'énergie du personnage est à 100%
        /// </summary>
        /// <returns>Retourne vrai si la vie et l'énergie est à 100%</returns>
        public bool VerifierVieEnergie()
        { 
            if(this.Vie != this.VieMaximale || this.Energie != this.EnergieMaximale)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Fonction qui retourne si l'auberge est active ou non
        /// </summary>
        /// <returns>Si le personnage peut utiliser l'auberge on retourne true</returns>
        public bool VerifierAuberge()
        { 
            if((this.Inventaire.argent > ((this.Niveau) * (this.Niveau))*20) && (this.Vie != this.VieMaximale))
            {
                return true;
            }
            else 
            {
                return false;
            }
        }
    }
}
