using Combaxe___New.classes.services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Combaxe___New.écrans;
using Combaxe___New.classes.abstraites;

namespace Combaxe___New.classes
{
    public class Ennemi : Unite
    {
        public int IdEnnemi { get; set; }

        /// <summary>
        /// Constructeur de base - Anthony Gauthier 02/10/2014
        /// </summary>
        public Ennemi() : base()
        {
            IdEnnemi = 0;
        }

        /// <summary>
        /// Constructeur paramétrés - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <param name="id">id de l'ennemi</param>
        /// <param name="niv">niveau de l'ennemi</param>
        /// <param name="url">url de l'image</param>
        /// <param name="n">nom de l'ennemi</param>
        /// <param name="lstCar">list des caractéristiques de l'ennemi</param>
        public Ennemi(int id, int niv, string lien, string n, List<Caracteristique> lstCar, List<Competence> lstComp)
            : base(n, niv, lien, lstCar, lstComp)
        {
            IdEnnemi = id;
        }

        /// <summary>
        /// Fonction qui définit si un ennemi est un boss - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <returns>valeur booléenne (true/false (1,0))</returns>
        public bool estBoss()
        { 
            return false;
        }

        /// <summary>
        /// Définit le butin donné par l'ennemi - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <returns>Le nombre d'or donné par l'ennemi</returns>
        public int butinDonne()
        { 
            return 0;
        }

        /// <summary>
        /// Fonction qui choisi un ennemi aléatoirement - William Themens
        /// </summary>
        /// <returns></returns>
        public void ennemiAleatoire()
        {
            EnnemiService ennemiService = new EnnemiService();
            List<string>[] tousEnnemi;
            tousEnnemi = ennemiService.RetrieveIdTousEnnemis();


            Random aleatoire = new Random();
            int idEnnemiAleatoire = aleatoire.Next(0, tousEnnemi.Count());
            Ennemi ennemi;
            ennemi = ennemiService.RetrieveInfoEnnemi(tousEnnemi[idEnnemiAleatoire][0]);
            ennemi = NiveauEnnemi(ennemi);

            VarGlobales.Ennemi = ennemi;
        }

        public Ennemi NiveauEnnemi(Ennemi ennemi)
        {
            //Selectionne un niveau aléatoirement +/- 2 au niveau du personnage
            int niveauMin = VarGlobales.Personnage.Niveau-2;
            if(niveauMin<=0)
            {
                niveauMin = 1;
            }
            int niveauMax = VarGlobales.Personnage.Niveau+2;
            Random rand = new Random();
            int niveau = rand.Next(niveauMin, niveauMax);

            ennemi.Niveau = niveau;

            //Calcule les caractéristiques selon le niveau
            // caracteristique += caracteristique * (niveau-1) *0.3
            ennemi.ListeCaracteristique[(int)Caracteristiques.Force].Valeur += Convert.ToInt32(ennemi.ListeCaracteristique[(int)Caracteristiques.Force].Valeur * (ennemi.Niveau - 1) * 0.3);
            ennemi.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur += Convert.ToInt32(ennemi.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur * (ennemi.Niveau - 1) * 0.3);
            ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur += Convert.ToInt32(ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * (ennemi.Niveau - 1) * 0.3);
            ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur += Convert.ToInt32(ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur * (ennemi.Niveau - 1) * 0.3);
            ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur += Convert.ToInt32(ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * (ennemi.Niveau - 1) * 0.3);

            return ennemi;
        }

        /// <summary>
        /// Choisi si l'ennemi fait une attaque normale ou fait une des ses attaques speciales - William Themens
        /// </summary>
        /// <param name="vieRestante">La vie restante à l'ennemi</param>
        /// <param name="energieRestante">L'énergie restante à l'ennemi</param>
        /// <returns>le numéro de l'attaque qui doit être exécutée</returns>
        public int AI(int vieRestante, int energieRestante)
        {
            Random rand = new Random();
            int numeroAttaque = 0;
            int attaqueNormal = rand.Next(100);
            int attaqueSpecial = rand.Next(100);

            if (attaqueSpecial > attaqueNormal)
            {
                numeroAttaque = attaqueChoisi(vieRestante, energieRestante);
            }

            return numeroAttaque;
        }

        /// <summary>
        /// Permet de savoir quel attaque spéciale sera exécutée
        /// </summary>
        /// <param name="vieRestante">La vie restante à l'ennemi</param>
        /// <param name="energieRestante">L'énergie restante à l'ennemi</param>
        /// <returns>Le numéro de l'attaque speciale qui sera exécutée</returns>
        public int attaqueChoisi(int vieRestante, int energieRestante)
        {
            int attaque = 0;
            int plusHautChiffre = 0;

            List<string>[] pourcentageAttaque = new List<string>[this.ListeCompetence.Count()];

            for (int i = 0; i < this.ListeCompetence.Count()-1; i++)
            {
                pourcentageAttaque[i]=ChanceAttaqueSpecial(this.ListeCompetence[i+1], vieRestante, energieRestante);

                if (i == 0)
                {
                    attaque = i+1;
                    plusHautChiffre = Convert.ToInt32(pourcentageAttaque[i][1]);
                }

                else
                {
                    if(plusHautChiffre<Convert.ToInt32(pourcentageAttaque[i][1]))
                    {
                        attaque = i+1;
                        plusHautChiffre = Convert.ToInt32(pourcentageAttaque[i][1]);
                    }
                }
            }

            //Si le plus haut chiffre est 0, alors l'ennemi n'a pas assez d'énergie pour exécutée l'attaque spéciale
            if (plusHautChiffre == 0)
            {
                //L'attaque à exécutée sera alors la 0 qui se trouve à être une attaque normal qui ne coûte pas d'énergie
                attaque = 0;
            }

            return attaque;
        }

        /// <summary>
        /// Fonction qui détermine le pourcentage de change que l'ennemi exécute une attaque spéciale
        /// </summary>
        /// <param name="competence">La compétence qui peut être exécutée</param>
        /// <param name="vieRestante">La vie restante à l'ennemi</param>
        /// <param name="energieRestante">L'énergie restante à l'ennemi</param>
        /// <returns>Le nom de la compétence et son pourcentage de chance d'être exécuté</returns>
        public List<string> ChanceAttaqueSpecial(Competence competence, int vieRestante, int energieRestante)
        {
            List<string> chanceAttaque = new List<string>();
            Random rand = new Random();
            int pourcentageChange = 0; ;


            if (energieRestante>competence.EnergieUtilise)
            {
                if (competence.NomTypeCompetence == TypeCompetence.Support.ToString() && (vieRestante + competence.ValeurMin) <= Convert.ToInt32((this.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416))
                {
                    pourcentageChange = rand.Next(1,61);
                }

                else
                {
                    pourcentageChange = rand.Next(1,51);
                }
            }

            chanceAttaque.Add(competence.Nom);
            chanceAttaque.Add(pourcentageChange.ToString());

            return chanceAttaque;
        }
    }
}
