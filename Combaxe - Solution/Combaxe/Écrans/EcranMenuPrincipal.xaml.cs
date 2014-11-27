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
using System.Threading;

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
            LoadPersonnage();
            lblAuberge.Content += " ("+montantAuberge.ToString()+" pièces d'or)";
            //On active le bouton taverne dépendemment de la vie et l'énergie actuelle du personnage
            if(VarGlobales.Personnage.VerifierAuberge())
            {
                btnTaverne.IsEnabled = true;
            }
            else
            {
                btnTaverne.IsEnabled = false;
                lblAuberge.Foreground = Brushes.Gray;
            }
        }

        DispatcherTimer horloge;
        DispatcherTimer clockPerso;
        TimeSpan temps;
        int montantAuberge = ((VarGlobales.Personnage.Niveau) * (VarGlobales.Personnage.Niveau)) * (20);

        /// <summary>
        /// Méthode qui charge les informations du personnage - Anthony Gauthier 25/11/2014
        /// </summary>
        private void LoadPersonnage()
        { 
            lblNomPerso.Content = VarGlobales.Personnage.Nom;
            lblNiveau.Content = VarGlobales.Personnage.Niveau;
            lblProfession.Content = VarGlobales.Personnage.profession.Nom;
            lblVie.Content = "Points de vie (PV): " + VarGlobales.Personnage.Vie + "/" + VarGlobales.Personnage.VieMaximale;
            lblEnergie.Content = "Points d'énergie (PE): " + VarGlobales.Personnage.Energie + "/" + VarGlobales.Personnage.EnergieMaximale;
        }

        //Méthode du bouton Combat - Anthony Gauthier 23/10/2014
        private void btnCombat_Click(object sender, RoutedEventArgs e)
        {
            btnCampagne.Visibility = Visibility.Visible;
            btnPartieRapide.Visibility = Visibility.Visible;
            btnCombat.Visibility = Visibility.Hidden;
        }

        //Méthode du bouton Supprimer personnage - Anthony Gauthier 23/10/2014
        private void btnSupprimerPerso_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.ChoixPersoFait = false;
            VarGlobales.Retour = false;
            VarGlobales.Personnage.Supprimer();
            /* on vérifie si il reste de joueurs */
            PersonnageService personnageService = new PersonnageService();
            List<Personnage> personnages = personnageService.RetrieveInfoPerso();
            if (personnages == null)
            {
                var creationPerso = new EcranCreationPersonnage();
                VarGlobales.aPersonnage = false;
                creationPerso.Show();
                this.Close();
            }
            else
            {
                var choixPerso = new EcranChangementPerso();
                choixPerso.Show();

                this.Opacity = 0.5;
                this.IsEnabled = false;
                this.Focusable = false;
                //Si le jeu n'est pas fullscreen
                if (this.WindowStyle != WindowStyle.None)
                {
                    this.WindowStyle = WindowStyle.None;
                    this.ResizeMode = ResizeMode.NoResize;
                }

                //On initialise un timer égal à celui du progress bar de l'écran de repos pour déterminer quand nous allons rendre la fenêtre utilisable à nouveau
                temps = TimeSpan.FromSeconds(99999);

                clockPerso = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
                {
                    //On enleve du temps au timer
                    temps = temps.Add(TimeSpan.FromSeconds(-1));

                    if (VarGlobales.ChoixPersoFait == true)
                    {
                        clockPerso.Stop();
                        this.Close();
                    }
                    else if (VarGlobales.Retour == true)
                    {
                        var connexion = new MainWindow();
                        connexion.Show();
                        clockPerso.Stop();
                        this.Close();
                    }
                }, Application.Current.Dispatcher);

                clockPerso.Start();
            }
        }

        //Méthode du bouton Campagne - Anthony Gauthier 23/10/2014
        private void btnCampagne_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.campagne = true;
            ouvrirEcranCombat();
        }

        //Méthode du bouton Partie Rapide - Anthony Gauthier 23/10/2014
        private void btnPartieRapide_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.campagne = false;
            ouvrirEcranCombat();
        }

        //Méthode pour afficher l'écran de combat - Anthony Gauthier 23/10/2014
        private void ouvrirEcranCombat()
        {
            var EcranCombat = new EcranCombat();
            EcranCombat.Show();
            this.Close();
        }

        //Méthode pour afficher l'écran de changement de personnage - Anthony Gauthier 23/10/2014
        private void btnChangerPerso_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.EstConnecte = true;
            
            var choixPerso = new EcranChangementPerso();
            choixPerso.Show();

            this.Opacity = 0.5;
            this.IsEnabled = false;
            this.Focusable = false;
            //Si le jeu n'est pas fullscreen
            if (this.WindowStyle != WindowStyle.None)
            {
                this.WindowStyle = WindowStyle.None;
                this.ResizeMode = ResizeMode.NoResize;
            }

            //On initialise un timer égal à celui du progress bar de l'écran de repos pour déterminer quand nous allons rendre la fenêtre utilisable à nouveau
            temps = TimeSpan.FromSeconds(99999);

            clockPerso = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                //On enleve du temps au timer
                temps = temps.Add(TimeSpan.FromSeconds(-1));

                if (VarGlobales.ChoixPersoFait == true)
                {
                    clockPerso.Stop();
                    this.Close();
                }
                else if (VarGlobales.Retour == true)
                {
                    var connexion = new MainWindow();
                    connexion.Show();
                    clockPerso.Stop();
                    this.Close();
                }
            }, Application.Current.Dispatcher);

            clockPerso.Start();
        }

        //Méthode pour se déconnecter - Anthony Gauthier 23/10/2014
        private void btnDeconnexion_Click(object sender, RoutedEventArgs e)
        {
            var connexion = new MainWindow();
            connexion.Show();
            this.Close();
            VarGlobales.Joueur.Deconnexion();
        }

        //Méthode pour aller à l'inventaire - Anthony Gauthier 23/10/2014
        private void btnInventaire_Click_1(object sender, RoutedEventArgs e)
        {
            var ecranInventaireMagasin = new EcranInventaireMagasin();
            ecranInventaireMagasin.Show();
            this.Close();
        }

        //Méthode pour aller voir les statistiques - Anthony Gauthier 23/10/2014
        private void btnStatistiques_Click_1(object sender, RoutedEventArgs e)
        {
            var ecranStats = new EcranStatistiques();
            ecranStats.Show();
            this.Close();
        }

        //Méthode pour aller à la taverne - Anthony Gauthier 30/10/2014
        private void btnTaverne_Click(object sender, RoutedEventArgs e)
        {
            var Repos = new EcranRepos();
            PersonnageService persoService = new PersonnageService();
            InventaireService inventaireServ = new InventaireService();

            persoService.RemiseDeVieEtEnergie();

            VarGlobales.Personnage.Inventaire.argent -= montantAuberge;

            inventaireServ.MAJArgent();

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
                    MajBarreViePerso((int)(brdMaxWidth.ActualWidth));
                    MajBarreEnergiePerso((int)(brdMaxWidth.ActualWidth));

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

        /// <summary>
        /// Quand le joueur se fait attaquer, sa barre de vie se réduit - Anthony Gauthier 04/11/2014
        /// </summary>
        private void MajBarreViePerso(int max)
        {
            int poucentageVie = (VarGlobales.Personnage.Vie * 100) / VarGlobales.Personnage.VieMaximale;

            int widthAjuste = max - ((max * poucentageVie) / 100);
            brdViePerso.Margin = new Thickness(5, 5, widthAjuste, 5);
            MajCouleurBarreVie(brdViePerso, VarGlobales.Personnage);
        }

        /// <summary>
        /// Quand le joueur utilise un sort, sa barre d'énergie se réduit - Anthony Gauthier 05/11/2014
        /// </summary>
        private void MajBarreEnergiePerso(int max)
        {
            int pourcentageEnergie = (VarGlobales.Personnage.Energie * 100) / VarGlobales.Personnage.EnergieMaximale;

            int widthAjuste = max - ((max * pourcentageEnergie) / 100);
            brdEnergiePerso.Margin = new Thickness(5, 5, widthAjuste, 5);
        }

        /// <summary>
        /// Met à jour la couleur des barres de vie de l'ennemi et du perso - Anthony Gauthier 05/11/2014 
        /// </summary>
        /// <param name="uneBordure">Recoit la barre a modifier</param>
        private void MajCouleurBarreVie(Border uneBordure, object unObjet)
        {
            //Si l'objet passé est un personnage, on met à jour la couleur de la barre de vie du personnage
            if (unObjet.GetType() == VarGlobales.Personnage.GetType())
            {
                //Si la vie du personnage est inférieur ou égale à 50%
                if (VarGlobales.Personnage.Vie <= VarGlobales.Personnage.VieMaximale * 0.5)
                {
                    if (VarGlobales.Personnage.Vie <= VarGlobales.Personnage.VieMaximale * 0.25)
                    {
                        uneBordure.Background = Brushes.Red;
                    }
                    else
                    {
                        uneBordure.Background = Brushes.Yellow;
                    }
                }
                else if (VarGlobales.Personnage.Vie > VarGlobales.Personnage.VieMaximale * 0.50)
                {
                    uneBordure.Background = Brushes.Green;
                }
            }
        }

        private void brdMaxWidth_Loaded(object sender, RoutedEventArgs e)
        {
            MajBarreViePerso((int)(brdMaxWidth.ActualWidth));
            MajBarreEnergiePerso((int)(brdMaxWidth.ActualWidth));
        }

        private void btnAideMenuPrincipal_Click(object sender, RoutedEventArgs e)
        {
            this.IsEnabled = false;
            if(MessageBox.Show(
            "Bouton Combat"
            + "\nLorsque vous cliquez sur le bouton Combat, deux nouveaux boutons s'affichent, soit 'Campange' et 'Partie Rapide'."
            + "Un combat en mode campagne est un combat qui vous fait progresser au travers de l'histoire du jeu. Un combat en partie rapide fait simplement avancer votre personnage en général (niveau, items, etc.)"
            + "\n\n Bouton Inventaire et Magasin"
            + "\n Le bouton 'Inventaire et magasin' vous affiche l'inventaire de votre personnage et le magasin qui vous est offert."
            + "\n\n Bouton Statistiques"
            + "\n Le bouton 'Statistiques' vous affiche les statistiques reliées à votre personnage (temps de jeu, nombre de combat, nombre de victoire, etc.)"
            + "\n\n Bouton Auberge"
            + "\n Le bouton 'Auberge' (lorsqu'il est actif) vous permet de regénérer l'énergie et la vie de votre personnage, à un coût."
            + "\n\n Bouton Supprimer ce personnage"
            + "\n Le bouton 'Supprimer ce personnage' supprime tout simplement votre personnage."
            + "\n\n Bouton Changer de personnage"
            + "\n Le bouton 'Changer de personnage' affiche l'écran de changement de personnage et vous permet de changer de personnage sur le champ, ou d'en créer un nouveau."
            + "\n\n Bouton Déconnexion"
            + "\n Le bouton 'Déconnexion' vous déconnecte et vous ammène à l'écran de connexion.", "Aide Menu Principal", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK)
            {
                this.IsEnabled = true;
            }
        }

        /// <summary>
        /// Fonction qui ajoute la couleur dans le texte des bouton, elle fait ce que le style fait avec les autres boutons
        /// Mais qui n'était pas possible avec ces boutons dotés de StackPanel comme contenu.
        /// </summary>
        /// <param name="sender">Objet reçu par la fonction (dans ce cas, un label)</param>
        /// <param name="e"></param>
        private void Label_MouseEnter(object sender, MouseEventArgs e)
        {
            if(sender == btnSupprimerPerso) 
                lblSupprimer.Foreground = Brushes.LightBlue;
            else if(sender == btnChangerPerso)
                lblChangerPerso.Foreground = Brushes.LightBlue;
            else if (sender == btnCombat)
                lblCombat.Foreground = Brushes.LightBlue;
            else if (sender == btnStatistiques)
                lblStats.Foreground = Brushes.LightBlue;
            else if (sender == btnInventaire)
                lblInventaire.Foreground = Brushes.LightBlue;
            else if (sender == btnTaverne)
                lblAuberge.Foreground = Brushes.LightBlue;
            else if (sender == btnDeconnexion)
                lblDeconnexion.Foreground = Brushes.LightBlue;
        }

        /// <summary>
        /// Fonction qui enlève la couleur dans le texte des bouton, elle fait ce que le style fait avec les autres boutons
        /// Mais qui n'était pas possible avec ces boutons dotés de StackPanel comme contenu.
        /// </summary>
        /// <param name="sender">Objet reçu par la fonction (dans ce cas, un label)</param>
        /// <param name="e"></param>
        private void Label_MouseLeave(object sender, MouseEventArgs e)
        {
            if (sender == btnSupprimerPerso)
                lblSupprimer.Foreground = Brushes.White;
            else if (sender == btnChangerPerso)
                lblChangerPerso.Foreground = Brushes.White;
            else if (sender == btnCombat)
                lblCombat.Foreground = Brushes.White;
            else if (sender == btnStatistiques)
                lblStats.Foreground = Brushes.White;
            else if (sender == btnInventaire)
                lblInventaire.Foreground = Brushes.White;
            else if (sender == btnTaverne)
                lblAuberge.Foreground = Brushes.White;
            else if (sender == btnDeconnexion)
                lblDeconnexion.Foreground = Brushes.White;
        }
    }
}
