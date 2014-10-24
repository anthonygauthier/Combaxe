using MiniBD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes.services
{
    class EnnemiService
    {
        BdService bdCombaxe = new BdService();

        //Méthode qui retourne toutes les informations de l'ennemi (non, niveau, image, ses compétences, ses caractéristiques)
        public List<string>[] RetrieveInfoEnnemi(int idEnnemi)
        {
            string selConnexion = "SELECT idEnnemi, idInventaire, nom, niveau, image FROM Ennemis WHERE idEnnemi = '" + idEnnemi + "' AND boss = false;";
            List<string>[] unEnnemi;

            int nombreRange = 0;
            unEnnemi = bdCombaxe.selection(selConnexion, 5, ref nombreRange);

            //Selection des idCompetence pour trouver les compétences de l'ennemi
            selConnexion = "SELECT idCompetence FROM competencesEnnemis WHERE idEnnemi = '" + idEnnemi + "';";
            List<string>[] idCompetences;
            idCompetences = bdCombaxe.selection(selConnexion, 1, ref nombreRange);

            //Selection qui va chercher les informations des competences
            List<string>[] lesCompetences;
            CompetenceService competences = new CompetenceService();
            lesCompetences=competences.RetrieveInfoCompetence(idCompetences[1][0]);

            //On insere les competences dans l'ennemi

            return unEnnemi;
        }
    }
}
