using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    class CaracteristiqueService
    {
        BdService bdCombaxe = new BdService();

        //Méthode qui va chercher les caractéristiques de base de chaque profession
        public List<string>[] RetrieveCaracteristiqueBase(string nom)
        {
            string requete = "SELECT valeur FROM caracteristiquesprofessions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '" + nom + "');";
            List<string>[] mesCaracteristiques;
            int nombreRange = 0;

            mesCaracteristiques = bdCombaxe.selection(requete, 1, ref nombreRange);

            return mesCaracteristiques;
        }

        //Méthode qui insert les caractéristiques du personnage lors de la création de celui-ci
        public void InsertCaracteristique(string nomCaracteristique, int idPersonnage, int valeur)
        {
            string requeteInsert = "INSERT INTO CaracteristiquesPersonnages (idCaracteristique, idPersonnage, valeur) VALUES ((SELECT idCaracteristique FROM Caracteristiques WHERE nom = '" + nomCaracteristique + "')," + idPersonnage + "," + valeur + ")";
            bdCombaxe.Insertion(requeteInsert);
        }

        /// <summary>
        /// Méthode qui va chercher les caractéristiques de base de chaque profession - William Themens
        /// </summary>
        /// <param name="idEnnemi">Permet de savoir les caractéristiques de quel ennemi qui est désirées</param>
        /// <returns></returns>
        public List<Caracteristique> RetrieveCaracteristiqueEnnemi(string idEnnemi)
        {
            List<Caracteristique> mesCaracteristiques = new List<Caracteristique>();
            Caracteristique caracteristique;
            string nom = "";

            for (int i = 0; i < 5; i++)
            {
                switch (i)
                {
                    case (int)Caracteristiques.Force:
                        nom = Caracteristiques.Force.ToString();
                        break;
                    case (int)Caracteristiques.Defense:
                        nom = Caracteristiques.Defense.ToString();
                        break;
                    case (int)Caracteristiques.Vie:
                        nom = Caracteristiques.Vie.ToString();
                        break;
                    case (int)Caracteristiques.Energie:
                        nom = Caracteristiques.Energie.ToString();
                        break;
                    case (int)Caracteristiques.Vitesse:
                        nom = Caracteristiques.Vitesse.ToString();
                        break;
                }

                string requete = "SELECT idCaracteristique, valeur FROM CaracteristiquesEnnemis WHERE idEnnemi = '" + idEnnemi + "' AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = '" + nom + "' );";
                List<string>[] uneCaracteristique;
                int nombreRange = 0;

                uneCaracteristique = bdCombaxe.selection(requete, 2, ref nombreRange);

                caracteristique = new Caracteristique(Convert.ToInt32(uneCaracteristique[0][0]), Convert.ToInt32(uneCaracteristique[0][1]), nom);
                mesCaracteristiques.Add(caracteristique);
            }
            return mesCaracteristiques;
        }
    }
}
