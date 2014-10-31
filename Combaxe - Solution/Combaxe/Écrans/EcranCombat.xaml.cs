﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using Combaxe___New.classes;
using Combaxe___New.classes.services;

namespace Combaxe___New.écrans
{

    
    /// <summary>
    /// Interaction logic for EcranCombat.xaml
    /// </summary>
    public partial class EcranCombat : Window
    {
        public EcranCombat()
        {
            InitializeComponent();
            tempsRecharge = new List<int>();
            chargerEnnemi();
            chargerPersonnage();
            combat = new Combat(VarGlobales.Personnage, VarGlobales.Ennemi);
            chronometreCombat();
            txtbJournalCombat.IsReadOnly = true;
        }

        //On déclare les variables nécéssaires à l'horloge
        DispatcherTimer horloge;
        TimeSpan temps;

        bool boutonClique = false;

        // pour utliser les méthodes de combat, tommy gingras
        Combat combat;
        int nbTour = 0;
        List<int> tempsRecharge = null;
        
                
        //Méthode du bouton pour fuir un combat - Anthony Gauthier 23/10/2014
        private void btnFuir_Click(object sender, RoutedEventArgs e)
        {
            fuiteDuJoueur();
        }

        //Méthode qui affiche tous les actions lorsque le bouton Action est cliqué - Anthony Gauthier 23/10/2014
        private void btnChoisirActions_Click(object sender, RoutedEventArgs e)
        {
            //On affiche les quatres buotons d'actions
            btnAction1.Visibility = Visibility.Visible;
            btnAction2.Visibility = Visibility.Visible;
            btnAction3.Visibility = Visibility.Visible;
            btnAction4.Visibility = Visibility.Visible;
            //tommy gingras
            btnAction1.Content = VarGlobales.Personnage.ListeCompetence[0].Nom;
            btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom;
            btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom;
            btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom;
            btnAction1.ToolTip = afficherTooltip(0);
            btnAction2.ToolTip = afficherTooltip(1);
            btnAction3.ToolTip = afficherTooltip(2);
            btnAction4.ToolTip = afficherTooltip(3);
        }

        //Méthode qui affiche les boutons items lorsque le bouton Items est cliqué - Anthony Gauthier 23/10/2014
        private void btnItems_Click(object sender, RoutedEventArgs e)
        {
            btnAction2.Visibility = Visibility.Visible;

            btnAction2.Content = "";
            btnAction3.Content = "";
            btnAction2.ToolTip = "";
            btnAction3.ToolTip = "";

            btnAction3.Visibility = Visibility.Visible;

            if(btnAction3.Visibility == Visibility.Visible)
            {
                btnAction1.Visibility = Visibility.Hidden;
                btnAction4.Visibility = Visibility.Hidden;
            }
        }


        private void btnAction1_Click(object sender, RoutedEventArgs e)
        {
            //Tommy gingras
            boutonClique = true;
            actionBouton(0); 
            boutonClique = true;
        }

        private void btnAction2_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            //tommy gingras
            actionBouton(1); 
        }

