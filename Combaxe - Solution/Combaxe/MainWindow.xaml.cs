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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Combaxe___New.classes;
using Combaxe___New.écrans;
using Combaxe___New.classes.services;
using System.Media;
using System.Windows.Threading;

namespace Combaxe___New
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoadMedias();
        }
        TimeSpan temps;
        DispatcherTimer horloge;

        //Lorsque la page s'initialise, on initie une connexion à la BD - Anthony Gauthier 09/10/2014
        JoueurService joueurService = new JoueurService();

        //Méthode pour se rendre à l'écran de création de compte - Anthony Gauthier 09/10/2014
        private void btnCreerCompte_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            var creationCompte = new EcranCreationCompte();
            creationCompte.Show();
            this.Close();
        }

        //Méthode pour quitter le jeu - Anthony Gauthier 09/10/2014
        private void btnQuitter_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            this.Close();
        }

        //Méthode du bouton pour se connecter - Anthony Gauthier 09/10/2014
        private void btnConnexion_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            btnConnexionActive();
        }

        //Méthode qui effectue la connexion lorsque "Enter" est pressé 24/10/2014
        private void btnConnexion_KeyUp_1(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                btnConnexionActive();
                e.Handled = true;
            }
        }

        //Méthode pour se connecter - Anthony Gauthier 09/10/2014
        private bool connexionCombaxe()
        {
            List<string>[] tabJoueur;

            tabJoueur = joueurService.RetrieveInfoJoueur(txtbNomUsager.Text, pwdbMdp.Password);

            //Si la requête n'a rien retourné, l'utilisateur n'a pas de compte - Anthony Gauthier 09/10/2014
            if (tabJoueur[0][0].Length == 0)
            {
                MessageBox.Show("Votre combinaison de nom d'usager et de mot de passe n'est pas valide.", "Erreur lors de la connexion", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            //Sinon, l'utilisateur est connecté - Anthony Gauthier 09/10/2014
            else
            {
                int id = Int32.Parse(tabJoueur[0][0]);
                VarGlobales.Joueur = new Joueur(id, tabJoueur[0][1]);
                return true;
            }
        }

        private void btnConnexionActive()
        {
            //Si l'utilisateur ne fourni pas de nom d'usager - Anthony Gauthier 09/10/2014
            if (txtbNomUsager.Text.Length == 0)
            {
                MessageBox.Show("Vous devez fournir un nom d'usager", "Erreur lors de la connexion", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            //Si l'utilisateur ne fourni pas de mot de passe - Anthony Gauthier 09/10/2014
            else if (pwdbMdp.Password.Length == 0)
            {
                MessageBox.Show("Vous devez fournir un mot de passe", "Erreur lors de la connexion", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            //Sinon, on se connecte à la BD et on effectue la requête - Anthony Gauthier 09/10/2014
            else
            {
                bool joueurConnecte;
                joueurConnecte = connexionCombaxe();

                if (joueurConnecte == true)
                {
                    //On fait appel au service du personnage
                    PersonnageService personnageService = new PersonnageService();
                    bool joueurAPersonnage;

                    joueurAPersonnage = personnageService.VerificationPersonnage(txtbNomUsager.Text, pwdbMdp.Password);

                    //Si le joueur a des personnages, on affiche l'écran de changement de personnages - Anthony Gauthier 09/10/2014
                    if (joueurAPersonnage == true)
                    {
                        ChoixPerso();
                    }
                    //Sinon, on l'amène à la page de création de personnage - Anthony Gauthier 09/10/2014
                    else
                    {
                        var creationPerso = new EcranCreationPersonnage();
                        creationPerso.Show();
                        this.Close();
                    }
                }
            }
        }

        //Pour que le premier champ est le focus au démarrage
        private void txtbNomUsager_Loaded_1(object sender, RoutedEventArgs e)
        {
            Keyboard.Focus(txtbNomUsager);
        }

        //Méthode qui load tous les médias (sons/musiques) - Anthony Gauthier 13 Nov. 2014
        public void LoadMedias()
        {
            //Son des potions
            VarGlobales.sonPotion = new SoundPlayer("./resources/media/potion.wav");
            VarGlobales.sonPotion.Load();

            //Son de clique de bouton
            VarGlobales.cliqueBouton = new SoundPlayer("./resources/media/clique.wav");
            VarGlobales.cliqueBouton.Load();
        }

        public void ChoixPerso()
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

            horloge = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                //On enleve du temps au timer
                temps = temps.Add(TimeSpan.FromSeconds(-1));

                if (VarGlobales.ChoixPersoFait == true)
                {
                    this.Opacity = 1;
                    this.IsEnabled = true;
                    horloge.Stop();
                    this.Close();
                }
                else if(VarGlobales.Retour == true)
                {
                    this.Opacity = 1;
                    this.IsEnabled = true;
                    horloge.Stop();
                }
            }, Application.Current.Dispatcher);

            horloge.Start();
        }
    }
}
