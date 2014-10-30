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
using System.Windows.Threading;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Logique d'interaction pour EcranRepos.xaml
    /// </summary>
    public partial class EcranRepos : Window
    {
        public EcranRepos()
        {
            InitializeComponent();
            tempsDeRepos();
        }

        //On déclare les variables nécéssaires au bon fonctionnement de la progressbar
        DispatcherTimer horloge;
        TimeSpan temps;

        private void tempsDeRepos()
        {
            //On initialise le temps de l'horloge et la progress bar
            temps = TimeSpan.FromSeconds(10);
            pbRepos.Maximum = temps.TotalSeconds;
            pbRepos.Value = pbRepos.Minimum;
            this.ResizeMode = ResizeMode.NoResize;
            temps = TimeSpan.FromSeconds(0);

            horloge = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                //On ajoute (enlève) le temps à l'horloge puis on modifie la valeur de la progress bar
                temps = temps.Add(TimeSpan.FromSeconds(1));
                pbRepos.Value = temps.Seconds;

                if(temps == TimeSpan.FromSeconds(10))
                {
                    this.Close();
                }

            }, Application.Current.Dispatcher);

            horloge.Start();  
        }
    }
}
