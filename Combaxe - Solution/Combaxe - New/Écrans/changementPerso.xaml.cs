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


        private void SelectionnerPersonnages()
        {
            // on va chercher les personnages pour un joueur
            string reqSelect = "SELECT idPersonnage, nom, niveau, image FROM Personnages WHERE idJoueur = '"+VarGlobales.Joueur.idJoueur+"';";
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 4, ref nbLigne);
            if(nbLigne == 0)
            {
                var creationPerso = new creationPersonnage();
                creationPerso.Show();
                this.Close();
            }
            else // on affiche les personnages dans leur section appropriée
            { 
                if(nbLigne == 1){
                    /*string reqSelectPerso = "SELECT nom, niveau, image FROM Personnages WHERE idJoueur = '" +lstPerso[0][1]+ "';";
                    int nbLignePerso = 0;
                    List<string>[] lstPerso0 = bdCombaxe.selection(reqSelectPerso, , ref nbLigne);*/
                    lblNomPerso1.Content = lstPerso[0][3];
                    lblNiveau1.Content = lstPerso[0][4];
                    btnChoisir2.IsEnabled = false;
                    btnChoisir3.IsEnabled = false;
                }
                if (nbLigne == 2)
                {
                    lblNomPerso1.Content = lstPerso[0][3];
                    lblNiveau1.Content = lstPerso[0][4];
                    lblNomPerso2.Content = lstPerso[1][3];
                    lblNiveau2.Content = lstPerso[1][4];
                    btnChoisir3.IsEnabled = false;
                }
                if(nbLigne == 3)
                {
                    lblNomPerso1.Content = lstPerso[0][3];
                    lblNiveau1.Content = lstPerso[0][4];
                    lblNomPerso2.Content = lstPerso[1][3];
                    lblNiveau2.Content = lstPerso[1][4];
                    lblNomPerso3.Content = lstPerso[2][3];
                    lblNiveau3.Content = lstPerso[2][4];
                    btnCreerPerso.IsEnabled = false;
                }
            } // on peut choisir le personnage et aller au menu principal
            
        }

        private void btnCreerPerso_Click(object sender, RoutedEventArgs e)
        {
            var creationPerso = new creationPersonnage();
            creationPerso.Show();
            this.Close();
        }
    }
}
