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
    /// Interaction logic for EcranCombat.xaml
    /// </summary>
    public partial class EcranCombat : Window
    {
        public EcranCombat()
        {
            InitializeComponent();
        }

        //Méthode du bouton pour fuir un combat
        private void btnFuir_Click(object sender, RoutedEventArgs e)
        {
            var EcranMenuPrincipal = new EcranMenuPrincipal();
            EcranMenuPrincipal.Show();
            this.Close();
        }
    }
}
