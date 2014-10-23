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
        List<Personnage> lstPerso;

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
            lstPerso = personnageService.RetrieveInfoPerso();

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
                    /* affiche caractéristiques */
                   
                    lblNbrEDefense1.Content = lstPerso[0].ListeCaracteristique[3].Valeur;
                    lblNbrEnergie1.Content = lstPerso[0].ListeCaracteristique[4].Valeur;
                    lblNbrForce1.Content = lstPerso[0].ListeCaracteristique[0].Valeur;
                    lblNbrVie1.Content = lstPerso[0].ListeCaracteristique[1].Valeur;
                    lblNbrVitesse1.Content = lstPerso[0].ListeCaracteristique[2].Valeur;
                    txtbPointDenergie1.Text = Convert.ToInt32((lstPerso[0].ListeCaracteristique[4].Valeur * 10) / 3.1416).ToString();
                    txtbPointDeVie1.Text = Convert.ToInt32((lstPerso[0].ListeCaracteristique[1].Valeur * 20) / 3.1416).ToString();
                    lblNomPerso1.Content = lstPerso[0].Nom;
                    lblNiveau1.Content = lstPerso[0].Niveau;
                    btnChoisir2.IsEnabled = false;
                    btnChoisir3.IsEnabled = false;
                }
                if (nbLigne >= 2)
                {
                    lblNbrEDefense2.Content = lstPerso[1].ListeCaracteristique[3].Valeur;
                    lblNbrEnergie2.Content = lstPerso[1].ListeCaracteristique[4].Valeur;
                    lblNbrForce2.Content = lstPerso[1].ListeCaracteristique[0].Valeur;
                    lblNbrVie2.Content = lstPerso[1].ListeCaracteristique[1].Valeur;
                    lblNbrVitesse2.Content = lstPerso[1].ListeCaracteristique[2].Valeur;
                    txtbPointDenergie2.Text = Convert.ToInt32((lstPerso[1].ListeCaracteristique[4].Valeur * 10) / 3.1416).ToString();
                    txtbPointDeVie2.Text = Convert.ToInt32((lstPerso[1].ListeCaracteristique[1].Valeur * 20) / 3.1416).ToString();
                    lblNomPerso2.Content = lstPerso[1].Nom;
                    lblNiveau2.Content = lstPerso[1].Niveau;
                    btnChoisir2.IsEnabled = true;
                }
                if(nbLigne >= 3)
                {
                    lblNbrEDefense3.Content = lstPerso[2].ListeCaracteristique[3].Valeur;
                    lblNbrEnergie3.Content = lstPerso[2].ListeCaracteristique[4].Valeur;
                    lblNbrForce3.Content = lstPerso[2].ListeCaracteristique[0].Valeur;
                    lblNbrVie3.Content = lstPerso[2].ListeCaracteristique[1].Valeur;
                    lblNbrVitesse3.Content = lstPerso[2].ListeCaracteristique[2].Valeur;
                    txtbPointDenergie3.Text = Convert.ToInt32((lstPerso[2].ListeCaracteristique[4].Valeur * 10) / 3.1416).ToString();
                    txtbPointDeVie3.Text = Convert.ToInt32((lstPerso[2].ListeCaracteristique[1].Valeur * 20) / 3.1416).ToString();
                    lblNomPerso3.Content = lstPerso[2].Nom;
                    lblNiveau3.Content = lstPerso[2].Niveau;
                    btnChoisir3.IsEnabled = true;
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

        private void btnRetour_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.Joueur.Deconnexion();
            if(VarGlobales.Personnage != null)
                VarGlobales.Personnage.Deconnexion();
            var connexion = new MainWindow();
            connexion.Show();
            this.Close();
        }

        private void btnChoisir1_Click(object sender, RoutedEventArgs e)
        {
            // on va chercher un personnage
            PersonnageService personnageService = new PersonnageService();
            VarGlobales.Personnage = personnageService.selectionUnPersonnage(lstPerso[0].IdPersonnage);
            MessageBox.Show("Personnage 1 Choisi!", "Choix", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void btnChoisir2_Click(object sender, RoutedEventArgs e)
        {
            // on va chercher un personnage
            PersonnageService personnageService = new PersonnageService();
            VarGlobales.Personnage = personnageService.selectionUnPersonnage(lstPerso[1].IdPersonnage);
            MessageBox.Show("Personnage 2 Choisi!", "Choix", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void btnChoisir3_Click(object sender, RoutedEventArgs e)
        {
            // on va chercher un personnage
            PersonnageService personnageService = new PersonnageService();
            VarGlobales.Personnage = personnageService.selectionUnPersonnage(lstPerso[2].IdPersonnage);
            MessageBox.Show("Personnage 3 Choisi!", "Choix", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }


    }
}
