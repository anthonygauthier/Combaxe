using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media.Imaging;

namespace Combaxe___New.classes.abstraites
{
    public abstract class Unite
    {
        public string Nom { get; set; }
        public int Niveau { get; set; }
        public List<Caracteristique> ListeCaracteristique { get; set; }
        public List<Competence> ListeCompetence { get; set; }
        public BitmapImage Image { get; set; }
        public Inventaire Inventaire { get; set; }

        public Unite()
        {
            Nom = "";
            Niveau = 0;
            Image = null;
            ListeCaracteristique = null;
            ListeCompetence = null;
            Inventaire = null;
        }

        public Unite(string n, int niv, string lien, List<Caracteristique> lstCar, List<Competence> lstComp, Inventaire inv)
        {
            Nom = n;
            Niveau = niv;
            Directory.CreateDirectory("resources\\images\\personnages");
            Directory.CreateDirectory("resources\\images\\ennemis");
            if (File.Exists(System.AppDomain.CurrentDomain.BaseDirectory + lien))
                Image = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + lien, UriKind.RelativeOrAbsolute)); // fait par tommy gingras
            else
                Image = new BitmapImage(new Uri(System.AppDomain.CurrentDomain.BaseDirectory + "//resources//images//personnages//towel.jpg", UriKind.RelativeOrAbsolute)); // fait par tommy gingras
            ListeCaracteristique = lstCar;
            ListeCompetence = lstComp;
            Inventaire = inv;
        }
    }
}
