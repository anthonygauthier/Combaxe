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
using Combaxe___New.classes.services;
using System.Text.RegularExpressions;
using System.IO;
using System.Windows.Ink;
using System.Windows.Threading;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Logique d'interaction pour creationPersonnage.xaml
    /// </summary>
    public partial class EcranCreationPersonnage : Window
    {
        public EcranCreationPersonnage()
        {
            InitializeComponent();
            
            //L'utilisateur n'a pas choisi de profession, alors tous les boutons de caractéristiques ou d'image sont désactivés
            disableBtnMoins();
            disableBtnPlus();
            comboBox(); // POUR LA TAILLE de la plume 
        }
        //Lorsque la page s'initialise, on initie une connexion à la BD - Anthony Gauthier 09/10/2014
        PersonnageService personnageService = new PersonnageService();
        ProfessionService professionService = new ProfessionService();
        CaracteristiqueService caracteristiqueService = new CaracteristiqueService();

        DispatcherTimer aideTimer;
        int profession = 0;

        //----------------------------------MÉTHODES---------------------------------

        //Méthode qui vide le TextBox du nom de personnage lorsque celle-ci a le focus
        private void txtbNom_GotKeyboardFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            txtbNom.Text = string.Empty;
        }



        //Méthode lorsque le bouton Guerrier est cliqué
        private void btnGuerrier_Click(object sender, RoutedEventArgs e)
        {
            //Va chercher les caractéristiques de bases du guerrier
            List<string>[] caracteristiquesGuer = caracteristiqueService.RetrieveCaracteristiqueBase(btnGuerrier.Content.ToString());

            txtbDescriptionProf.Text += "Description de la profession\n";
            txtbDescriptionProf.Text += "-------------------------------------------------\n";
            //Change la description
            txtbDescriptionProf.Text += professionService.selectionDescription(btnGuerrier.Content.ToString());
            descriptionCaracteristique("Guerrier");

            //Change les caractéristiques pour les caractéristiques proposées pour paladin
            txtForce.Text = caracteristiquesGuer[0][0];
            txtDefense.Text = caracteristiquesGuer[1][0];
            txtVie.Text = caracteristiquesGuer[2][0];
            txtVitesse.Text = caracteristiquesGuer[3][0];
            txtEnergie.Text = caracteristiquesGuer[4][0];
            profession = professionService.RetrieveIdProfession(btnGuerrier.Content.ToString());
            enableBtnMoins();
            enableBtnPlus();
            //imagePersonnage.Source = new BitmapImage(new Uri(@"../images/guerrier.png", UriKind.RelativeOrAbsolute));
        }

        //Méthode lorsque le bouton Paladin est cliqué
        private void btnPaladin_Click(object sender, RoutedEventArgs e)
        {
            //Va chercher les caractéristiques de bases du paladin
            List<string>[] caracteristiquesPal = caracteristiqueService.RetrieveCaracteristiqueBase(btnPaladin.Content.ToString());

            txtbDescriptionProf.Text += "Description de la profession\n";
            txtbDescriptionProf.Text += "-------------------------------------------------\n";
            //Change la description
            txtbDescriptionProf.Text += professionService.selectionDescription(btnPaladin.Content.ToString());
            descriptionCaracteristique("Paladin");

            //Change les caractéristiques pour les caractéristiques proposées pour paladin
            txtForce.Text = caracteristiquesPal[0][0];
            txtDefense.Text = caracteristiquesPal[1][0];
            txtVie.Text = caracteristiquesPal[2][0];
            txtVitesse.Text = caracteristiquesPal[3][0];
            txtEnergie.Text = caracteristiquesPal[4][0];
            profession = professionService.RetrieveIdProfession(btnPaladin.Content.ToString());
            enableBtnMoins();
            enableBtnPlus();
            //imagePersonnage.Source = new BitmapImage(new Uri(@"../images/paladin.png", UriKind.RelativeOrAbsolute));
        }

        //Méthode lorsque le bouton Magicien est cliqué
        private void btnMagicien_Click(object sender, RoutedEventArgs e)
        {
            //Va chercher les caractéristiques de bases du magicien
            List<string>[] caracteristiquesMagi = caracteristiqueService.RetrieveCaracteristiqueBase(btnMagicien.Content.ToString());

            txtbDescriptionProf.Text += "Description de la profession\n";
            txtbDescriptionProf.Text += "-------------------------------------------------\n";
            //Change la description
            txtbDescriptionProf.Text += professionService.selectionDescription(btnMagicien.Content.ToString());
            descriptionCaracteristique("Magicien");

            //Change les caractéristiques pour les caractéristiques proposées pour magicien
            txtForce.Text = caracteristiquesMagi[0][0];
            txtDefense.Text = caracteristiquesMagi[1][0];
            txtVie.Text = caracteristiquesMagi[2][0];
            txtVitesse.Text = caracteristiquesMagi[3][0];
            txtEnergie.Text = caracteristiquesMagi[4][0];
            profession = professionService.RetrieveIdProfession(btnMagicien.Content.ToString());
            enableBtnMoins();
            enableBtnPlus();
            //imagePersonnage.Source = new BitmapImage(new Uri(@"../images/magicien.png", UriKind.RelativeOrAbsolute));
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
            //Si le nombre de points restants est égale à 0
            if (txtbPointsRestants.Text == "30")
            {
                //Si le nombre de points restant est égal à 30, on désactive les boutons moins
                disableBtnMoins();
            }
            else
            {
                //On converti la string en nombre et on enregistre ce nombre dans le textbox
                int Nombre = convertirEnIntPlus(txtbPointsRestants.Text);
                txtbPointsRestants.Text = Nombre.ToString();

                //On vérifie maintenant si le nombre de points restant est de 0
                if (Nombre == 30)
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
            if (txtForce.Text == "0")
            {
                btnMoinsForce.IsEnabled = false;
                txtForce.Text = "0";
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
            if (txtEnergie.Text == "0")
            {
                btnMoinsEnergie.IsEnabled = false;
                txtEnergie.Text = "0";
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
            if (txtVie.Text == "0")
            {
                btnMoinsVie.IsEnabled = false;
                txtVie.Text = "0";
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
            if (txtVitesse.Text == "0")
            {
                btnMoinsVitesse.IsEnabled = false;
                txtVitesse.Text = "0";
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
            if (txtDefense.Text == "0")
            {
                btnMoinsDefense.IsEnabled = false;
                txtDefense.Text = "0";
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

            if (txtForce.Text != "0")
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

            if (txtEnergie.Text != "0")
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

            if (txtVie.Text != "0")
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

            if (txtVitesse.Text != "0")
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

            if (txtDefense.Text != "0")
            {
                btnMoinsDefense.IsEnabled = true;
            }
        }

        //Méthode qui est activé lorsque le bouton "Créer personnage" est cliqué
        private void btnCreerPerso_Click(object sender, RoutedEventArgs e)
        {
            if (verificationChamps())
            {
                sauve(txtbNom.Text);
                int id = personnageService.CreerPersonnage(Int32.Parse(txtForce.Text), Int32.Parse(txtDefense.Text), Int32.Parse(txtVie.Text), Int32.Parse(txtEnergie.Text), Int32.Parse(txtVitesse.Text), profession, txtbNom.Text);
                VarGlobales.Personnage = personnageService.selectionUnPersonnage(id);
                VarGlobales.HeureConnexion = DateTime.Now;
                VarGlobales.ChoixPersoFait = true;
                var MenuPrincipal = new EcranMenuPrincipal();
                MenuPrincipal.Show();
                this.Close();
            }
        }

        //Méthode qui effectue le comportement du bouton retour
        private void btnRetour_Click(object sender, RoutedEventArgs e)
        {
            //Si le joueur a des personnages, on le retourne à l'écran de choix du personnage
            if (VarGlobales.aPersonnage)
            {
                var choixPerso = new EcranChangementPerso();
                choixPerso.Show();
                this.Close();
            }
            //Sinon, on retourne à l'écran de connexion et on le déconnecte
            else
            {
                VarGlobales.Joueur.Deconnexion();
                var connexion = new MainWindow();
                connexion.Show();
                this.Close();
            }
        }

        //Méthode qui vérifie si tous les champs ont été remplis
        private bool verificationChamps()
        {
            Regex rgx = new Regex("^[a-zA-Z]+$", RegexOptions.IgnoreCase);
            Match match = rgx.Match(txtbNom.Text);

            //Si l'utilisateur n'a pas entré de nom de personnage
            if (txtbNom.Text == "" || txtbNom.Text == " ")
            {
                MessageBox.Show("Votre nom de personnage ne contient rien.", "Erreur lors de la création du personnage", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (txtbNom.Text.Length < 3)
            {
                MessageBox.Show("Votre nom de personnage ne peut pas contenir moins de 3 lettres.", "Erreur lors de la création du personnage", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (txtbNom.Text.Length > 20)
            {
                MessageBox.Show("Votre nom de personnage ne peut pas contenir plus de 20 lettres.", "Erreur lors de la création du personnage", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (!match.Success)
            {
                MessageBox.Show("Votre nom de personnage ne peut contenir que des lettres.", "Erreur lors de la création du personnage", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (txtbPointsRestants.Text != "0")
            {
                MessageBox.Show("Vous devez placer tous vos points de caractéristiques, il vous en reste " + txtbPointsRestants.Text + " à placer.", "Erreur lors de la création du personnage", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (txtDefense.Text == "0" && txtVie.Text == "0" && txtVitesse.Text == "0" && txtForce.Text == "0" && txtEnergie.Text == "0")
            {
                MessageBox.Show("Vous devez choisir une profession.", "Erreur lors de la création du personnage", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else if (personnageService.RetrieveExistancePersonnage(txtbNom.Text))
            {
                MessageBox.Show("Le nom de personnage que vous avez choisi existe déjà.", "Erreur lors de la création du personnage", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Pour changer la couleur du pointeur, tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void _colorPicker_SelectedColorChanged(object sender, RoutedPropertyChangedEventArgs<Color> e)
        {
            _personnageDessin.DefaultDrawingAttributes.Color = _colorPicker.SelectedColor;
        }

        /// <summary>
        /// Pour sauvegarder l'image créé, tommy gingras
        /// </summary>
        /// <param name="nom">le nom du personnage</param>
        private void sauve(string nom)
        {
            // Save document
            string filename = "resources\\images\\personnages\\"+nom+".jpg";
            //get the dimensions of the ink control
            int margin = (int)this._personnageDessin.Margin.Left;
            int width = (int)this._personnageDessin.ActualWidth - margin;
            int height = (int)this._personnageDessin.ActualHeight - margin;
            //render ink to bitmap
            RenderTargetBitmap rtb =
            new RenderTargetBitmap(width, height, 96d, 96d, PixelFormats.Default);
            rtb.Render(_personnageDessin);
            Directory.CreateDirectory("resources\\images\\personnages");

            using (FileStream fs = new FileStream(filename, FileMode.CreateNew))
            {
                BmpBitmapEncoder encoder = new BmpBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(rtb));
                encoder.Save(fs);    
            }
        }

        /// <summary>
        /// Pour changer la grosseur du pointeur , tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void choixPointeur_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int taille = Convert.ToInt32(choixPointeur.SelectedItem.ToString().Substring(0, 2));
            _personnageDessin.DefaultDrawingAttributes.Height = taille;
            _personnageDessin.DefaultDrawingAttributes.Width = taille;

        }

        /// <summary>
        /// Pour mettre les sortes de pointeur dans la liste, tommy gingras 
        /// </summary>
        private void comboBox()
        {
            choixPointeur.Items.Add("5 mm");
            choixPointeur.Items.Add("7 mm");
            choixPointeur.Items.Add("9 mm");
            choixPointeur.Items.Add("11 mm");
            choixPointeur.Items.Add("13 mm");
            choixPointeur.Items.Add("15 mm");
            choixPointeur.SelectedIndex = 0;
        }

        /// <summary>
        /// POur mettre le pointeur carré, tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRectangle_Click(object sender, RoutedEventArgs e)
        {
            _personnageDessin.DefaultDrawingAttributes.StylusTip = System.Windows.Ink.StylusTip.Rectangle;
        }

        /// <summary>
        /// Pour mettre le pointeur rond, tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEllipse_Click(object sender, RoutedEventArgs e)
        {
            _personnageDessin.DefaultDrawingAttributes.StylusTip = System.Windows.Ink.StylusTip.Ellipse;
        }

        /// <summary>
        /// Pour tout supprimer le jolie dessin, tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void toutSupprimer_Click(object sender, RoutedEventArgs e)
        {
            StrokeCollection selectedStrokes = _personnageDessin.GetSelectedStrokes();
            if (selectedStrokes.Count == 0)
            {
                if (MessageBox.Show("Voulez-vous tout supprimer ?","Suppresion du jolie dessin", MessageBoxButton.OKCancel, MessageBoxImage.Question) == MessageBoxResult.OK)
                {
                    _personnageDessin.Strokes.Clear();
                }
                return;
            }
            else
            {
                _personnageDessin.Strokes.Remove(selectedStrokes);
            }
        }

        /// <summary>
        /// Fonction qui affiche les compétences d'une profession et comment optimiser son efficacité - Anthony Gauthier
        /// </summary>
        /// <param name="nomProfession">Recoit le nom de la profession</param>
        private void descriptionCaracteristique(string nomProfession)
        { 
            List<Competence> lstCompetence;
            CompetenceService compService = new CompetenceService();
            CaracteristiqueService carService = new CaracteristiqueService();
            int id = professionService.RetrieveIdProfession(nomProfession);

            lstCompetence = compService.RetrieveCompetenceUnPersonnage(id);
            txtbDescriptionProf.Text += "\n\n";

            txtbDescriptionProf.Text += "Description caractéristique\n";
            txtbDescriptionProf.Text += "-------------------------------------------------\n";
            txtbDescriptionProf.Text += Caracteristiques.Force.ToString() + ": Augmente les dégâts infligés par les compétences physiques.\n";
            txtbDescriptionProf.Text += Caracteristiques.Vie.ToString() + ": Augmente les points de vie du personnage.\n";
            txtbDescriptionProf.Text += Caracteristiques.Vitesse.ToString() + ": Définit qui commence un combat, augment les chances d'esquive et de coups critiques.\n";
            txtbDescriptionProf.Text += Caracteristiques.Defense.ToString() + ": Augmente la réduction des dégâts qui vous sont infligés.\n";
            txtbDescriptionProf.Text += Caracteristiques.Energie.ToString() + ": Augmente les dégâts infligés par les compétences magiques.\n\n";
            
            txtbDescriptionProf.Text += "Compétences et optimisation des caractéristiques\n";
            txtbDescriptionProf.Text += "-------------------------------------------------\n";
            txtbDescriptionProf.Text += lstCompetence[0].Nom + ": Inflige quelques dégâts physiques - Efficacité augmenté par la force.\n";

            switch(nomProfession)
            {
                case "Guerrier":
                    txtbDescriptionProf.Text += lstCompetence[1].Nom + ": Restore des points de vie - Efficacité augmenté par l'énergie.\n";
                    txtbDescriptionProf.Text += lstCompetence[2].Nom + ": Inflige beaucoup de dégâts physiques - Efficacité augmenté par la force.\n";
                    txtbDescriptionProf.Text += lstCompetence[3].Nom + ": Inflige énormément de dégâts physiques - Efficacité augmenté par la force.\n";
                    break;
                case "Magicien":
                    txtbDescriptionProf.Text += lstCompetence[1].Nom + ": Inflige beaucoup de dégâts magiques - Efficacité augmenté par l'énergie.\n";
                    txtbDescriptionProf.Text += lstCompetence[2].Nom + ": Restore des points de vie - Efficacité augmenté par l'énergie.\n";
                    txtbDescriptionProf.Text += lstCompetence[3].Nom + ": Inflige énormément de dégâts magiques - Efficacité augmenté par l'énergie.\n";
                    break;
                case "Paladin":
                    txtbDescriptionProf.Text += lstCompetence[1].Nom + ": Inflige beaucoup de dégâts magiques - Efficacité augmenté par l'énergie.\n";
                    txtbDescriptionProf.Text += lstCompetence[2].Nom + ": Restore des points de vie - Efficacité augmenté par l'énergie.\n";
                    txtbDescriptionProf.Text += lstCompetence[3].Nom + ": Inflige énormément de dégâts magiques - Efficacité augmenté par l'énergie.\n";
                    break;
            }
        }

        /// <summary>
        /// Bouton pour mettre l'image du guerrier, tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnImageGuerrier_Click(object sender, RoutedEventArgs e)
        {
            _personnageDessin.Background = assignerImage("//resources//images//personnages//guerrier.png");
        }

        /// <summary>
        /// Bouton pour mettre l'image du paladin, tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnImagePaladin_Click(object sender, RoutedEventArgs e)
        {

            _personnageDessin.Background = assignerImage("//resources//images//personnages//paladin.png");

        }

        /// <summary>
        /// Bouton pour mettre l'image du mage, tommy gingras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnImageMage_Click(object sender, RoutedEventArgs e)
        {
            _personnageDessin.Background = assignerImage("//resources//images//personnages//mage.png");

        }

        private void btnImageDefaut_Click(object sender, RoutedEventArgs e)
        {
            _personnageDessin.Background = assignerImage("//resources//images//personnages//defaut.png");

        }

        private ImageBrush assignerImage(string lien)
        {
            ImageBrush ib = new ImageBrush();
            Directory.CreateDirectory("resources\\images\\personnages");
            if (File.Exists(System.AppDomain.CurrentDomain.BaseDirectory + lien))
                ib.ImageSource = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + lien, UriKind.RelativeOrAbsolute)); // fait par tommy gingras
            else
                ib.ImageSource = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + "//resources//images//personnages//defaut.png", UriKind.RelativeOrAbsolute)); // fait par tommy gingras
            return ib;
        }

        /// <summary>
        /// Fonction pour afficher l'aide en ligne
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAide_Click(object sender, RoutedEventArgs e)
        {
            TimeSpan tempsAide;
            VarGlobales.endroitAide = "Caracteristiques";
            var EcranAide = new EcranAide();

            tempsAide = TimeSpan.FromSeconds(999999);

            this.Opacity = 0.5;
            this.IsEnabled = false;
            this.Focusable = false;
            //Si le jeu n'est pas fullscreen
            if (this.WindowStyle != WindowStyle.None)
            {
                this.WindowStyle = WindowStyle.None;
                this.ResizeMode = ResizeMode.NoResize;
            }


            EcranAide.Show();

            aideTimer = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                //On enleve du temps au timer
                tempsAide = tempsAide.Add(TimeSpan.FromSeconds(-1));

                if (VarGlobales.QuitterAide == true)
                {
                    this.Opacity = 1;
                    this.IsEnabled = true;
                    this.Focusable = true;
                    VarGlobales.QuitterAide = false;
                    aideTimer.Stop();
                }
            }, Application.Current.Dispatcher);

            aideTimer.Start();
        }
    }
}
