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
    /// Logique d'interaction pour EcranCaracteristiques.xaml
    /// </summary>
    public partial class EcranCaracteristiques : Window
    {
        public EcranCaracteristiques()
        {
            InitializeComponent();
            disableBtnMoins();
            modifierChampCaracteristiques();
        }

        //Méthode qui va chercher et affiche les caractéristiques du personnage
        private void modifierChampCaracteristiques()
        { 
            txtbPointsRestants.Text = "5";
            txtDefense.Text = VarGlobales.Personnage.ListeCaracteristique[(int) Caracteristiques.Defense].Valeur.ToString();
            txtVitesse.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur.ToString();
            txtForce.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur.ToString();
            txtVie.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur.ToString();
            txtEnergie.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur.ToString();
        }

        //Méthode pour disable les boutons moins de caractéristiques
        private void disableBtnMoins()
        {
            btnMoinsDefense.IsEnabled = false;
            btnMoinsEnergie.IsEnabled = false;
            btnMoinsVie.IsEnabled = false;
            btnMoinsForce.IsEnabled = false;
            btnMoinsVitesse.IsEnabled = false;
        }

        //Méthode qui enable les boutons plus de caractéristiques
        private void enableBtnMoins()
        {
            //On active les boutons donc on affiche les 5 points à placer restants
            txtbPointsRestants.Text = "5";

            btnMoinsDefense.IsEnabled = true;
            btnMoinsEnergie.IsEnabled = true;
            btnMoinsVie.IsEnabled = true;
            btnMoinsForce.IsEnabled = true;
            btnMoinsVitesse.IsEnabled = true;
        }

        //Méthode qui disable les boutons plus de caractéristiques
        private void disableBtnPlus()
        {
            btnPlusDefense.IsEnabled = false;
            btnPlusEnergie.IsEnabled = false;
            btnPlusVie.IsEnabled = false;
            btnPlusForce.IsEnabled = false;
            btnPlusVitesse.IsEnabled = false;
        }

        //Méthode qui enable les boutons plus de caractéristiques
        private void enableBtnPlus()
        {
            btnPlusDefense.IsEnabled = true;
            btnPlusEnergie.IsEnabled = true;
            btnPlusVie.IsEnabled = true;
            btnPlusForce.IsEnabled = true;
            btnPlusVitesse.IsEnabled = true;
        }

        //Méthode qui effectue tous les changements nécéssaire lorsqu'un bouton PLUS a été cliqué
        private void btnPlusClique()
        {
            //Si le nombre de points restants est égale à 0
            if (txtbPointsRestants.Text == "0")
            {
                //Si le nombre de points restant est égal à 0, on désactive les boutons
                disableBtnPlus();
            }
            else
            {
                //On converti la string en nombre et on enregistre ce nombre dans le textbox
                int Nombre = convertirEnIntMoins(txtbPointsRestants.Text);
                txtbPointsRestants.Text = Nombre.ToString();

                //On vérifie maintenant si le nombre de points restant est de 0
                if (Nombre == 0)
                {
                    //Si le nombre de points restant est égal à 0, on désactive les boutons
                    disableBtnPlus();
                }
            }
        }

        //Méthode qui effectue tous les changements nécéssaire lorsqu'un bouton MOINS a été cliqué
        private void btnMoinsClique()
        {
            if (btnPlusForce.IsEnabled == false)
            {
                enableBtnPlus();
            }
            //Si le nombre de points restants est égale à 5
            if (txtbPointsRestants.Text == "5")
            {
                //Si le nombre de points restant est égal à 5, on désactive les boutons moins
                disableBtnMoins();
            }
            else
            {
                //On converti la string en nombre et on enregistre ce nombre dans le textbox
                int Nombre = convertirEnIntPlus(txtbPointsRestants.Text);
                txtbPointsRestants.Text = Nombre.ToString();

                //On vérifie maintenant si le nombre de points restant est de 0
                if (Nombre == 5)
                {
                    //Si le nombre de points restant est égal à 30, on désactive les boutons moins
                    disableBtnMoins();
                }
            }
        }

        //Méthode pour convertir les string en int et fait MOINS un
        private int convertirEnIntMoins(string i)
        {
            //On converti la string en nombre, on soustrait -1 et on enregistre après le nombre soustrait dans le textbox
            int nombre = Int32.Parse(i);
            nombre = nombre - 1;

            return nombre;
        }

        //Méthode pour convertir les string en int et fait PLUS un
        private int convertirEnIntPlus(string i)
        {
            //On converti la string en nombre, on soustrait -1 et on enregistre après le nombre soustrait dans le textbox
            int nombre = Int32.Parse(i);
            nombre = nombre + 1;

            return nombre;
        }

        //Méthode lorsque le bouton moins de force est cliqué
        private void btnMoinsForce_Click(object sender, RoutedEventArgs e)
        {
            //Si la force est égale à 0, on désactive le bouton immédiatement et on remet la valeur à 0
            if (txtForce.Text == VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur.ToString())
            {
                btnMoinsForce.IsEnabled = false;
                txtForce.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur.ToString();
            }
            else
            {
                //On effectue les calculs relié au points restants
                btnMoinsClique();

                //On converti, on calcule et on enregistre la nouvelle valeur
                int nombre = convertirEnIntMoins(txtForce.Text);
                txtForce.Text = nombre.ToString();

                if (nombre == 0)
                {
                    btnMoinsForce.IsEnabled = false;
                }
            }
        }

        //Méthode lorsque le bouton moins de énergie est cliqué
        private void btnMoinsEnergie_Click(object sender, RoutedEventArgs e)
        {
            //Si la énergie est égale à 0, on désactive le bouton immédiatement et on remet la valeur à 0
            if (txtEnergie.Text == VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur.ToString())
            {
                btnMoinsEnergie.IsEnabled = false;
                txtEnergie.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur.ToString();
            }
            else
            {
                //On effectue les calculs relié au points restants
                btnMoinsClique();

                //On converti, on calcule et on enregistre la nouvelle valeur
                int nombre = convertirEnIntMoins(txtEnergie.Text);
                txtEnergie.Text = nombre.ToString();

                if (nombre == 0)
                {
                    btnMoinsEnergie.IsEnabled = false;
                }
            }
        }

        //Méthode lorsque le bouton moins de vie est cliqué
        private void btnMoinsVie_Click(object sender, RoutedEventArgs e)
        {
            //Si la vie est égale à 0, on désactive le bouton immédiatement et on remet la valeur à 0
            if (txtVie.Text == VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur.ToString())
            {
                btnMoinsVie.IsEnabled = false;
                txtVie.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur.ToString();
            }
            else
            {
                //On effectue les calculs relié au points restants
                btnMoinsClique();

                //On converti, on calcule et on enregistre la nouvelle valeur
                int nombre = convertirEnIntMoins(txtVie.Text);
                txtVie.Text = nombre.ToString();

                if (nombre == 0)
                {
                    btnMoinsVie.IsEnabled = false;
                }
            }
        }

        //Méthode lorsque le bouton moins de vitesse est cliqué
        private void btnMoinsVitesse_Click(object sender, RoutedEventArgs e)
        {
            //Si la vie est égale à 0, on désactive le bouton immédiatement et on remet la valeur à 0
            if (txtVitesse.Text == VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur.ToString())
            {
                btnMoinsVitesse.IsEnabled = false;
                txtVitesse.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur.ToString();
            }
            else
            {
                //On effectue les calculs relié au points restants
                btnMoinsClique();

                //On converti, on calcule et on enregistre la nouvelle valeur
                int nombre = convertirEnIntMoins(txtVitesse.Text);
                txtVitesse.Text = nombre.ToString();

                if (nombre == 0)
                {
                    btnMoinsVitesse.IsEnabled = false;
                }
            }

        }

        //Méthode lorsque le bouton moins de défense est cliqué
        private void btnMoinsDefense_Click(object sender, RoutedEventArgs e)
        {
            //Si la vie est égale à 0, on désactive le bouton immédiatement et on remet la valeur à 0
            if (txtDefense.Text == VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur.ToString())
            {
                btnMoinsDefense.IsEnabled = false;
                txtDefense.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur.ToString();
            }
            else
            {
                //On effectue les calculs relié au points restants
                btnMoinsClique();

                //On converti, on calcule et on enregistre la nouvelle valeur
                int nombre = convertirEnIntMoins(txtDefense.Text);
                txtDefense.Text = nombre.ToString();

                if (nombre == 0)
                {
                    btnMoinsDefense.IsEnabled = false;
                }
            }
        }

        //Méthode lorsque le bouton plus de force est cliqué
        private void btnPlusForce_Click(object sender, RoutedEventArgs e)
        {
            //On effectue les calculs relié au points restants
            btnPlusClique();

            //On converti, on calcule et on enregistre la nouvelle valeur
            int nombre = convertirEnIntPlus(txtForce.Text);
            txtForce.Text = nombre.ToString();

            if (txtForce.Text != VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur.ToString())
            {
                btnMoinsForce.IsEnabled = true;
            }

        }

        //Méthode lorsque le bouton plus de énergie est cliqué
        private void btnPlusEnergie_Click(object sender, RoutedEventArgs e)
        {
            //On effectue les calculs relié au points restants
            btnPlusClique();

            //On converti, on calcule et on enregistre la nouvelle valeur
            int nombre = convertirEnIntPlus(txtEnergie.Text);
            txtEnergie.Text = nombre.ToString();

            if (txtEnergie.Text != VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur.ToString())
            {
                btnMoinsEnergie.IsEnabled = true;
            }
        }

        //Méthode lorsque le bouton plus de vie est cliqué
        private void btnPlusVie_Click(object sender, RoutedEventArgs e)
        {
            //On effectue les calculs relié au points restants
            btnPlusClique();

            //On converti, on calcule et on enregistre la nouvelle valeur
            int nombre = convertirEnIntPlus(txtVie.Text);
            txtVie.Text = nombre.ToString();

            if (txtVie.Text != VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur.ToString())
            {
                btnMoinsVie.IsEnabled = true;
            }
        }

        //Méthode lorsque le bouton plus de vitesse est cliqué
        private void btnPlusVitesse_Click(object sender, RoutedEventArgs e)
        {
            //On effectue les calculs relié au points restants
            btnPlusClique();

            //On converti, on calcule et on enregistre la nouvelle valeur
            int nombre = convertirEnIntPlus(txtVitesse.Text);
            txtVitesse.Text = nombre.ToString();

            if (txtVitesse.Text != VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur.ToString())
            {
                btnMoinsVitesse.IsEnabled = true;
            }
        }

        //Méthode lorsque le bouton plus de défense est cliqué
        private void btnPlusDefense_Click(object sender, RoutedEventArgs e)
        {
            //On effectue les calculs relié au points restants
            btnPlusClique();

            //On converti, on calcule et on enregistre la nouvelle valeur
            int nombre = convertirEnIntPlus(txtDefense.Text);
            txtDefense.Text = nombre.ToString();

            if (txtDefense.Text != VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur.ToString())
            {
                btnMoinsDefense.IsEnabled = true;
            }
        }

        private void btnModifier_Click(object sender, RoutedEventArgs e)
        {
            CaracteristiqueService carService = new CaracteristiqueService();
            carService.MiseAJourCaracteristiques(Convert.ToInt32(txtForce.Text), Convert.ToInt32(txtVitesse.Text), Convert.ToInt32(txtEnergie.Text), Convert.ToInt32(txtVie.Text), Convert.ToInt32(txtDefense.Text));
            
            if (MessageBox.Show("Les caracétristiques de votre personnage ont été mises à jour avec succès!", "Nouvelle caractéristiques", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK) 
            {
                VarGlobales.femerModifCaracteristique = true;
            }
        }
    }
}
