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
using Combaxe___New.écrans;
using MiniBD;
using System.Text.RegularExpressions;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Logique d'interaction pour changementPerso.xaml
    /// </summary>
    public partial class changementPerso : Window
    {
        public changementPerso()
        {
            InitializeComponent();
            SelectionnerPersonnages();
        }
        //Lorsque la page s'initialise, on initie une connexion à la BD
        BdService bdCombaxe = new BdService();

<<<<<<< HEAD
        private void SelectionnerPersonnages()
        {
            // on va chercher les personnages pour un joueur
            string reqSelect = "SELECT idProfession, idInventaire, idStatistique, nom, niveau, experience, image FROM Personnages WHERE idJoueur = '"+VarGlobales.Joueur.idJoueur+"';";
            int nbLigne = 0;
            bdCombaxe.selection(reqSelect, 7, ref nbLigne);
            
        }
=======
        private void btnCreerPerso_Click(object sender, RoutedEventArgs e)
        {
            var creationPerso = new creationPersonnage();
            creationPerso.Show();
            this.Close();
        }

        // on va chercher les personnages pour un joueur
        //VarGlobales

>>>>>>> origin/master
        // on affiche les personnages dans leur section appropriée
        // on peut choisir le personnage et aller au menu principal

    }
}
