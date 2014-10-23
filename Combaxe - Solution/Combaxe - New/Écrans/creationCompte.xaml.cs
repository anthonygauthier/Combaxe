using Combaxe___New.écrans;
using MiniBD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

namespace Combaxe___New
{
    /// <summary>
    /// Logique d'interaction pour creationCompte.xaml
    /// </summary>
    public partial class creationCompte : Window
    {
        public creationCompte()
        {
            InitializeComponent();
        }

        private void btnRetour_Click(object sender, RoutedEventArgs e)
        {
            var connexion = new MainWindow();
            connexion.Show();
            this.Close();
        }

        //Méthode losrque le bouton de confirmation de création de compte est appuyé - William Themens 19/10/2014
        private void btnCreerCompte_Click(object sender, RoutedEventArgs e)
        {
            if(verificationChamps())
            {
                JoueurService joueurService = new JoueurService();
                joueurService.CreerJoueur(txtbNomUsager.Text,pwdboxMdp.Password);
                MessageBox.Show("Compte créer avec succès!", "Création de compte", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                var connexion = new MainWindow();
                connexion.Show();
                this.Close();
                
            }
        }

        //Méthode qui vérifie si les champs entrés pour la création de compte sont valide - William Themens 19/10/2014
        private bool verificationChamps()
        {
            JoueurService joueurService = new JoueurService();
            Regex alphanumerique = new Regex("^[a-zA-Z0-9]*$");

            txtbNomUsager.BorderBrush = new SolidColorBrush(Colors.Black);
            pwdboxMdp.BorderBrush = new SolidColorBrush(Colors.Black);
            pwdbConfirmMdp.BorderBrush = new SolidColorBrush(Colors.Black);

            /* DÉBUT DES VALIDATIONS DE L'USAGER */
            if (txtbNomUsager.Text == "")
            {
                MessageBox.Show("Votre compte doit posséder un nom d'usager","Erreur lors de la création de compte",MessageBoxButton.OK, MessageBoxImage.Error);
                txtbNomUsager.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (!alphanumerique.IsMatch(txtbNomUsager.Text))
            {
                MessageBox.Show("L'usager doit être composé seulement de caractères alphanumériques", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                txtbNomUsager.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (txtbNomUsager.Text.Length <3)
            {
                MessageBox.Show("L'usager doit être composé d'au moins 3 caractères alphanumériques", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                txtbNomUsager.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (txtbNomUsager.Text.Length > 20)
            {
                MessageBox.Show("L'usager doit être composé d'au plus 20 caractères alphanumériques", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                txtbNomUsager.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (joueurService.usagerDisponible(txtbNomUsager.Text))
            {
                MessageBox.Show("L'usager désiré existe déjà", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                txtbNomUsager.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }
            
            /* FIN DES VALIDATIONS DE L'USAGER */

            /* DÉBUT DES VALIDATIONS DU MOT DE PASSE */
            else if (pwdboxMdp.Password == "")
            {
                MessageBox.Show("Votre compte doit posséder un mot de passe", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                pwdboxMdp.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (!alphanumerique.IsMatch(pwdboxMdp.Password))
            {
                MessageBox.Show("Le mot de passe doit être composé seulement de caractères alphanumériques", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                pwdboxMdp.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (pwdboxMdp.Password.Length < 5)
            {
                MessageBox.Show("Le mot de passe doit être composé d'au moins 5 caractères alphanumériques", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                pwdboxMdp.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (pwdboxMdp.Password.Length > 30)
            {
                MessageBox.Show("Le mot de passe doit être composé d'au plus 30 caractères alphanumériques", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                pwdboxMdp.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }

            else if (pwdboxMdp.Password.ToUpper()!=pwdbConfirmMdp.Password.ToUpper())
            {
                MessageBox.Show("Votre mot de passe doit être le même que la confirmation", "Erreur lors de la création de compte", MessageBoxButton.OK, MessageBoxImage.Error);
                pwdboxMdp.BorderBrush = new SolidColorBrush(Colors.Red);
                pwdbConfirmMdp.BorderBrush = new SolidColorBrush(Colors.Red);
                return false;
            }
            /* FIN DES VALIDATIONS DU MOT DE PASSE */
            
            return true;
        }
    }
}
