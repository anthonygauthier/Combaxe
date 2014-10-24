using MiniBD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes.services
{
    class CompetenceService
    {
        BdService bdCombaxe = new BdService();

        //Méthode qui retourne toutes les informations de l'ennemi (non, niveau, image, ses compétences, ses caractéristiques)
        public List<string>[] RetrieveInfoCompetence(string idCompetence)
        {
            string selConnexion = "SELECT idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description, image FROM Competences WHERE idCompetence = '" + idCompetence + "';";
            List<string>[] competences;

            int nombreRange = 0;
            competences = bdCombaxe.selection(selConnexion, 9, ref nombreRange);

            //Selection des types de competence des competences
            List<string>[] TypeCompetence;

            selConnexion = "SELECT nom FROM typesCompetences WHERE idTypeCompetence = '" + competences[0][0] + "';";
            TypeCompetence = bdCombaxe.selection(selConnexion, 1, ref nombreRange);
            competences[0].AddRange(TypeCompetence[0]);

            //Selection qui va chercher les informations des competences

            return competences;
        }
    }
}
