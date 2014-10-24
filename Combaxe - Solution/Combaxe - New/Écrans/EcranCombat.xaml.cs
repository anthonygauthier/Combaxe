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
            chargerEnnemis();
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

        /// <summary>
        /// pour charger les informations du personnage du joueur, tommy gingras
        /// </summary>
        private void chargerPersonnage() 
        {

            /* infos */
            /*lblNbrEDefense1.Content = lstPerso[0].ListeCaracteristique[3].Valeur;
                        lblNbrEnergie1.Content = lstPerso[0].ListeCaracteristique[4].Valeur;
                        lblNbrForce1.Content = lstPerso[0].ListeCaracteristique[0].Valeur;
                        lblNbrVie1.Content = lstPerso[0].ListeCaracteristique[1].Valeur;
                        lblNbrVitesse1.Content = lstPerso[0].ListeCaracteristique[2].Valeur;
                        txtbPointDenergie1.Text = "Énergie: " + Convert.ToInt32((lstPerso[0].ListeCaracteristique[3].Valeur * 10) / 3.1416).ToString();
                        txtbPointDeVie1.Text = "Vie: " + Convert.ToInt32((lstPerso[0].ListeCaracteristique[2].Valeur * 20) / 3.1416).ToString();*/
            // liens pour afficher les images des combatants, tommy gingras
            imgPerso.Source = VarGlobales.Personnage.Image;
            lblEnergiePerso.Content = Convert.ToInt32((VarGlobales.Personnage.ListeCaracteristique[3].Valeur * 10) / 3.1416).ToString();
            lblExperiencePerso.Content = VarGlobales.Personnage.Experience;
            lblNiveauPerso.Content = VarGlobales.Personnage.Niveau;
            lblNomPerso.Content = VarGlobales.Personnage.Nom;
            lblViePerso.Content = Convert.ToInt32((VarGlobales.Personnage.ListeCaracteristique[2].Valeur * 20) / 3.1416).ToString();
        }

        /// <summary>
        /// pour charger les infos de l'ennemi, Tommy Gingras
        /// </summary>
        private void chargerEnnemis()
        {
            // l'image de l'ennemi, tommy gingras
            imgEnnemi.Source = new BitmapImage(new Uri(@"../images/ennemis.png", UriKind.RelativeOrAbsolute)); // le lien doit être changer 
        }

    }
}
