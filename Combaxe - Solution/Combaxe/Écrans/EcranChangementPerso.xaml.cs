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
    public partial class EcranChangementPerso : Window
    {
        //Lorsque la page s'initialise, on initie une connexion à la BD
        BdService bdCombaxe = new BdService();
        List<Personnage> lstPerso = new List<Personnage>();
        public EcranChangementPerso()
        {
            InitializeComponent();
            SelectionnerPersonnages();

            if(VarGlobales.aSupprimerPersonnage == true)
                btnRetour.IsEnabled = false;
        }

        private void SelectionnerPersonnages()
        {
            
            // on va chercher les personnages pour un joueur
            PersonnageService personnageService = new PersonnageService();

            /* on va chercher tous les personnages du joueur */
            lstPerso = personnageService.RetrieveInfoPerso();

            /* on vérifie combien il a de personnage */
            if (lstPerso == null)
            {
                var creationPerso = new EcranCreationPersonnage();
                creationPerso.Show();
                this.Close();
            }
            else
            {
                int nbLigne = lstPerso.Count();

                /* Si aucun */
                if (nbLigne == 0)
                {
                    var creationPerso = new EcranCreationPersonnage();
                    creationPerso.Show();
                    this.Close();
                }
                else // on affiche les personnages dans leur section appropriée
                {
                    //Si on a un personnage
                    if (nbLigne >= 1)
                    {
                        string profession = lstPerso[0].profession.Nom + " - Niveau: " + lstPerso[0].Niveau;

                        lblNomPerso1.Content = lstPerso[0].Nom;
                        lblProfessionPerso1.Content = profession;
                        this.imgPerso1.Source = lstPerso[0].Image;
                    }

                    //Si on a 2 personnages
                    if (nbLigne >= 2)
                    {
                        gridPerso2.Visibility = Visibility.Visible;

                        string profession = lstPerso[1].profession.Nom + " - Niveau: " + lstPerso[1].Niveau;

                        lblNomPerso2.Content = lstPerso[1].Nom;
                        lblProfessionPerso2.Content = profession;
                        this.imgPerso2.Source = lstPerso[1].Image;
                    }

                    //Si on a 3 personnage
                    if (nbLigne >= 3)
                    {
                        gridPerso3.Visibility = Visibility.Visible;
                        btnCreerPerso.IsEnabled = false;

                        string profession = lstPerso[2].profession.Nom + " - Niveau: " + lstPerso[2].Niveau;

                        lblNomPerso3.Content = lstPerso[2].Nom;
                        lblProfessionPerso3.Content = profession;
                        this.imgPerso3.Source = lstPerso[2].Image;
                    }
                } // on peut choisir le personnage et aller au menu principal
            }
        }
     

        //Méthode pour amener l'utilisateur au Menu Principal
        private void changerFenetre()
        { 
            var menuPrincipal = new EcranMenuPrincipal();
            menuPrincipal.Show();
            this.Close();
        }


        //Méthodes pour afficher le focus du personnage
        private void GridPerso1_MouseEnter(object sender, MouseEventArgs e)
        {
            mouseEnter(border1);
        }

        private void gridPerso1_MouseLeave(object sender, MouseEventArgs e)
        {
            mouseLeave(border1);
        }

        private void gridPerso2_MouseEnter(object sender, MouseEventArgs e)
        {
            mouseEnter(border2);
        }

        private void gridPerso2_MouseLeave(object sender, MouseEventArgs e)
        {
            mouseLeave(border2);
        }

        private void gridPerso3_MouseEnter(object sender, MouseEventArgs e)
        {
            mouseEnter(border3);
        }

        private void gridPerso3_MouseLeave(object sender, MouseEventArgs e)
        {
            mouseLeave(border3);
        }
        
        //Méthodes qui change la couleur de la border
        private void mouseEnter(Border uneBordure)
        {
            uneBordure.BorderThickness = new Thickness(1);
            uneBordure.BorderBrush = Brushes.Red;
        }
        private void mouseLeave(Border uneBordure)
        {
            uneBordure.BorderThickness = new Thickness(0, 0, 0, 0);
            uneBordure.BorderBrush = null;
        }

        private void LoadPerso(int index)
        {
            // on va chercher un personnage
            VarGlobales.aSupprimerPersonnage = false;
            PersonnageService personnageService = new PersonnageService();
            VarGlobales.ChoixPersoFait = true;
            // si un personnage est déjà connecté on veut enregistrer son temps de jeu
            if(VarGlobales.Personnage != null)
                VarGlobales.Personnage.Deconnexion();
            VarGlobales.Personnage = personnageService.selectionUnPersonnage(lstPerso[index].IdPersonnage);
            VarGlobales.HeureConnexion = DateTime.Now;
            changerFenetre();
        }

        private void btnRetour_Click(object sender, RoutedEventArgs e)
        {
            if (!VarGlobales.EstConnecte)
            {
                VarGlobales.Retour = true;
                if (VarGlobales.Personnage != null)
                    VarGlobales.Personnage.Deconnexion();
                this.Close();
            }
            else
            {
                VarGlobales.ChoixPersoFait = true;
                var EcranMenuPrincipal = new EcranMenuPrincipal();
                EcranMenuPrincipal.Show();
                this.Close();
            }
        }

        private void btnCreerPerso_Click(object sender, RoutedEventArgs e)
        {
            var creationPerso = new EcranCreationPersonnage();
            creationPerso.Show();
            this.Close();
        }

        private void gridPerso3_MouseUp(object sender, MouseButtonEventArgs e)
        {
            LoadPerso(2);
        }

        private void gridPerso2_MouseUp(object sender, MouseButtonEventArgs e)
        {
            LoadPerso(1);
        }

        private void gridPerso1_MouseUp(object sender, MouseButtonEventArgs e)
        {
            LoadPerso(0);
        }
    }
}
