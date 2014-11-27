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
using Combaxe___New.classes.services;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Interaction logic for EcranInventaireMagasin.xaml
    /// </summary>
    public partial class EcranInventaireMagasin : Window
    {
        PersonnageService personnageService = new PersonnageService();
        InventaireService inventaireService = new InventaireService();

        private Image dragImage;
        private Point startDragPoint;
        private Uri url = new Uri(System.AppDomain.CurrentDomain.BaseDirectory + "resources/images/objets/coffre.png", UriKind.RelativeOrAbsolute);
        private List<Equipement> equipementInventaire = new List<Equipement>();
        private List<Equipement> equipementUtilise = VarGlobales.Personnage.Inventaire.listeEquipementUtilise;
        private const int MAXEQUIPEMENTPORTE = 8;
        private const int MARGIN = 2;

        public EcranInventaireMagasin()
        {
            InitializeComponent();
            chargerPersonnage();
            chargerEquipementInventaire();
            chargerEquipementPorte();
        }

        private void btnRetour_Click_1(object sender, RoutedEventArgs e)
        {
            personnageService.MAJEquipementPersonnage(equipementUtilise);
            inventaireService.MAJEquipementInventaire(equipementInventaire);
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

        private void chargerEquipementPorte()
        {
            Image equipement = new Image(); ;
            GridEquiper.Children.Clear();
            borderEquipementPorte();
            for (int i = 1; i <= MAXEQUIPEMENTPORTE; i++)
            {
                switch(i)
                {
                    case (int)Modele.Modeles.ArmeUneMain:
                        //(Image equipement, int idModele, int colonne, int rangée, string span)
                        attribueImage(equipement, i, 0, 1, "row");
                        break;
                    case (int)Modele.Modeles.Bottes:
                        //(Image equipement, int idModele, int colonne, int rangée, string span)
                        attribueImage(equipement, i, 2, 2, "");
                        break;
                    case (int)Modele.Modeles.Bouclier:
                        //(Image equipement, int idModele, int colonne, int rangée, string span)
                        attribueImage(equipement, i, 3, 1, "row");
                        break;
                    case (int)Modele.Modeles.Casque:
                        //(Image equipement, int idModele, int colonne, int rangée, string span)
                        attribueImage(equipement, i, 1, 0, "column");
                        break;
                    case (int)Modele.Modeles.Épaulette:
                        //(Image equipement, int idModele, int colonne, int rangée, string span)
                        attribueImage(equipement, i, 0, 0, "");
                        break;
                    case (int)Modele.Modeles.Pantalon:
                        //(Image equipement, int idModele, int colonne, int rangée, string span)
                        attribueImage(equipement, i, 1, 2, "");
                        break;
                    case (int)Modele.Modeles.Plastron:
                        //(Image equipement, int idModele, int colonne, int rangée, string span)
                        attribueImage(equipement, i, 1, 1, "column");
                        break;
                }
            }
        }

        /// <summary>
        /// Charge les equipements dans l'inventaire du personnage
        /// </summary>
        private void chargerEquipementInventaire()
        {
            Border border;
            Image equipement;
            if (equipementInventaire.Count() == 0)
            {
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

                        if (((i * 4) + j) < VarGlobales.Personnage.Inventaire.listeEquipement.Count())
                        {
                            equipement = new Image();
                            equipement.Name = "e" + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].IdEquipement.ToString();
                            equipement.ToolTip = "Nom: " + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].Nom
                                    + "\n Dégat: " + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].DegatMin + " - " + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].DegatMax
                                    + "\n Prix: " + Math.Round(VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].Prix / 1.131416, 2) + "$\n";
                            equipement.Source = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].ImageUrl, UriKind.RelativeOrAbsolute));
                            equipement.Tag = VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j].IdEquipement;
                            equipement.PreviewMouseMove += equipement_PreviewMouseMove;
                            equipement.DragEnter += equipement_DragEnter;
                            equipement.PreviewMouseLeftButtonDown += equipement_PreviewMouseLeftButtonDown;
                            equipement.Drop += equipement_Drop;
                            Grid.SetColumn(equipement, j);
                            Grid.SetRow(equipement, i);
                            GridInventaire.Children.Add(equipement);
                            equipementInventaire.Add(VarGlobales.Personnage.Inventaire.listeEquipement[(i * 4) + j]);
                        }

                        GridInventaire.Children.Add(border);
                    }
                }
            }
            else
            {
                GridInventaire.Children.Clear();
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
                        GridInventaire.Children.Add(border);

                        if (((i * 4) + j) < equipementInventaire.Count())
                        {
                            equipement = new Image();
                            equipement.ToolTip = "Nom: " + equipementInventaire[(i * 4) + j].Nom
                                    + "\n Dégat: " + equipementInventaire[(i * 4) + j].DegatMin + " - " + equipementInventaire[(i * 4) + j].DegatMax
                                    + "\n Prix: " + Math.Round(equipementInventaire[(i * 4) + j].Prix / 1.131416, 2) + "$\n";
                            equipement.Source = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + equipementInventaire[(i * 4) + j].ImageUrl, UriKind.RelativeOrAbsolute));
                            equipement.Tag = equipementInventaire[(i * 4) + j].IdEquipement;
                            equipement.PreviewMouseMove += equipement_PreviewMouseMove;
                            equipement.DragEnter += equipement_DragEnter;
                            equipement.PreviewMouseLeftButtonDown += equipement_PreviewMouseLeftButtonDown;
                            equipement.Drop += equipement_Drop;
                            Grid.SetColumn(equipement, j);
                            Grid.SetRow(equipement, i);
                            GridInventaire.Children.Add(equipement);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Verifie si l'équipement fait partie de l'inventaire
        /// </summary>
        /// <param name="idEquipement">Le id de l'équipement qui est recherché</param>
        /// <returns>Retourne true si l'équipement est dans l'inventaire</returns>
        private bool estDansInventaire(int idEquipement)
        {
            bool estDansInventaire = false;

            for (int i = 0; i < equipementInventaire.Count(); i++)
            {
                if(equipementInventaire[i].IdEquipement == idEquipement)
                {
                    estDansInventaire = true;
                    break;
                }
            }

            return estDansInventaire;
        }

        /// <summary>
        /// Ajoute l'équipement inventaire dans la liste d'équipement porté et le supprime de la liste d'équipement inventaire
        /// Ajoute l'équipement porté dans la liste d'équipement inventaire et le supprime de la liste d'équipement porté
        /// </summary>
        /// <param name="idEquipementInventaire">Le id de l'équipement qui était dans l'inventaire</param>
        private void equiperEquipement(int idEquipementInventaire)
        {
            Equipement unEquipementPorte = new Equipement();
            Equipement unEquipementInventaire = new Equipement();

            //trouve et va chercher les informations de l'équipement de l'inventaire
            for (int i = 0; i < equipementInventaire.Count; i++)
            {
                if(equipementInventaire[i].IdEquipement==idEquipementInventaire)
                {
                    unEquipementInventaire = equipementInventaire[i];
                    //Supprime l'équipement de la liste d'équipement de l'inventaire
                    equipementInventaire.RemoveAt(i);
                    break;
                }
            }

            //trouve et va chercher les informations de l'équipement porté
            for (int i = 0; i < equipementUtilise.Count; i++)
            {
                if (equipementUtilise[i].Modele.IdModele == unEquipementInventaire.Modele.IdModele)
                {
                    unEquipementPorte = equipementUtilise[i];
                    //Supprime l'équipement de la liste d'équipement porté
                    equipementUtilise.RemoveAt(i);
                    //On ajoute unEquipementPorte dans la liste d'equipementInventaire
                    equipementInventaire.Add(unEquipementPorte);
                    break;
                }
            }
            //On ajoute unEquipementInventaire dans la liste d'equipementUtilise
            equipementUtilise.Add(unEquipementInventaire);

            chargerEquipementInventaire();
            chargerEquipementPorte();
        }

        void equipement_PreviewMouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                Point position = e.GetPosition(null);

                if (Math.Abs(position.X - startDragPoint.X) >
                        SystemParameters.MinimumHorizontalDragDistance ||
                    Math.Abs(position.Y - startDragPoint.Y) >
                        SystemParameters.MinimumVerticalDragDistance)
                {
                    if (dragImage!=null)
                    {
                        if (dragImage.Source.ToString() != url.ToString())
                        {
                            DataObject data = new DataObject(typeof(ImageSource), dragImage.Source);
                            DragDrop.DoDragDrop(dragImage, data, DragDropEffects.Move);
                        }
                    }
                }
            }
        }

        void equipement_Drop(object sender, DragEventArgs e)
        {
            Image dropImage = e.Source as Image;
            Image tempo = new Image();
            tempo.Tag = dragImage.Tag;
            if (dropImage.Source.ToString() != url.ToString())
            {
                if (!estDansInventaire((int)dropImage.Tag))
                {
                    equiperEquipement((int)dragImage.Tag);
                }
                else
                {
                    chargerEquipementInventaire();
                }
            }
            else
            {
                equiperEquipement((int)dragImage.Tag);
            }
            VarGlobales.Personnage.Inventaire.listeEquipement = equipementInventaire;
            VarGlobales.Personnage.Inventaire.listeEquipementUtilise = equipementUtilise;
        }

        void equipement_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            dragImage = e.Source as Image;
            startDragPoint = e.GetPosition(null);
        }

        void equipement_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(typeof(DataObject)))
            {
                e.Effects = DragDropEffects.Copy;
            }
            else
            {
                e.Effects = DragDropEffects.None;
            }
        }

        /// <summary>
        /// Créer les borders du grid équipement utilisé
        /// </summary>
        private void borderEquipementPorte()
        {
            Border border=new Border();

            //ÉPAULE
            //(Border border, int colonne, int rangée, string span)
            borderEquipementUtilise(border, 0, 0, "");

            //TÊTE
            //(Border border, int colonne, int rangée, string span)
            borderEquipementUtilise(border, 1, 0, "column");

            //ARME 1
            //(Border border, int colonne, int rangée, string span)
            borderEquipementUtilise(border, 0, 1, "row");

            //TORSE
            //(Border border, int colonne, int rangée, string span)
            borderEquipementUtilise(border, 1, 1, "column");

            //Bouclier
            //(Border border, int colonne, int rangée, string span)
            borderEquipementUtilise(border, 3, 1, "row");

            //JAMBE
            //(Border border, int colonne, int rangée, string span)
            borderEquipementUtilise(border, 1, 3, "");

            //PIED
            //(Border border, int colonne, int rangée, string span)
            borderEquipementUtilise(border, 2, 2, "");
        }

        /// <summary>
        /// Fonction qui créer le border de l'équipement équipé et l'insère dans le gridÉquiper
        /// </summary>
        /// <param name="border">Le border</param>
        /// <param name="column">Son colonne du grid</param>
        /// <param name="row">La rangée du grid</param>
        /// <param name="span">String qui dit si le span est avec la row ou avec le column</param>
        private void borderEquipementUtilise(Border border, int column, int row, string span)
        {
            Thickness margin;
            border = new Border();
            border.BorderThickness = new Thickness(1);
            border.BorderBrush = Brushes.Black;
            margin = border.Margin;
            margin.Left = MARGIN;
            margin.Bottom = MARGIN;
            margin.Right = MARGIN;
            margin.Top = MARGIN;
            border.Margin = margin;
            //Détermine dans quel colonne du grid et rangée du grid se trouvera le border
            Grid.SetColumn(border, column);
            Grid.SetRow(border, row);
            //Si le border nécessite un rowspan ou un columnspan
            if (span == "row")
            {
                Grid.SetRowSpan(border, 2);
            }
            else if (span == "column")
            {
                Grid.SetColumnSpan(border, 2);
            }

            //On ajoute le border dans le grid
            GridEquiper.Children.Add(border);
        }

        private void attribueImage(Image equipement, int idModele, int column, int row, string span)
        {
            if (equipementUtilise.Count != 0)
            {
                Equipement leEquipement = null;

                for (int i = 0; i < equipementUtilise.Count; i++)
                {
                    if(idModele == equipementUtilise[i].Modele.IdModele || (idModele == (int)Modele.Modeles.ArmeUneMain && (int)Modele.Modeles.ArmeDeuxMains == equipementUtilise[i].Modele.IdModele))
                    {
                        leEquipement = equipementUtilise[i];
                    }
                }
                if (leEquipement != null)
                {
                    equipement = new Image();
                    equipement.Source = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + leEquipement.ImageUrl, UriKind.RelativeOrAbsolute));
                    equipement.Tag = leEquipement.IdEquipement;
                    equipement.AllowDrop = true;
                    equipement.Drop += equipement_Drop;
                    Grid.SetColumn(equipement, column);
                    Grid.SetRow(equipement, row);
                    equipement.ToolTip = "Nom: " + leEquipement.Nom;

                    if (leEquipement.Modele.IdModele == (int)Modele.Modeles.ArmeDeuxMains || leEquipement.Modele.IdModele == (int)Modele.Modeles.ArmeUneMain)
                    {
                            equipement.ToolTip += "\n Dégat: " + leEquipement.DegatMin + " - " + leEquipement.DegatMax;
                    }

                    if (span == "row")
                    {
                        Grid.SetRowSpan(equipement, 2);
                        equipement.VerticalAlignment = VerticalAlignment.Center;
                    }
                    else if (span == "column")
                    {
                        Grid.SetColumnSpan(equipement, 2);
                        equipement.HorizontalAlignment = HorizontalAlignment.Center;
                    }
                    GridEquiper.Children.Add(equipement);
                }
                else
                {
                    imageBase(column, row, span);
                }
            }
            else
            {
                imageBase(column, row, span);
            }
        }

        private void imageBase(int column, int row, string span)
        {
            Image equipement = new Image();
            equipement.Source = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + "resources/images/objets/coffre.png", UriKind.RelativeOrAbsolute));
            equipement.AllowDrop = true;
            equipement.PreviewMouseMove += equipement_PreviewMouseMove;
            equipement.Drop += equipement_Drop;

            Grid.SetColumn(equipement, column);
            Grid.SetRow(equipement, row);
            if (span == "row")
            {
                Grid.SetRowSpan(equipement, 2);
                equipement.VerticalAlignment = VerticalAlignment.Center;
            }
            else if (span == "column")
            {
                Grid.SetColumnSpan(equipement, 2);
                equipement.HorizontalAlignment = HorizontalAlignment.Center;
            }
            GridEquiper.Children.Add(equipement);
        }
    }
}
