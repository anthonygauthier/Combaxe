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
        public List<Caracteristique> RetrieveCaracteristique(string id, Object objet)
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

                string requete = "";

                if (objet == typeof(Personnage))
                {
                    requete = "SELECT idCaracteristique, valeur FROM CaracteristiquesPersonnages WHERE idPersonnage = '" + id + "' AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = '" + nom + "' );";
                }
                else if (objet == typeof(Ennemi))
                {
                    requete = "SELECT idCaracteristique, valeur FROM CaracteristiquesEnnemis WHERE idEnnemi = '" + id + "' AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = '" + nom + "' );";
                }
                else if (objet == typeof(Equipement))
                {
                    requete = "SELECT idCaracteristique, valeur FROM CaracteristiquesEquipementsModeles WHERE idEquipementModele = '" + id + "' AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = '" + nom + "' );";
                }
                List<string>[] uneCaracteristique;
                int nombreRange = 0;

                uneCaracteristique = bdCombaxe.selection(requete, 2, ref nombreRange);

                caracteristique = new Caracteristique(Convert.ToInt32(uneCaracteristique[0][0]), Convert.ToInt32(uneCaracteristique[0][1]), nom);
                mesCaracteristiques.Add(caracteristique);
            }
            return mesCaracteristiques;
        }

        /// <summary>
        /// Méthode qui met à jour les caractéristique du personnage après avoir augmenté de niveau - Anthony Gauthier 04/11/2014
        /// </summary>
        /// <param name="force">valeur de la textbox de force</param>
        /// <param name="vitesse">valeur de la textbox de vitesse</param>
        /// <param name="energie">valeur de la textbox de energie</param>
        /// <param name="vie">valeur de la textbox de vie</param>
        /// <param name="defense">valeur de la textbox de defense</param>
        public void MiseAJourCaracteristiques(int force, int vitesse, int energie, int vie, int defense)
        {
            //On créer une requête pour chaque caractéristiques, rendant le code plus léger et simple a débugger
            string requeteMajForce = "UPDATE CaracteristiquesPersonnages SET valeur = "+force+" WHERE idPersonnage = "+VarGlobales.Personnage.IdPersonnage+" AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = 'Force');";
            string requeteMajVitesse = "UPDATE CaracteristiquesPersonnages SET valeur = " + vitesse + " WHERE idPersonnage = " + VarGlobales.Personnage.IdPersonnage + " AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = 'Vitesse');";
            string requeteMajEnergie = "UPDATE CaracteristiquesPersonnages SET valeur = " + energie + " WHERE idPersonnage = " + VarGlobales.Personnage.IdPersonnage + " AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = 'Énergie');";
            string requeteMajVie = "UPDATE CaracteristiquesPersonnages SET valeur = " + vie + " WHERE idPersonnage = " + VarGlobales.Personnage.IdPersonnage + " AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = 'Vie');";
            string requeteMajDefense = "UPDATE CaracteristiquesPersonnages SET valeur = " + defense + " WHERE idPersonnage = " + VarGlobales.Personnage.IdPersonnage + " AND idCaracteristique = (SELECT idCaracteristique FROM Caracteristiques WHERE nom = 'Défense');";
        
            //On effectue les 5 mises à jour
            bdCombaxe.maj(requeteMajForce);
            bdCombaxe.maj(requeteMajVitesse);
            bdCombaxe.maj(requeteMajEnergie);
            bdCombaxe.maj(requeteMajVie);
            bdCombaxe.maj(requeteMajDefense);
        }
    }
}
