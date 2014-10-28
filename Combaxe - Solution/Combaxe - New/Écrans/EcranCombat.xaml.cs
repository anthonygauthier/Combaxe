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
            btnAction1.Content = VarGlobales.Personnage.ListeCompetence[0].Nom;
            btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom;
            btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom;
            btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom;
            btnAction1.ToolTip = null;
        }

        private void btnItems_Click(object sender, RoutedEventArgs e)
        {
            btnAction1.Visibility = Visibility.Visible;
            btnAction2.Visibility = Visibility.Visible;
            btnAction1.Content = "";
            btnAction2.Content = "";
            if(btnAction3.Visibility == Visibility.Visible)
            {
                btnAction3.Visibility = Visibility.Hidden;
                btnAction4.Visibility = Visibility.Hidden;
            }
        }

        private void btnAction1_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btnAction2_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btnAction3_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btnAction4_Click(object sender, RoutedEventArgs e)
        {
            
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

        /// <summary>
        /// Fonction pour calculer les dégâts/les points d'absortions/points de guérisons
        /// </summary>
        /// <param name="pointMin">la valeur minimum</param>
        /// <param name="pointMax">la valeur maximum</param>
        /// <param name="idType">le type pour le calcul des dégâts selon magique ou physique</param>
        /// <returns>les points</returns>
        private int calculValeur(int pointMin, int pointMax, int idType)
        {
            int valeur = 0;
            //on fait le random entre le min et le max

            // on attribut le bon texte pour le tooltip
            // on retourne la valeur

            return valeur;

        }

        /// <summary>
        /// pour afficher le tooltip pour une compétence
        /// </summary>
        private void afficherTooltip(int num)
        {
            CompetenceService competenceService = new CompetenceService();
            ToolTip toolTip = new ToolTip();
            toolTip.Content = VarGlobales.Personnage.ListeCompetence[0].Nom + "\nType : " + VarGlobales.Personnage.ListeCompetence[0].NomTypeCompetence;
            //switch pour le type d'attaque
            competenceService.RetrieveListeTypeCompetence();
            // requête bd pour définir les types de competence
            

            // on fait calcul valeur 
            // on attribut le bon texte pour le tooltip
            // on retourne la valeur
        }
    }
}
