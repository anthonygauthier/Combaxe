using System;
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
            chargerEnnemi();
            chargerPersonnage();
            chronometreCombat();
        }

        //On déclare les variables nécéssaires à l'horloge
        DispatcherTimer horloge;
        TimeSpan temps;

        bool boutonClique = false;

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
            boutonClique = true;
        }

        private void btnAction2_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
        }

        private void btnAction3_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
        }

        private void btnAction4_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
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

        private void chargerPersonnage()
        {
            this.imgPerso.Source = VarGlobales.Personnage.Image;
            lblNomPerso.Content = VarGlobales.Personnage.Nom;
            lblNiveauPerso.Content = VarGlobales.Personnage.Niveau;
            lblViePerso.Content = Convert.ToInt32((VarGlobales.Personnage.ListeCaracteristique[2].Valeur * 20) / 3.1416).ToString();
            lblEnergiePerso.Content = Convert.ToInt32((VarGlobales.Personnage.ListeCaracteristique[3].Valeur * 10) / 3.1416).ToString();

           
        }

        private void chargerEnnemi()
        {
            Ennemi ennemi = new Ennemi();
            ennemi.ennemiAleatoire();
            lblNomEnnemi.Content = VarGlobales.Ennemi.Nom;
            lblNiveauEnnemi.Content = VarGlobales.Ennemi.Niveau;
            lblVieEnnemi.Content = Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[1].Valeur * 20) / 3.1416).ToString();
            lblEnergieEnnemi.Content = Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[3].Valeur * 10) / 3.1416).ToString();
        }

        /// <summary>
        /// pour afficher le tooltip pour une compétence
        /// </summary>
        private ToolTip afficherTooltip(int num)
        {
            CompetenceService competenceService = new CompetenceService();
            ToolTip toolTip = new ToolTip();
            toolTip.Content = VarGlobales.Personnage.ListeCompetence[num].Nom + "\nType : " + VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence;
            toolTip.Content += "\n" + VarGlobales.Personnage.ListeCompetence[num].Description;
            //if pour le type d'attaque
            //List<string> typesAttaque = competenceService.RetrieveListeTypeCompetence();
            // requête bd pour définir les types de competence
            if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Physique.ToString())
            { // Attaque physique
                // Min dégât + 31.416%/2.2 * points de caractéristique de force
                // Max dégât + 31.416%/2.2 * des points de caractéristique de force
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                toolTip.Content += "\nDégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Defensive.ToString())
            { // Defense
                // point de défense *1.5/3.1416
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                toolTip.Content += "\nRésistance au dégât : " + valeurMin + " - " + valeurMax;                
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Magique.ToString())
            { // Magique
                // o	Min = Min dégât pouvoir + 31.416%/2 * des points de caractéristique d’énergie
                // o	Max = Max dégât pouvoir + 31.416%/2 * des points de caractéristique d’énergie

                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                toolTip.Content += "\nDégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Support.ToString())
            { // support
                //((point de caractéristique de vie)*20)/3.1416
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                toolTip.Content += "\nRégénération : " + valeurMin + " - " + valeurMax;
            }

            toolTip.Content += "\nCoût d'énergie : " + VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise;
            toolTip.Content += "\nTemps de recharge : " + VarGlobales.Personnage.ListeCompetence[num].TempsRecarge;

            // on fait calcul valeur 
            // on attribut le bon texte pour le tooltip
            // on retourne la valeur
            return toolTip;
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
                
                if(MessageBox.Show("Vous fuyez le combat, mais le monstre est plus rapide que vous et a eu le temps de vous attaquer une dernière fois pour " + dommageInflige + " de dégâts.", "Fuite", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK)
                    menuPrincipalFuite();
            }
            else
            {
                if(MessageBox.Show("Vous êtes plus rapide que l'ennemi et fuyez le combat sans problème","Fuite",MessageBoxButton.OK,MessageBoxImage.Information) == MessageBoxResult.OK)
                    menuPrincipalFuite();
            }
        }

        /// <summary>
        /// Fonction qui amène le joueur au menu principal suite à une fuite
        /// </summary>
        private void menuPrincipalFuite()
        {
            var EcranMenuPrincipal = new EcranMenuPrincipal();
            EcranMenuPrincipal.Show();
            this.Close();
        }
    }
}
