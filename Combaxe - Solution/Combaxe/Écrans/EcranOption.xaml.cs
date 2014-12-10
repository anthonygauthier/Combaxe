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
using Combaxe___New.classes;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Interaction logic for EcranOption.xaml
    /// </summary>
    public partial class EcranOption : Window
    {
        public EcranOption()
        {
            InitializeComponent();
            txtbMax.Text = ((VarGlobales.delaiMax) - 1).ToString();
            txtbMin.Text = VarGlobales.delaiMin.ToString();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if(verificationNumerique())
            {
                VarGlobales.delaiMin = Convert.ToInt32(txtbMin.Text);
                VarGlobales.delaiMax = Convert.ToInt32(txtbMax.Text)+1;

                if(VarGlobales.delaiMax == 0)
                {
                    VarGlobales.delaiMax = 1;
                }

                if(VarGlobales.delaiMin == 0)
                {
                    VarGlobales.delaiMin = 1;
                }

                VarGlobales.Retour = true;
                this.Close();
            }
        }

        private bool verificationNumerique()
        {
            Regex rgx = new Regex("^[0-9]*$", RegexOptions.IgnoreCase);
            Match match = rgx.Match(txtbMin.Text);
            Match match2 = rgx.Match(txtbMax.Text);

            if (!match.Success)
            {
                if(MessageBox.Show("La valeur minimale doit être numérique.", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error) == MessageBoxResult.OK);
                    return false;
            }
            else if (!match2.Success)
            {
                if(MessageBox.Show("La valeur maximale doit être numérique.", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error) == MessageBoxResult.OK);
                    return false;
            }
            else if (txtbMin.Text == "")
            { 
                if(MessageBox.Show("La valeur minimal ne peut pas être vide.", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error) == MessageBoxResult.OK);
                    return false;
            }
            else if (txtbMax.Text == "")
            { 
                if(MessageBox.Show("La valeur maximale doit être numérique.", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error) == MessageBoxResult.OK);
                    return false;
            }
            else if (Convert.ToInt32(txtbMin.Text) > Convert.ToInt32(txtbMax.Text))
            {
                if(MessageBox.Show("La valeur minimale ne peut pas être plus grande que la valeur maximale.", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error) == MessageBoxResult.OK);
                    return false;
            }
            else if (Convert.ToInt32(txtbMax.Text) < Convert.ToInt32(txtbMin.Text))
            {
                if(MessageBox.Show("La valeur maximale ne peut pas être plus petite que la valeur minimale.", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error) == MessageBoxResult.OK);
                    return false;
            }
            else
            {
                if(MessageBox.Show("Valeurs modifiées avec succès.", "Succès", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK);
                    return true;
            }
        }
    }
}
