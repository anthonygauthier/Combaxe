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

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Logique d'interaction pour menuPrincipal.xaml
    /// </summary>
    public partial class menuPrincipal : Window
    {
    
        public menuPrincipal()
        {
            InitializeComponent();
        }

        private void btnCombat_Click(object sender, RoutedEventArgs e)
        {
            btnCampagne.Visibility = Visibility.Visible;
            btnPartieRapide.Visibility = Visibility.Visible;
            btnCombat.Visibility = Visibility.Hidden;
        }

        private void btnSupprimerPerso_Click_1(object sender, RoutedEventArgs e)
        {
            VarGlobales.Personnage.Supprimer();
            var pageChangementPerso = new changementPerso();
        }
    }
}
