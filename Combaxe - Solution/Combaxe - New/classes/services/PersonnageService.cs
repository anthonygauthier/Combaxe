using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    class PersonnageService
    {
        // on ouvre la connection
        private BdService bdCombaxe = new BdService();
        /// <summary>
        /// Pour récupérer toutes les données des personnages d'un joueur
        /// </summary>
        /// <returns>Liste de toutes les données des personnages</returns>
        public List<string>[] RetrieveInfoPerso(){
            string reqSelect = "SELECT idPersonnage, nom, niveau, image FROM Personnages WHERE idJoueur = '"+VarGlobales.Joueur.idJoueur+"';";
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 4, ref nbLigne);
            
            if(nbLigne != 0){
                return lstPerso;
            }
            else
            {
                return null;
            }
        }

        public List<string>[] RetrieveCaracteristiques(List<string>[] lstPerso)
        {
            List<string>[] lstCaracteristiques = null;
            //string reqSelect = "SELECT p.idPersonnage, c.idCaracteristique, c.nom, cp.valeur FROM Personnages p INNER JOIN Caracteristiques c ON c.idCaracteristique = cp.idCaracteristique INNER JOIN CaracteristiquesPersonnages cp ON cp.idCaracteristique =  c.idCaracteristique WHERE idPersonnage = '" + lstPerso[0][0] + "' OR idPersonnage = '" + lstPerso[1][0] + "' OR idPersonnage = '" + lstPerso[2][0] + "'";
            //int nbLigne = 0;
            //lstCaracteristiques = bdCombaxe.selection(reqSelect, 3, ref nbLigne);
            return lstCaracteristiques;
        }
    }
}
