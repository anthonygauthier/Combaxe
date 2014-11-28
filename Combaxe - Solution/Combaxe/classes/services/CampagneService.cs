using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    class CampagneService
    {
        BdService bdCombaxe = new BdService();

        /// <summary>
        /// Fonction qui retourne l'histoire de début d'un boss. - Anthony Gauthier 27 novembre 2014
        /// </summary>
        /// <returns></returns>
        public string RetrieveHistoire(string partieHistoire)
        {
            string reqSelect;                

            //Si l'histoire est le début, on va chercher l'histoire de début, sinon la partie de la fin.
            if (partieHistoire == "début")
            {
                reqSelect = "SELECT histoireDebut FROM Campagnes WHERE idEnnemi = " + VarGlobales.Ennemi.IdEnnemi + ";";
            }
            else
            {
                reqSelect = "SELECT histoireFin FROM Campagnes WHERE idEnnemi = " + VarGlobales.Ennemi.IdEnnemi + ";";
            }

            int nbLigne = 0;
            List<string>[] lstCampagne = bdCombaxe.selection(reqSelect, 1, ref nbLigne);

            return lstCampagne[0][0];
        }
    }
}
