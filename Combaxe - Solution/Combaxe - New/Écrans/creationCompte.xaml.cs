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
    }
}
