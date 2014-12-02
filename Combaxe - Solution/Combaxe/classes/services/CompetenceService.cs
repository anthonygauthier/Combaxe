using MiniBD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Combaxe___New.classes;

namespace Combaxe___New.classes.services
{
    class CompetenceService
    {
        BdService bdCombaxe = new BdService();

        /// <summary>
        /// Méthode qui retourne toutes les informations de l'ennemi (non, niveau, image, ses compétences, ses caractéristiques) - William Themens
        /// </summary>
        /// <param name="idCompetence">Permet de savoir la competence qui est recherché</param>
        /// <returns></returns>
        public Competence RetrieveInfoCompetence(string idCompetence)
        {
            string selConnexion = "SELECT idTypeCompetence, idEffet, nom, valeurMin, valeurMax, energieUtilise, tempsRecharge, description, image FROM Competences WHERE idCompetence = '" + idCompetence + "';";
            List<string>[] uneCompetence;

            int nombreRange = 0;
            uneCompetence = bdCombaxe.selection(selConnexion, 9, ref nombreRange);

            //Selection des types de competence des competences
            List<string>[] typeCompetence;

            selConnexion = "SELECT nom FROM typesCompetences WHERE idTypeCompetence = '" + uneCompetence[0][0] + "';";
            typeCompetence = bdCombaxe.selection(selConnexion, 1, ref nombreRange);
            uneCompetence[0].AddRange(typeCompetence[0]);

            //Selection qui va chercher les informations des competences
            Competence competence = new Competence(Convert.ToInt32(idCompetence), uneCompetence[0][2], Convert.ToInt32(uneCompetence[0][3]), Convert.ToInt32(uneCompetence[0][4]),
                                                                Convert.ToInt32(uneCompetence[0][5]), Convert.ToInt32(uneCompetence[0][6]), uneCompetence[0][7], uneCompetence[0][8],
                                                                uneCompetence[0][9]);
            return competence;
        }

        /// <summary>
        /// Pour récupérer les compétences d'un personnage, tommy gingras
        /// </summary>
        /// <param name="idPersonnage">Permet de récupérer les infos pour un personnage</param>
        /// <returns>retourne une liste de ses compétences</returns>
        public List<Competence> RetrieveCompetenceUnPersonnage(int id)
        {
            List<Competence> ListCompetences = new List<Competence>();
            Competence competence = null;
            /* On va chercher toutes les compétences pour la profession du personnage */
            string selConnexion = "SELECT idProfession, idCompetence FROM CompetencesProfessions WHERE idProfession = '" + id + "';";
            List<string>[] lstCompetences;

            int nombreRange = 0;
            lstCompetences = bdCombaxe.selection(selConnexion, 2, ref nombreRange);

            /* on va chercher une compétence avec ses détails pour le personnage */

            for (int i = 0; i < lstCompetences.Count(); i++)
            {
                competence = RetrieveInfoCompetence(lstCompetences[i][1]);
                if(competence != null)
                {
                    ListCompetences.Add(competence);
                }
            }

            return ListCompetences;
        }

        /// <summary>
        /// Retourne tous les types disponibles
        /// </summary>
        /// <returns>retourne les types existants</returns>
        public List<string> RetrieveListeTypeCompetence()
        {
            List<string> listeTypes = new List<string>();
            string requeteTypeCompetences = "SELECT nom FROM TypesCompetences";

            List<string>[] lstType;

            int nombreRange = 0;
            lstType = bdCombaxe.selection(requeteTypeCompetences, 1, ref nombreRange);

            if (lstType.Count() != 0)
            {
                for (int i = 0; i < lstType.Count(); i++)
                {
                    listeTypes.Add(lstType[i][0]);
                }
                return listeTypes;
            }
            else
                return null;
            
        }
    }
}
