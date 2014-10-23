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
using Combaxe___New.classes.services;

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
            PersonnageService personnageService = new PersonnageService();

            /* on va chercher tous les personnages du joueur */
            List<Personnage> lstPerso = personnageService.RetrieveInfoPerso();
            /* pour les caractéristiques du personnage */

            //List<string>[] lstCaracteristiques = personnageService.RetrieveCaracteristiques(lstPerso);
           
            /* on vérifie combien il a de personnage */
            int nbLigne = lstPerso.Count();

            /* Si aucun */
            if(nbLigne == 0)
            {
                var creationPerso = new creationPersonnage();
                creationPerso.Show();
                this.Close();
            }
            else // on affiche les personnages dans leur section appropriée
            { 
                if(nbLigne >= 1){
                    lblNomPerso1.Content = lstPerso[0].nom;
                    lblNiveau1.Content = lstPerso[0].niveau;
                    btnChoisir2.IsEnabled = false;
                    btnChoisir3.IsEnabled = false;
                }
                if (nbLigne == 2)
                {
                    lblNomPerso2.Content = lstPerso[1].nom;
                    lblNiveau2.Content = lstPerso[1].niveau;
                    btnChoisir2.IsEnabled = true;
                }
                if(nbLigne == 3)
                {
                    //lblDefense1.Content = lstCaracteristiques[0][3];
                    lblNomPerso1.Content = lstPerso[0].nom;
                    lblNiveau1.Content = lstPerso[0].niveau;
                    lblNomPerso2.Content = lstPerso[1].nom;
                    lblNiveau2.Content = lstPerso[1].niveau;
                    lblNomPerso3.Content = lstPerso[2].nom;
                    lblNiveau3.Content = lstPerso[2].niveau;
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
