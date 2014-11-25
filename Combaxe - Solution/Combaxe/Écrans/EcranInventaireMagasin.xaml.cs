using Combaxe___New.classes;
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

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Interaction logic for EcranInventaireMagasin.xaml
    /// </summary>
    public partial class EcranInventaireMagasin : Window
    {
        public EcranInventaireMagasin()
        {
            InitializeComponent();
            chargerPersonnage();
            chargerEquipement();
        }

        private void btnRetour_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.playClique();
            var MenuPrincipal = new EcranMenuPrincipal();
            MenuPrincipal.Show();
            this.Close();
        }

        /// <summary>
        /// Fonciton qui charge le personnage (Son inventaire, les équipements portés et ses caractéristiques
        /// </summary>
        private void chargerPersonnage()
        {
            majCaracteristiques();
            txtbArgent.Text = VarGlobales.Personnage.Inventaire.argent.ToString()+"$";
            txtbNiveau.Text = VarGlobales.Personnage.Niveau.ToString();
            txtbProfession.Text = VarGlobales.Personnage.profession.Nom.ToString();
            
        }

        /// <summary>
        /// Fonction qui va inscrire dans les champs de caractéristique les valeurs
        /// </summary>
        private void majCaracteristiques()
        {
            txtbForce.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur.ToString();
            txtbEnergie.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur.ToString();
            txtbVie.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur.ToString();
            txtbVitesse.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur.ToString();
            txtbDefense.Text = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur.ToString();
            txtbBarreVie.Text = "Points de vie (PV): " + VarGlobales.Personnage.Vie.ToString() + "/" + VarGlobales.Personnage.VieMaximale.ToString();
            txtbBarreEnergie.Text = "Points d'énergie (PE): " + VarGlobales.Personnage.Energie.ToString() + "/" + VarGlobales.Personnage.EnergieMaximale.ToString();
        }

        /// <summary>
        /// Charge les equipements dans l'inventaire du personnage
        /// </summary>
        private void chargerEquipement()
        {
            Border border;
            Image equipement;
            for (int i = 0; i < 4; i++)
            {
                for (int j = 0; j < 4; j++)
                {
                    border = new Border();
                    border.BorderThickness = new Thickness(1);
                    border.BorderBrush = Brushes.Black;
                    border.Name = "border" + (i + j);
                    Grid.SetColumn(border, j);
                    Grid.SetRow(border, i);

                    if (((i * 4)+j) < VarGlobales.Personnage.Inventaire.listeEquipement.Count())
                    {
                        equipement = new Image();
                        equipement.ToolTip = "Nom: " + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].Nom
                                + "\n Dégat: " + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].DegatMin+ " - " + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].DegatMax
                                + "\n Prix: " + Math.Round(VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].Prix/1.131416,2) + "$";
                        equipement.Source = new BitmapImage(new Uri(VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].ImageUrl));
                        equipement.Name = "equipement"+((i*4) + j);
                        equipement.AllowDrop = true;
                        Grid.SetColumn(equipement, j);
                        Grid.SetRow(equipement, i);
                        GridInventaire.Children.Add(equipement);
                    }

                    GridInventaire.Children.Add(border);
                }
            }
        }
    }
}
