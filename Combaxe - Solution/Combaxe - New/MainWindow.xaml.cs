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
using MiniBD;

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
        }
        //Lorsque la page s'initialise, on initie une connexion à la BD - Anthony Gauthier 09/10/2014
        BdService bdCombaxe = new BdService();

        //Méthode pour se rendre à l'écran de création de compte - Anthony Gauthier 09/10/2014
        private void btnCreerCompte_Click(object sender, RoutedEventArgs e)
        {
            var creationCompte = new creationCompte();
            creationCompte.Show();
            this.Close();
        }

        //Méthode du bouton pour se connecter - Anthony Gauthier 09/10/2014
        private void btnConnexion_Click(object sender, RoutedEventArgs e)
        {
            //Si l'utilisateur ne fourni pas de nom d'usager - Anthony Gauthier 09/10/2014
            if(txtbNomUsager.Text.Length == 0)
            { 
                MessageBox.Show("ERREUR: Vous devez fournir un nom d'usager");
            }
            //Si l'utilisateur ne fourni pas de mot de passe - Anthony Gauthier 09/10/2014
            else if (pwdbMdp.Password.Length == 0)
            {
               MessageBox.Show("ERREUR: Vous devez fournir un mot de passe"); 
            }
            //Sinon, on se connecte à la BD et on effectue la requête - Anthony Gauthier 09/10/2014
            else 
            { 
                bool joueurConnecte;
                joueurConnecte = connexionCombaxe();

                if (joueurConnecte == true)
                {
                    bool joueurAPersonnage;
                    joueurAPersonnage = verificationPersonnage();

                    //Si le joueur a des personnages, on affiche l'écran de changement de personnages - Anthony Gauthier 09/10/2014
                    if (joueurAPersonnage == true)
                    {
                        var choixPerso = new changementPerso();
                        choixPerso.Show();
                        this.Close();
                    }
                    //Sinon, on l'amène à la page de création de personnage - Anthony Gauthier 09/10/2014
                    else
                    {
                        var creationPerso = new creationPersonnage();
                        creationPerso.Show();
                        this.Close();
                    }
                }
            }

        }

        //Méthode pour quitter le jeu - Anthony Gauthier 09/10/2014
        private void btnQuitter_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        //Méthode pour se connecter - Anthony Gauthier 09/10/2014
        private bool connexionCombaxe()
        {
            List<string>[] tabJoueur;

            tabJoueur = selectionJoueur();

            //Si la requête n'a rien retourné, l'utilisateur n'a pas de compte - Anthony Gauthier 09/10/2014
            if (tabJoueur[0][0].Length == 0)
            {
                MessageBox.Show("ERREUR: Votre combinaison de nom d'usager et de mot de passe n'est pas valide.");
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


        //Méthode pour vérifier si l'utilisateur a des personnages - Anthony Gauthier 09/10/2014
        private bool verificationPersonnage()
        {
            List<string>[] unJoueur;
            unJoueur = selectionJoueur();

            string selPerso = "SELECT * FROM personnages WHERE idJoueur = "+unJoueur[0][0]+";";

            List<string>[] persosDuJoueur;
            int nombreRange = 0;
            persosDuJoueur = bdCombaxe.selection(selPerso, 9, ref nombreRange);

            //Si le joueur n'a pas de personnages, on retourne false - Anthony Gauthier 09/10/2014
            if(persosDuJoueur[0][0].Length == 0)
            {
                return false;
            }
            //S'il en a, on retourne true - Anthony Gauthier 09/10/2014
            else
            {
                VarGlobales.aPersonnage = true;
                return true;
            }
        }

        //Méthode qui retourne les informations du compte du joueur (id, nom, mdp)
        private List<string>[] selectionJoueur()
        {
            string selConnexion = "SELECT * FROM joueurs WHERE pseudonyme = '" + txtbNomUsager.Text + "' AND motDePasse = '" + pwdbMdp.Password + "';";
            List<string>[] unJoueur;

            int nombreRange = 0;
            unJoueur = bdCombaxe.selection(selConnexion, 3, ref nombreRange);

            return unJoueur;
        }

    }
}
