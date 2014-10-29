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
        }

        private void btnRetour_Click_1(object sender, RoutedEventArgs e)
        {
            var MenuPrincipal = new EcranMenuPrincipal();
            MenuPrincipal.Show();
            this.Close();
        }
    }
}
