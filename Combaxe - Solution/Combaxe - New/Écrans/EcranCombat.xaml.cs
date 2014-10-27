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
        }

        //Méthode du bouton pour fuir un combat
        private void btnFuir_Click(object sender, RoutedEventArgs e)
        {
            var EcranMenuPrincipal = new EcranMenuPrincipal();
            EcranMenuPrincipal.Show();
            this.Close();
        }

        private void btnChoisirActions_Click(object sender, RoutedEventArgs e)
        {
            //On affiche les quatres buotons d'actions
            btnAction1.Visibility = Visibility.Visible;
            btnAction2.Visibility = Visibility.Visible;
            btnAction3.Visibility = Visibility.Visible;
            btnAction4.Visibility = Visibility.Visible;
        }

        private void btnItems_Click(object sender, RoutedEventArgs e)
        {
            btnAction1.Visibility = Visibility.Visible;
            btnAction2.Visibility = Visibility.Visible;
            if(btnAction3.Visibility == Visibility.Visible)
            {
                btnAction3.Visibility = Visibility.Hidden;
                btnAction4.Visibility = Visibility.Hidden;
            }
        }

        private void chargerPersonnage()
        {
            this.imgPerso.Source = VarGlobales.Personnage.profession.Image; // le lien va être à changer
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

    }
}
