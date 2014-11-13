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
using Combaxe___New.classes;
using MiniBD;
using System.Text.RegularExpressions;
using Combaxe___New.écrans;
using Combaxe___New.classes.services;
using System.Windows.Media.Animation;
using System.Windows.Threading;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Logique d'interaction pour menuPrincipal.xaml
    /// </summary>
    public partial class EcranMenuPrincipal : Window
    {
    
        public EcranMenuPrincipal()
        {
            InitializeComponent();


            //On active le bouton taverne dépendemment de la vie et l'énergie actuelle du personnage
            if(!VarGlobales.Personnage.VerifierVieEnergie())
            {
                btnTaverne.IsEnabled = false;
            }
            else
            {
                btnTaverne.IsEnabled = true;
            }
        }

        DispatcherTimer horloge;
        TimeSpan temps;

        //Méthode du bouton Combat - Anthony Gauthier 23/10/2014
        private void btnCombat_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            btnCampagne.Visibility = Visibility.Visible;
            btnPartieRapide.Visibility = Visibility.Visible;
            btnCombat.Visibility = Visibility.Hidden;
        }

        //Méthode du bouton Supprimer personnage - Anthony Gauthier 23/10/2014
        private void btnSupprimerPerso_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            VarGlobales.Personnage.Supprimer();
            /* on vérifie si il reste de joueurs */
            PersonnageService personnageService = new PersonnageService();
            List<Personnage> personnages = personnageService.RetrieveInfoPerso();
            if (personnages == null)
            {
                var creationPerso = new EcranCreationPersonnage();
                creationPerso.Show();
                VarGlobales.aPersonnage = false;
                this.Close();
            }
            else
            {
                var pageChangementPerso = new EcranChangementPerso();
                pageChangementPerso.Show();
                this.Close();
            }
        }

        //Méthode du bouton Campagne - Anthony Gauthier 23/10/2014
        private void btnCampagne_Click_1(object sender, RoutedEventArgs e)
        {
            ouvrirEcranCombat();
        }

        //Méthode du bouton Partie Rapide - Anthony Gauthier 23/10/2014
        private void btnPartieRapide_Click_1(object sender, RoutedEventArgs e)
        {
            ouvrirEcranCombat();
        }

        //Méthode pour afficher l'écran de combat - Anthony Gauthier 23/10/2014
        private void ouvrirEcranCombat()
        {
            VarGlobales.playClique();
            var EcranCombat = new EcranCombat();
            EcranCombat.Show();
            this.Close();
        }

        //Méthode pour afficher l'écran de changement de personnage - Anthony Gauthier 23/10/2014
        private void btnChangerPerso_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            var EcranChangementPerso = new EcranChangementPerso();
            EcranChangementPerso.Show();
            VarGlobales.EstConnecte = true;
            this.Close();
        }

        //Méthode pour se déconnecter - Anthony Gauthier 23/10/2014
        private void btnDeconnexion_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            var connexion = new MainWindow();
            connexion.Show();
            this.Close();
            VarGlobales.Joueur.Deconnexion();
        }

        //Méthode pour aller à l'inventaire - Anthony Gauthier 23/10/2014
        private void btnInventaire_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            var ecranInventaireMagasin = new EcranInventaireMagasin();
            ecranInventaireMagasin.Show();
            this.Close();
        }

        //Méthode pour aller voir les statistiques - Anthony Gauthier 23/10/2014
        private void btnStatistiques_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            var ecranStats = new EcranStatistiques();
            ecranStats.Show();
            this.Close();
        }

        //Méthode pour aller à la taverne - Anthony Gauthier 30/10/2014
        private void btnTaverne_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            var Repos = new EcranRepos();
            PersonnageService persoService = new PersonnageService();

            persoService.RemiseDeVieEtEnergie();

            //On remet la vie du personnage au maximum
            VarGlobales.Personnage.Regeneration();

            this.Opacity = 0.5;
            this.IsEnabled = false;
            this.Focusable = false;
            //Si le jeu n'est pas fullscreen
            if(this.WindowStyle != WindowStyle.None)
            {
                this.WindowStyle = WindowStyle.None;
                this.ResizeMode = ResizeMode.NoResize;
            }
            
            //On affiche la progress bar
            Repos.Show();

            //On initialise un timer égal à celui du progress bar de l'écran de repos pour déterminer quand nous allons rendre la fenêtre utilisable à nouveau
            temps = TimeSpan.FromSeconds(6);

            horloge = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                //On enleve du temps au timer
                temps = temps.Add(TimeSpan.FromSeconds(-1));

                if (temps == TimeSpan.FromMilliseconds(0))
                {
                    this.Opacity = 1;
                    this.IsEnabled = true;
                    btnTaverne.IsEnabled = false;

                    if (this.WindowStyle != WindowStyle.None)
                    {
                        this.WindowStyle = WindowStyle.SingleBorderWindow;
                        this.ResizeMode = ResizeMode.CanResize;
                        horloge.Stop();
                    }
                    
                }
            }, Application.Current.Dispatcher);

            horloge.Start();  
        }
    }
}
