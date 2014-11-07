using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public enum Consommations : int
    {
        Vie,
        Energie
    }

    public class Consommation
    {
        public int IdConsommation { get; set; }
        public string TypeConsommation { get; set; }
        public string Nom { get; set; }
        public double Prix { get; set; }
        public double PourcentageValeurAjoute { get; set; }
        public string Image { get; set; }
        public int Quantite { get; set; }

        public Consommation()
        {
            IdConsommation = 0;
            TypeConsommation = "";
            Nom = "";
            Prix = 0.00;
            PourcentageValeurAjoute = 0.00;
            Image = "";
            Quantite = 0;
        }

        public Consommation(int id, string typeC, string n, double p, double pva, string img, int q)
        {
            IdConsommation = id;
            TypeConsommation = typeC;
            Nom = n;
            Prix = p;
            PourcentageValeurAjoute = pva;
            Image = img;
            Quantite = q;
        }
    }
}
