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

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Logique d'interaction pour creationPersonnage.xaml
    /// </summary>
    public partial class creationPersonnage : Window
    {
        public creationPersonnage()
        {
            InitializeComponent();
        }
        //Lorsque la page s'initialise, on initie une connexion à la BD - Anthony Gauthier 09/10/2014
        BdService bdCombaxe = new BdService();

        //Méthode qui va chercher la description de la profession dans la BD et la retourne
        private string selectionDescription(string nom)
        { 
            string description = string.Empty;
            string requete = "SELECT description FROM professions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '" + nom + "');";
            List<string>[] maDescription;
            int nombreRange = 0;

            maDescription = bdCombaxe.selection(requete, 1, ref nombreRange);

            description = maDescription[0][0];

            return description;
        }

        //Méthode qui va chercher les caractéristiques de base de chaque profession
        private List<string>[] selectionCaracteristiqueBase(string nom)
        {
            string requete = "SELECT valeur FROM caracteristiquesprofessions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '"+nom+"');";
            List<string>[] mesCaracteristiques;
            int nombreRange = 0;

            mesCaracteristiques = bdCombaxe.selection(requete, 1,ref nombreRange);

            return mesCaracteristiques;
        }

        //Méthode qui vide le TextBox du nom de personnage lorsque celle-ci a le focus
        private void txtbNom_GotKeyboardFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            txtbNom.Text = string.Empty;
        }



        //Méthode lorsque le bouton Guerrier est cliqué
        private void btnGuerrier_Click(object sender, RoutedEventArgs e)
        {
            //Va chercher les caractéristiques de bases du guerrier
            List<string>[] caracteristiquesGuer = selectionCaracteristiqueBase(btnGuerrier.Content.ToString());

            //Change la description
            txtbDescriptionProf.Text = selectionDescription(btnGuerrier.Content.ToString());

            //Change les caractéristiques pour les caractéristiques proposées pour paladin
            txtForce.Text = caracteristiquesGuer[0][0];
            txtDefense.Text = caracteristiquesGuer[1][0];
            txtVie.Text = caracteristiquesGuer[2][0];
            txtVitesse.Text = caracteristiquesGuer[3][0];
            txtEnergie.Text = caracteristiquesGuer[4][0];
        }

        //Méthode lorsque le bouton Paladin est cliqué
        private void btnPaladin_Click(object sender, RoutedEventArgs e)
        {
            //Va chercher les caractéristiques de bases du paladin
            List<string>[] caracteristiquesPal = selectionCaracteristiqueBase(btnPaladin.Content.ToString());

            //Change la description
            txtbDescriptionProf.Text = selectionDescription(btnPaladin.Content.ToString());

            //Change les caractéristiques pour les caractéristiques proposées pour paladin
            txtForce.Text = caracteristiquesPal[0][0];
            txtDefense.Text = caracteristiquesPal[1][0];
            txtVie.Text = caracteristiquesPal[2][0];
            txtVitesse.Text = caracteristiquesPal[3][0];
            txtEnergie.Text = caracteristiquesPal[4][0];
            
        }

        //Méthode lorsque le bouton Magicien est cliqué
        private void btnMagicien_Click(object sender, RoutedEventArgs e)
        {
            //Va chercher les caractéristiques de bases du magicien
            List<string>[] caracteristiquesMagi = selectionCaracteristiqueBase(btnMagicien.Content.ToString());

            //Change la description
            txtbDescriptionProf.Text = selectionDescription(btnMagicien.Content.ToString());

            //Change les caractéristiques pour les caractéristiques proposées pour magicien
            txtForce.Text = caracteristiquesMagi[0][0];
            txtDefense.Text = caracteristiquesMagi[1][0];
            txtVie.Text = caracteristiquesMagi[2][0];
            txtVitesse.Text = caracteristiquesMagi[3][0];
            txtEnergie.Text = caracteristiquesMagi[4][0];  
        }
    }
}