        private void btnAction3_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            //tommy gingras
            actionBouton(2); 
        }

        private void btnAction4_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            //tommy gingras
            actionBouton(3); 
        }
        //Chronomètre de combat - Anthony Gauthier 28/10/2014
        private void chronometreCombat()
        {   
            //On initialise le temps de l'horloge et la progress bar
            temps = TimeSpan.FromSeconds(30);
            pbHorloge.Maximum = temps.TotalSeconds;
            pbHorloge.Value = pbHorloge.Maximum;
            

            horloge = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                txtbHorloge.Text = temps.ToString("%s"); //%s spécifie que nous ne voulons que les secondes qui s'affichent

                //Si l'horloge atteint "0", on le stop
                if (temps == TimeSpan.Zero)
                {
                    ReinitialisationHorloge();
                }
                //Sinon, on ajoute du temps à l'horloge
                else
                {
                    //Dépendemment du nombre de secondes qui sont affiché à l'horloge, la couleur de la progress bar change
                    if(temps == TimeSpan.FromSeconds(15))
                    {
                        pbHorloge.Foreground = Brushes.Yellow;
                    }
                    else if (temps == TimeSpan.FromSeconds(7))
                    {
                        pbHorloge.Foreground = Brushes.Red;
                    }
                    
                    //On ajoute (enlève) le temps à l'horloge puis on modifie la valeur de la progress bar
                    temps = temps.Add(TimeSpan.FromSeconds(-1));
                    pbHorloge.Value = temps.TotalSeconds;

                    //Si un bouton d'action a été cliqué, on réinitialise l'horloge et la progress bar
                    if (boutonClique)
                    {
                        ReinitialisationHorloge();
                    }
                }
            }, Application.Current.Dispatcher);

            horloge.Start();  
        }

        //Méthode qui réinitialise l'holorge - Anthony Gauthier 28/10/2014
        private void ReinitialisationHorloge()
        {
            horloge.Stop();
            temps = TimeSpan.FromSeconds(30);
            pbHorloge.Foreground = Brushes.Green;
            pbHorloge.Value = pbHorloge.Maximum;
            txtbHorloge.Text = temps.ToString("%s");
        }

        /// <summary>
        /// pour mettre les infos d'un personnage, tommy gingras
        /// </summary>
        private void chargerPersonnage()
        {
            this.imgPerso.Source = VarGlobales.Personnage.Image;
            lblNomPerso.Content = VarGlobales.Personnage.Nom;
            lblNiveauPerso.Content = VarGlobales.Personnage.Niveau;
            lblViePerso.Content = VarGlobales.Personnage.Vie.ToString() + "/" + VarGlobales.Personnage.VieMaximale.ToString();
            lblEnergiePerso.Content = VarGlobales.Personnage.Energie.ToString() + "/" + VarGlobales.Personnage.EnergieMaximale.ToString();
            lblExperiencePerso.Content = VarGlobales.Personnage.Experience + "/" + VarGlobales.Personnage.ExperienceMaximale.ToString(); ;
            tempsRecharge.Add(0);
            tempsRecharge.Add(0);
            tempsRecharge.Add(0);
            tempsRecharge.Add(0);
        }

        /// <summary>
        /// Pour mettre les infos d'un ennemi
        /// Fonction qui charge un nouvel ennemi - William Themens
        /// </summary>
        private void chargerEnnemi()
        {
            Ennemi ennemi = new Ennemi();
            ennemi.ennemiAleatoire();
            lblNomEnnemi.Content = VarGlobales.Ennemi.Nom;
            lblNiveauEnnemi.Content = VarGlobales.Ennemi.Niveau;
            lblVieEnnemi.Content = Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416).ToString();
            lblEnergieEnnemi.Content = Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 10) / 3.1416).ToString();
        }

        /// <summary>
        /// pour afficher le tooltip pour une compétence, tommy gingras
        /// </summary>
        /// <param name="num">le numéro du bouton</param>
        /// <returns>un objet de type tooltip</returns>
        private ToolTip afficherTooltip(int num)
        {
            CompetenceService competenceService = new CompetenceService();
            ToolTip toolTip = new ToolTip();
            toolTip.Content = VarGlobales.Personnage.ListeCompetence[num].Nom + "\nType : " + VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence;
            toolTip.Content += "\n" + VarGlobales.Personnage.ListeCompetence[num].Description;
            //if pour le type d'attaque
            //List<string> typesAttaque = competenceService.RetrieveListeTypeCompetence();
            // requête bd pour définir les types de competence
            toolTip.Content += afficherDetailsTooltip(num);
            toolTip.Content += "\nCoût d'énergie : " + VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise;
            toolTip.Content += "\nTemps de recharge : " + VarGlobales.Personnage.ListeCompetence[num].TempsRecarge;

            // on fait calcul valeur 
            // on attribut le bon texte pour le tooltip
            // on retourne la valeur
            return toolTip;
        }

        /// <summary>
        /// Pour afficher les détails d'un bouton, tommy gingras
        /// </summary>
        /// <param name="num">le numéro du bouton</param>
        /// <returns>la description</returns>
        private string afficherDetailsTooltip(int num)
        {
            string content = "";
            
            if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Physique.ToString())
            { // Attaque physique
                // Min dégât + 31.416%/2.2 * points de caractéristique de force
                // Max dégât + 31.416%/2.2 * des points de caractéristique de force
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                content = "\nDégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Defensive.ToString())
            { // Defense
                // point de défense *1.5/3.1416
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                content = "\nRésistance au dégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Magique.ToString())
            { // Magique
                // o	Min = Min dégât pouvoir + 31.416%/2 * des points de caractéristique d’énergie
                // o	Max = Max dégât pouvoir + 31.416%/2 * des points de caractéristique d’énergie

                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                content = "\nDégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Support.ToString())
            { // support
                //((point de caractéristique de vie)*20)/3.1416
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                content = "\nRégénération : " + valeurMin + " - " + valeurMax;
            }
            return content;
        }

        /// <summary>
        /// pour mettre à jour la vie et l'énergie
        /// </summary>
        private void majInterface()
        {
            lblEnergieEnnemi.Content = combat.EnergieEnnemi;
            lblEnergiePerso.Content = combat.EnergiePersonnage + "/" + VarGlobales.Personnage.EnergieMaximale;
            lblVieEnnemi.Content = combat.VieEnnemi;
            lblViePerso.Content = combat.ViePersonnage +"/"+ VarGlobales.Personnage.VieMaximale;
            nbTour++;
            tempsRecharge[0] = 0;
            if (tempsRecharge[1] > 0)
            {
                btnAction2.IsEnabled = false;
                btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom + "\n(" + tempsRecharge[1] + ")";
                tempsRecharge[1] -= 1;
            }
            else
            {
                btnAction2.IsEnabled = true;
                btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom;
            }
            if (tempsRecharge[2] > 0)
            {
                btnAction3.IsEnabled = false;
                btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom + "\n(" + tempsRecharge[2] + ")";
                tempsRecharge[2] -= 1;
            }
            else
            {
                btnAction3.IsEnabled = true;
                btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom;
            }
            if (tempsRecharge[3] > 0)
            {
                btnAction4.IsEnabled = false;
                btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom + "\n(" + tempsRecharge[3] + ")";
                tempsRecharge[3] -= 1;
            }
            else
            {
                btnAction4.IsEnabled = true;
                btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom;
            }
        }

        /// <summary>
        /// Pour effectuer ce que les boutons doivent faire, tommy gingras
        /// </summary>
        /// <param name="num">le id du bouton pour les compétences</param>
        private void actionBouton(int num)
        {
            // on va chercher la bonne compétence la 1
            // on vérifie que l'énergie n'est pas manquante
            bool estUtilisable = combat.VerifierEnergieRestante(VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise, combat.EnergiePersonnage);

            if (estUtilisable && tempsRecharge[num] == 0)
            {
                // on calcul la valeur qui est effectué
                tempsRecharge[num] = VarGlobales.Personnage.ListeCompetence[num].TempsRecarge;
                bool estCritique = false;
                int valMin = VarGlobales.Personnage.ListeCompetence[num].ValeurMin;
                int valMax = VarGlobales.Personnage.ListeCompetence[num].ValeurMax;
                bool cibleEnnemi = true;
                bool esquive = false;

                // on applique la bonne action pour la cible
                combat.cibleValeur(num, ref cibleEnnemi, ref valMin, ref valMax);

                int valeur = combat.CalculValeurCompetence(valMin, valMax, true, ref estCritique);
                if (cibleEnnemi)
                {
                    combat.CalculDegatSubi(ref valeur, false, ref esquive);
                    if (!esquive)
                    {
                        combat.VieEnnemi -= valeur;
                        if(combat.VieEnnemi <= 0)
                        {
                            combat.VieEnnemi = 0;
                        }
                        combat.EnergiePersonnage -= VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise;
                        txtbJournalCombat.Text += VarGlobales.Personnage.Nom + " a utilisé " + VarGlobales.Personnage.ListeCompetence[num].Nom + ", ce qui a infligé " + valeur.ToString() + " dégâts.\n";
                    }
                }
                else
                {
                    combat.ViePersonnage += valeur;
                    combat.EnergiePersonnage -= VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise;
                    txtbJournalCombat.Text += VarGlobales.Personnage.Nom + " a utilisé " + VarGlobales.Personnage.ListeCompetence[num].Nom + ", ce qui le protège de " + valeur.ToString() + ".\n";
                }
                // on vérifie quel est le type de compétence
                majInterface();// mettre à jour l'interface       

                if (combat.VieEnnemi <= 0)
                {
                    int xpGagner = (int)((((VarGlobales.Ennemi.Niveau * 10) * (VarGlobales.Ennemi.Niveau * 10) + 1000) / 31) * 3.1416);

                    txtbJournalCombat.Text += VarGlobales.Ennemi.Nom + " a péri ! en " + nbTour +" tours\n";

                    //On effectue toutes les opérations reliées à l'expérience.
                    ExperienceVictoire(xpGagner);

                    combat.VieEnnemi = 0;
                    MessageBox.Show("Combat terminé, vous avez gagné !\n" + "Victoire! " + xpGagner + " points d'expérience!", "Statut", MessageBoxButton.OK, MessageBoxImage.Information);
                    menuPrincipal();
                }
                
                
            }
            else
            {
                if(!estUtilisable)
                    txtbJournalCombat.Text += "Vous n'avez pas assez d'énergie !\n";
                else
                    txtbJournalCombat.Text += "Vous devez attendre que la compétence se charge !\n";
            }
            txtbJournalCombat.ScrollToEnd();
        }

        /// <summary>
        /// Fonction qui se déclanche lorsque le btnFuite est cliqué
        /// </summary>
        private void fuiteDuJoueur()
        { 
            int vitessePersonnage = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur;
            int vitesseEnnemi = VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur;
            horloge.Stop();
            //Si la vitesse de l'ennemi est plus rapide que celle du joueur, on inflige des dégâts
            if(vitesseEnnemi >= vitessePersonnage)
            {
                PersonnageService personnageService = new PersonnageService();

                int dmgMin = VarGlobales.Ennemi.ListeCompetence[0].ValeurMin;
                int dmgMax = VarGlobales.Ennemi.ListeCompetence[0].ValeurMax;
                Random randDmg = new Random();
                int dommageInflige = randDmg.Next(dmgMin, dmgMax); //On génère le dommage infligé

                personnageService.DommageDeFuite(dommageInflige);
                VarGlobales.Personnage.Vie = VarGlobales.Personnage.Vie - dommageInflige;

                //Si 
                if(VarGlobales.Personnage.Vie <= 0)
                {
                    
                }

                //lblViePerso.Content = VarGlobales.Personnage.Vie + "/" + VarGlobales.Personnage.VieMaximale;
                
            if(MessageBox.Show("Vous fuyez le combat, mais le monstre est plus rapide que vous et a eu le temps de vous attaquer une dernière fois pour " + dommageInflige + " de dégâts.", "Fuite", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK)
                    menuPrincipal();
            }
            else
            {
                if(MessageBox.Show("Vous êtes plus rapide que l'ennemi et fuyez le combat sans problème","Fuite",MessageBoxButton.OK,MessageBoxImage.Information) == MessageBoxResult.OK)
                    menuPrincipal();
            }
        }

        /// <summary>
        /// Fonction qui amène le joueur au menu principal suite à une fuite
        /// </summary>
        private void menuPrincipal()
        {
            var EcranMenuPrincipal = new EcranMenuPrincipal();
            EcranMenuPrincipal.Show();
            this.Close();
        }

        /// <summary>
        /// Fonction activé lorsque le joueur gagne un combat - Augmentation de son expérience - Anthony Gauthier 30/10/2014
        /// </summary>
        private void ExperienceVictoire(int experienceGagner)
        {
            PersonnageService persoService = new PersonnageService();

            //On donne l'expérience au joueur - Anthony Gauthier 30/10/2014
            txtbJournalCombat.Text += "Vous gagnez " + experienceGagner + " points d'expérience!";
            VarGlobales.Personnage.Experience = VarGlobales.Personnage.Experience + experienceGagner;

            //Si l'expérience gagné est plus grande ou égale à l'expérience maximale, on monte de niveau
            if (VarGlobales.Personnage.Experience >= VarGlobales.Personnage.ExperienceMaximale)
            {
                VarGlobales.Personnage.MonterNiveau(experienceGagner);
            }

            persoService.MiseAJourExperience();
            lblExperiencePerso.Content = VarGlobales.Personnage.Experience.ToString() + "/" + VarGlobales.Personnage.ExperienceMaximale.ToString();
        }

        /*/// <summary>
        /// Fonction activée lorsque le joueur perd un combat - Diminution de son expérience - Anthony Gauthier 30/10/2014
        /// </summary>
        private void ExperienceDefaite(int experiencePerdu)
        {
            //On calcule l'expérience perdu - Anthony Gauthier 30/10/2014
            int xpPerdu = (int)(VarGlobales.Personnage.Experience * 0.10);
            ExperienceDefaite(xpPerdu); <---------------CODE POUR LORSQU'IL PERD

            PersonnageService persoService = new PersonnageService();

            //On retire l'expérience au joueur - Anthony Gauthier 30/10/2014
            txtbJournalCombat.Text += "Vous perdez " + experiencePerdu + " points d'expérience...";
            VarGlobales.Personnage.Experience = VarGlobales.Personnage.Experience + experiencePerdu;

            //Si l'expérience perdu est plus petite ou égale à 0, on gèle l'expérience du joueur à 0
            if (VarGlobales.Personnage.Experience <= 0)
            {
                VarGlobales.Personnage.Experience = 0;
            }

            persoService.MiseAJourExperience();
            lblExperiencePerso.Content = VarGlobales.Personnage.Experience.ToString() + "/" + VarGlobales.Personnage.ExperienceMaximale.ToString();
        }*/
    }
}
