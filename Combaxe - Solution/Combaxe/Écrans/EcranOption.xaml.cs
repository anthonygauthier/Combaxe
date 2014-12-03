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
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if(verificationNumerique())
            {
                VarGlobales.delaiMin = Convert.ToInt32(txtbMin.Text);
                VarGlobales.delaiMax = Convert.ToInt32(txtbMax.Text);
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
            else
            {
                if(MessageBox.Show("Valeurs modifiées avec succès.", "Succès", MessageBoxButton.OK, MessageBoxImage.Error) == MessageBoxResult.OK);
                    return true;
            }
        }
    }
}
