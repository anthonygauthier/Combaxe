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
        List<Personnage> lstPerso;
        //Lorsque la page s'initialise, on initie une connexion à la BD
        BdService bdCombaxe = new BdService();

        public EcranChangementPerso()
        {
            InitializeComponent();
            SelectionnerPersonnages();
        }
     
        private void SelectionnerPersonnages()
        {
            // on va chercher les personnages pour un joueur
            PersonnageService personnageService = new PersonnageService();

            /* on va chercher tous les personnages du joueur */
            lstPerso = personnageService.RetrieveInfoPerso();

            /* on vérifie combien il a de personnage */
            if(lstPerso == null)
            {
                var creationPerso = new EcranCreationPersonnage();
                creationPerso.Show();
                this.Close(); 
            }
            else 
            { 
                int nbLigne = lstPerso.Count();

                /* Si aucun */
                if(nbLigne == 0)
                {
                    btnChoisir1.IsEnabled = false;
                    btnChoisir2.IsEnabled = false;
                    btnChoisir3.IsEnabled = false;
                    var creationPerso = new EcranCreationPersonnage();
                    creationPerso.Show();
                    this.Close();
                }
                else // on affiche les personnages dans leur section appropriée
                { 
                    if(nbLigne >= 1){
                        /* affiche caractéristiques */
                   
                        lblNbrEDefense1.Content = lstPerso[0].ListeCaracteristique[(int)Caracteristiques.Defense].Valeur;
                        lblNbrEnergie1.Content = lstPerso[0].ListeCaracteristique[(int)Caracteristiques.Energie].Valeur;
                        lblNbrForce1.Content = lstPerso[0].ListeCaracteristique[(int)Caracteristiques.Force].Valeur;
                        lblNbrVie1.Content = lstPerso[0].ListeCaracteristique[(int)Caracteristiques.Vie].Valeur;
                        lblNbrVitesse1.Content = lstPerso[0].ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur;
                        txtbPointDenergie1.Content = "Énergie: " + lstPerso[0].Energie.ToString() + "/" + lstPerso[0].EnergieMaximale;
                        txtbPointDeVie1.Content = "Vie: " + lstPerso[0].Vie.ToString() + "/" + lstPerso[0].VieMaximale;
                        /* l'image du personnage */
                        this.imgPerso1.Source = lstPerso[0].Image;
                        lblNomPerso1.Content = lstPerso[0].Nom;
                        lblNiveau1.Content = "Niveau: "+lstPerso[0].Niveau; //Ajout de "Niveau: " Anthony Gauthier 23/10/2014
                        btnChoisir2.IsEnabled = false;
                        btnChoisir3.IsEnabled = false;
                    }
                    if (nbLigne >= 2)
                    {
                        lblNbrEDefense2.Content = lstPerso[1].ListeCaracteristique[(int)Caracteristiques.Defense].Valeur;
                        lblNbrEnergie2.Content = lstPerso[1].ListeCaracteristique[(int)Caracteristiques.Energie].Valeur;
                        lblNbrForce2.Content = lstPerso[1].ListeCaracteristique[(int)Caracteristiques.Force].Valeur;
                        lblNbrVie2.Content = lstPerso[1].ListeCaracteristique[(int)Caracteristiques.Vie].Valeur;
                        lblNbrVitesse2.Content = lstPerso[1].ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur;
                        txtbPointDenergie2.Content = "Énergie: " + lstPerso[1].Energie.ToString() + "/" + lstPerso[1].EnergieMaximale;
                        txtbPointDeVie2.Content = "Vie: " + lstPerso[1].Vie.ToString() + "/" + lstPerso[1].VieMaximale;
                        this.imgPerso2.Source = lstPerso[1].Image;
                        lblNomPerso2.Content = lstPerso[1].Nom;
                        lblNiveau2.Content = "Niveau: " + lstPerso[1].Niveau; //Ajout de "Niveau: " Anthony Gauthier 23/10/2014
                        btnChoisir2.IsEnabled = true;
                        MajBarreViePerso((int)(brdMaxWidth.ActualWidth), brdViePerso2, 1);
                    }
                    if(nbLigne >= 3)
                    {
                        lblNbrEDefense3.Content = lstPerso[2].ListeCaracteristique[(int)Caracteristiques.Defense].Valeur;
                        lblNbrEnergie3.Content = lstPerso[2].ListeCaracteristique[(int)Caracteristiques.Energie].Valeur;
                        lblNbrForce3.Content = lstPerso[2].ListeCaracteristique[(int)Caracteristiques.Force].Valeur;
                        lblNbrVie3.Content = lstPerso[2].ListeCaracteristique[(int)Caracteristiques.Vie].Valeur;
                        lblNbrVitesse3.Content = lstPerso[2].ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur;
                        txtbPointDenergie3.Content = "Énergie: " + lstPerso[2].Energie.ToString() + "/" + lstPerso[2].EnergieMaximale;
                        txtbPointDeVie3.Content = "Vie: " + lstPerso[2].Vie.ToString() + "/" + lstPerso[2].VieMaximale;
                        this.imgPerso3.Source = lstPerso[2].Image;
                        lblNomPerso3.Content = lstPerso[2].Nom;
                        lblNiveau3.Content = "Niveau: " + lstPerso[2].Niveau; //Ajout de "Niveau: " Anthony Gauthier 23/10/2014
                        btnChoisir3.IsEnabled = true;
                        btnCreerPerso.IsEnabled = false;
                        MajBarreViePerso((int)(brdMaxWidth.ActualWidth), brdViePerso3, 2);
                    }
                } // on peut choisir le personnage et aller au menu principal
            }
        }

        //Méthode pour le bouton "Créer personnage"
        private void btnCreerPerso_Click(object sender, RoutedEventArgs e)
        {
            var creationPerso = new EcranCreationPersonnage();
            creationPerso.Show();
            this.Close();
        }

        //Méthode pour le bouton retour
        private void btnRetour_Click(object sender, RoutedEventArgs e)
        {
            if(!VarGlobales.EstConnecte)
            {
                VarGlobales.Joueur.Deconnexion();
                if(VarGlobales.Personnage != null)
                    VarGlobales.Personnage.Deconnexion();
                var connexion = new MainWindow();
                connexion.Show();
                this.Close();
            }
            else
            {
                var EcranMenuPrincipal = new EcranMenuPrincipal();
                EcranMenuPrincipal.Show();
                VarGlobales.EstConnecte = false;
                this.Close();
            }
        }

        //Méthode pour le bouton choisir du personnage #1
        private void btnChoisir1_Click(object sender, RoutedEventArgs e)
        {
            // on va chercher un personnage
            PersonnageService personnageService = new PersonnageService();
            VarGlobales.Personnage = personnageService.selectionUnPersonnage(lstPerso[0].IdPersonnage);
            changerFenetre();
        }

        //Méthode pour le bouton choisir du personnage #2
        private void btnChoisir2_Click(object sender, RoutedEventArgs e)
        {
            // on va chercher un personnage
            PersonnageService personnageService = new PersonnageService();
            VarGlobales.Personnage = personnageService.selectionUnPersonnage(lstPerso[1].IdPersonnage);
            changerFenetre();
        }

        //Méthode pour le bouton choisir du personnage #3
        private void btnChoisir3_Click(object sender, RoutedEventArgs e)
        {
            // on va chercher un personnage
            PersonnageService personnageService = new PersonnageService();
            VarGlobales.Personnage = personnageService.selectionUnPersonnage(lstPerso[2].IdPersonnage);
            changerFenetre();
        }

        //Méthode pour amener l'utilisateur au Menu Principal
        private void changerFenetre()
        { 
            var menuPrincipal = new EcranMenuPrincipal();
            menuPrincipal.Show();
            this.Close();
        }

        /// <summary>
        /// Quand le joueur se fait attaquer, sa barre de vie se réduit - Anthony Gauthier 04/11/2014
        /// </summary>
        private void MajBarreViePerso(int max, Border bordure, int index)
        {
            int poucentageVie = (lstPerso[index].Vie * 100) / lstPerso[index].VieMaximale;

            int widthAjuste = max - ((max * poucentageVie) / 100);
            bordure.Margin = new Thickness(1, 1, widthAjuste, 1);
            MajCouleurBarreVie(bordure, index);
        }

        /// <summary>
        /// Quand le joueur utilise un sort, sa barre d'énergie se réduit - Anthony Gauthier 05/11/2014
        /// </summary>
        private void MajBarreEnergiePerso(int max, Border bordure, int index)
        {
            int pourcentageEnergie = (lstPerso[index].Energie * 100) / lstPerso[index].EnergieMaximale;

            int widthAjuste = max - ((max * pourcentageEnergie) / 100);
            bordure.Margin = new Thickness(1, 1, widthAjuste, 1);
        }


        /// <summary>
        /// Met à jour la couleur des barres de vie des personnages - Anthony Gauthier 05/11/2014 
        /// </summary>
        /// <param name="uneBordure">Recoit la barre a modifier</param>
        private void MajCouleurBarreVie(Border uneBordure, int index)
        {
            //Si la vie du personnage est inférieur ou égale à 50%
            if (lstPerso[index].Vie <= lstPerso[index].VieMaximale * 0.5)
            {
                if (lstPerso[index].Vie <= lstPerso[index].VieMaximale * 0.25)
                {
                    uneBordure.Background = Brushes.Red;
                }
                else
                {
                    uneBordure.Background = Brushes.Yellow;
                }
            }
            else if (lstPerso[index].Vie > lstPerso[index].VieMaximale * 0.50)
            {
                uneBordure.Background = Brushes.Green;
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            MajBarreViePerso((int)(brdMaxWidth.ActualWidth), brdViePerso1, 0);
            //MajBarreViePerso((int)(brdMaxWidth.ActualWidth), brdViePerso2, 1); 
            //MajBarreViePerso((int)(brdMaxWidth.ActualWidth), brdViePerso3, 2); 
            MajBarreEnergiePerso((int)(brdMaxWidth.ActualWidth), brdEnergiePerso1, 0); 
            //MajBarreEnergiePerso((int)(brdMaxWidth.ActualWidth), brdEnergiePerso2, 0); 
            //MajBarreEnergiePerso((int)(brdMaxWidth.ActualWidth), brdEnergiePerso3, 0); 
        }
    }
}
