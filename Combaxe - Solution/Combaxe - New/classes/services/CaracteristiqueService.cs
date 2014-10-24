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
    }
}
