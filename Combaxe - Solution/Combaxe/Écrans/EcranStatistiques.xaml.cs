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
    /// Interaction logic for EcranStatistiques.xaml
    /// </summary>
    public partial class EcranStatistiques : Window
    {
        StatistiqueService serviceStat = new StatistiqueService();
        PersonnageService persoService = new PersonnageService();

        public EcranStatistiques()
        {
            InitializeComponent();
            nomPersonnageTitre();
        }

        //Méthode pour afficher le nom du personnage à côté de statistiques dans le titre (Anthony Gauthier - 28/10/2014)
        private void nomPersonnageTitre()
        { 
            lblTitre.Content = lblTitre.Content + " - " + VarGlobales.Personnage.Nom;
            /* TOMMY GINGRAS */
            // on va chercher les stats
            
            Statistique stats = new Statistique();
            stats = serviceStat.SelectionStatsPersonnage("idPersonnage = " + VarGlobales.Personnage.IdPersonnage);

            txtbDefaite.Content = stats.nombreDefaites.ToString();
            txtbDmgMoyen.Content = stats.moyenneDommage.ToString();
            txtbDmgTotal.Content = stats.dommageTotal.ToString();
            txtbNbrAttaque.Content = stats.nombreAttaque.ToString();
            txtbNbrCombat.Content = stats.nombreDeCombat.ToString();
            txtbTempsJeu.Content = stats.tempsDeJeu.ToString();
            txtbVictoire.Content = stats.nombreVictoires.ToString();
            // on les affiches

        }

        //Méthode pour le bouton retour (Anthony Gauthier - 28/10/2014)
        private void btnRetour_Click(object sender, RoutedEventArgs e)
        {
            var MenuPrincipal = new EcranMenuPrincipal();
            MenuPrincipal.Show();
            this.Close();
        }
    }
}
