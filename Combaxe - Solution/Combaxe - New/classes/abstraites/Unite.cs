using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

        public Unite()
        {
            Nom = "";
            Niveau = 0;
            Image = null;
            ListeCaracteristique = null;
            ListeCompetence = null;
        }

        public Unite(string n, int niv, string lien, List<Caracteristique> lstCar, List<Competence> lstComp)
        {
            Nom = n;
            Niveau = niv;
            Image = new BitmapImage(new Uri(lien, UriKind.RelativeOrAbsolute)); // fait par tommy gingras
            ListeCaracteristique = lstCar;
            ListeCompetence = lstComp;
        }
    }
}
