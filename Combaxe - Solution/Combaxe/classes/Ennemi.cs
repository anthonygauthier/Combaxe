using Combaxe___New.classes.services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Combaxe___New.écrans;
using Combaxe___New.classes.abstraites;
using MiniBD;

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
        public Ennemi(int id, int niv, string lien, string n, List<Caracteristique> lstCar, List<Competence> lstComp, Inventaire inv)
            : base(n, niv, lien, lstCar, lstComp, inv)
        {
            IdEnnemi = id;
        }

        /// <summary>
        /// Fonction qui définit si un ennemi est un boss - Anthony Gauthier 02/10/2014
        /// </summary>
        /// <returns>valeur booléenne (true/false (1,0))</returns>
        public void boss()
        {
            int nombreRange = 0;
            EnnemiService ennemiService = new EnnemiService();
            Ennemi ennemi = new Ennemi();
            List<string>[] idBoss;
            string reqBoss = "SELECT idEnnemi FROM Campagnes WHERE idCampagne = '"+VarGlobales.Personnage.IdCampagne+"';";
            BdService bdCombaxe = new BdService();
            idBoss = bdCombaxe.selection(reqBoss, 1, ref nombreRange);
               
            ennemi = ennemiService.RetrieveInfoEnnemi(idBoss[0][0]);

            VarGlobales.Ennemi = ennemi;
        }

        /// <summary>
        /// Détermine l'inventaire du butin
        /// </summary>
        public void butinDonne()
        {
            Inventaire = new Inventaire();
            //Calcule l'argent das le butin
            Random rand = new Random();
            double argentMin = Convert.ToDouble(((Niveau / 2) + (Niveau * Niveau * Niveau)) * 3.1416);
            double argentMax = Convert.ToDouble(((Niveau / 2) + (Niveau * Niveau * Niveau)) * 3.1416 * 1.5);
            Inventaire.argent = Math.Round(rand.NextDouble() * (argentMax - argentMin) + argentMin,2);
            Inventaire.listeEquipement = equipementButin();
        }

        /// <summary>
        /// Fonction qui choisi un ennemi aléatoirement - William Themens
        /// </summary>
        /// <returns>L'ennemi avec son niveau changé</returns>
        public void ennemiAleatoire()
        {
            EnnemiService ennemiService = new EnnemiService();
            List<string>[] tousEnnemi;
            tousEnnemi = ennemiService.RetrieveIdTousEnnemis();


            Random aleatoire = new Random();
            int idEnnemiAleatoire = aleatoire.Next(0, 1);
            Ennemi ennemi;
            ennemi = ennemiService.RetrieveInfoEnnemi(tousEnnemi[idEnnemiAleatoire][0]);
            ennemi = NiveauEnnemi(ennemi);

            VarGlobales.Ennemi = ennemi;
        }

        /// <summary>
        /// Détermine le niveau de l'ennemi selon le niveau du joueur
        /// </summary>
        /// <param name="ennemi">L'ennemi contre qui se bat le personnage</param>
        /// <returns></returns>
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
            //Variable qui possèdera le numero de l'attaque qui sera affectué
            int attaque = 0;

            //Le plus haut pourcentage
            int plusHautChiffre = 0;

            //Liste qui possèdera tous les nom et le pourcentage de chance que l'attaque soit effectuée
            List<string>[] pourcentageAttaque = new List<string>[this.ListeCompetence.Count()];

            for (int i = 0; i < this.ListeCompetence.Count()-1; i++)
            {
                //Insère dans la liste une attaque avec son pourcentage
                pourcentageAttaque[i]=ChanceAttaqueSpecial(this.ListeCompetence[i+1], vieRestante, energieRestante);

                //Si c'est la première attaque, on enregiste le numero et son pourcentage dans les variable attaque et plusHautChiffre
                if (i == 0)
                {
                    attaque = i+1;
                    plusHautChiffre = Convert.ToInt32(pourcentageAttaque[i][1]);
                }

                else
                {
                    //Si le nouveau pourcentage est plus haut que le plusHautChiffre, on remplace le contenu des variables par le contenu de la nouvelle attaque
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

            //Vérifie que l'ennemi possède assez d'énergie, sinon son pourcentage est de 0
            if (energieRestante>competence.EnergieUtilise)
            {
                //Si la compétence est une compétence de guérison et si la vie restante + le minimum de vie que la compétence peut régénérer est plus petit ou égal au maximum de vie
                if ((competence.NomTypeCompetence == TypeCompetence.Support.ToString() || competence.NomTypeCompetence == TypeCompetence.Defensive.ToString()) && (vieRestante + competence.ValeurMin) <= Convert.ToInt32((this.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416))
                {
                    pourcentageChange = rand.Next(1,61);
                }

                //S'il s'agit d'un autre type d'attaque
                else
                {
                    pourcentageChange = rand.Next(1,51);
                }
            }

            chanceAttaque.Add(competence.Nom);
            chanceAttaque.Add(pourcentageChange.ToString());

            return chanceAttaque;
        }

        /// <summary>
        /// Fonction qui va chercher un certain nombre d'équipement et qui se retrouveront dans le butin
        /// </summary>
        /// <returns>La liste des équipements du butin</returns>
        private List<Equipement> equipementButin()
        {
            BdService bdCombaxe = new BdService();
            EquipementService equipementService = new EquipementService();
            List<Equipement> lstEquipementButin = new List<Equipement>();
            List<string>[] lstEquipement;
            List<int> noEquipementModeleButin = new List<int>() ;//Variable qui détiendra les idEquipementModele des équipements qui se retrouveront dans le butin
            Random rand = new Random();
            int nombreRange = 0;
            int nombreEquipement = 0;
            int noEquipementModele;
            List<int> idEquipement = new List<int>();

            string selEquipement = "SELECT idEquipementModele FROM EquipementsModeles WHERE niveauEquipement = '" + VarGlobales.Ennemi.Niveau + "';";
            lstEquipement = bdCombaxe.selection(selEquipement, 1, ref nombreRange);

            //Si la liste d'équipement est vide, on retrieve tous les équipements qui sont inferieur de 1 du niveau de l'ennemi
            if(lstEquipement[0][0] == "")
            {
                selEquipement = "SELECT idEquipementModele FROM EquipementsModeles WHERE niveauEquipement = '" + (VarGlobales.Ennemi.Niveau-1) + "';";
                lstEquipement = bdCombaxe.selection(selEquipement, 1, ref nombreRange);
            }
            //Random entre 0 et 4 pour savoir le nombre d'equipement qui seront dans le butin
            int nombreButin;
            switch (VarGlobales.Personnage.Inventaire.listeEquipement.Count())
            {
                case 14:
                    nombreButin = rand.Next(3);
                    break;
                case 15:
                    nombreButin = rand.Next(2);
                    break;
                case 16:
                    nombreButin = 0;
                    break;
                default:
                    nombreButin = 2;//rand.Next(4);
                    break;
            }

            foreach (List<string> j in lstEquipement)
            {
                nombreEquipement++;
            }

            //Genere x random selon le nombre d'equipement qui a dans le butin pour savoir quel equipement sera dans le butin
            for (int i = 0; i < nombreButin; i++)
            {
                noEquipementModele = rand.Next(nombreEquipement);
                noEquipementModeleButin.Add(Convert.ToInt32(lstEquipement[noEquipementModele][0]));

                //Retire l'équipement de lstEquipement pour ne pas qu'il soit rechoisi 
                //puisque l'on veut que l'équipement puisse être dans le butin maximum une fois
                for (int j = noEquipementModele; j < nombreEquipement - 1; j++)
                {
                    lstEquipement[j] = lstEquipement[j + 1];
                }
                lstEquipement[nombreEquipement - 1] = null;
                nombreEquipement--;
            }

            //Pour chaque équipement dans le butin
            for (int i = 0; i < nombreButin; i++)
            {
                //On insère dans la BD un équipement dans la table equipement
                idEquipement.Add(equipementService.insertEquipement(noEquipementModeleButin[i]));
                //On va chercher les informations de l'équipementModele dans la BD
                lstEquipementButin.Add(equipementService.retrieveEquipementModele(noEquipementModeleButin[i], idEquipement[i]));
            }
            
            //Retourne la liste
            return lstEquipementButin;
        }
    }
}