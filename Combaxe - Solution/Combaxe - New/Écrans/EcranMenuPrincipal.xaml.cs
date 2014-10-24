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
        }

        //Méthode du bouton Combat
        private void btnCombat_Click(object sender, RoutedEventArgs e)
        {
            btnCampagne.Visibility = Visibility.Visible;
            btnPartieRapide.Visibility = Visibility.Visible;
            btnCombat.Visibility = Visibility.Hidden;
        }

        //Méthode du bouton Supprimer personnage
        private void btnSupprimerPerso_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.Personnage.Supprimer();
            /* on vérifie si il reste de joueurs */
            PersonnageService personnageService = new PersonnageService();
            List<Personnage> personnages = personnageService.RetrieveInfoPerso();
            if (personnages == null)
            {
                var creationPerso = new EcranCreationPersonnage();
                creationPerso.Show();
                this.Close();
            }
            else
            {
                var pageChangementPerso = new EcranChangementPerso();
                pageChangementPerso.Show();
                this.Close();
            }
        }

        //Méthode du bouton Campagne
        private void btnCampagne_Click_1(object sender, RoutedEventArgs e)
        {
            ouvrirEcranCombat();
        }

        //Méthode du bouton Campagne
        private void btnPartieRapide_Click_1(object sender, RoutedEventArgs e)
        {
            ouvrirEcranCombat();
        }

        //Méthode pour afficher l'écran de combat
        private void ouvrirEcranCombat()
        {
            var EcranCombat = new EcranCombat();
            EcranCombat.Show();
            this.Close();
        }

        //Méthode pour afficher l'écran de changement de personnage
        private void btnChangerPerso_Click(object sender, RoutedEventArgs e)
        {
            var EcranChangementPerso = new EcranChangementPerso();
            EcranChangementPerso.Show();
            VarGlobales.EstConnecte = true;
            this.Close();
        }

        //Méthode pour se déconnecter
        private void btnDeconnexion_Click(object sender, RoutedEventArgs e)
        {
            var connexion = new MainWindow();
            connexion.Show();
            this.Close();
            VarGlobales.Joueur.Deconnexion();
        }
    }
}
