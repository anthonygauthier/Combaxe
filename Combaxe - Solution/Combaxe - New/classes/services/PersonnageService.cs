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
        public List<Personnage> RetrieveInfoPerso(){
            string reqSelect = "SELECT idPersonnage, nom, niveau, experience, image FROM Personnages WHERE idJoueur = '"+VarGlobales.Joueur.idJoueur+"';";
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 5, ref nbLigne);
            
            if(nbLigne != 0){
                List<Personnage> lstPersonnage = new List<Personnage>();
                List<Caracteristique> lstCar = null; // a modifier pour un new ...

                for (int i = 0; i < lstPerso.Count(); i++) {
                    /* on doit aller faire le lien des caractéristiques pour chaque personnages donc un autre for du meme genre */
                    Personnage perso = new Personnage(Convert.ToInt32(lstPerso[i][0]), lstPerso[i][1], Convert.ToInt32(lstPerso[i][2]), Convert.ToInt32(lstPerso[i][3]), lstPerso[i][4], lstCar);
                    lstPersonnage.Add(perso);
                    
                }
                return lstPersonnage;
            }
            else
            {
                return null;
            }
        }

        public List<string>[] RetrieveCaracteristiques(List<string>[] lstPerso)
        {
            /* pour chaque personnage qui existe je veux ajouter ses caractéristiques
             *  un tableau de tableau */
            
            List<string>[] lstCaracteristiques = null;
            
            //string reqSelect = "SELECT p.idPersonnage, c.idCaracteristique, c.nom, cp.valeur FROM Personnages p INNER JOIN Caracteristiques c ON c.idCaracteristique = cp.idCaracteristique INNER JOIN CaracteristiquesPersonnages cp ON cp.idCaracteristique =  c.idCaracteristique WHERE idPersonnage = '" + lstPerso[0][0] + "' OR idPersonnage = '" + lstPerso[1][0] + "' OR idPersonnage = '" + lstPerso[2][0] + "'";
            //int nbLigne = 0;
            //lstCaracteristiques = bdCombaxe.selection(reqSelect, 3, ref nbLigne);
            return lstCaracteristiques;
        }
    }
}
