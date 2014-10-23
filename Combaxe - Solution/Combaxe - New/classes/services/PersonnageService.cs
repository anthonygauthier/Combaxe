using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    public class PersonnageService
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
            List<string>[] lstStringCaract = null;

            if(nbLigne != 0){
                List<Personnage> lstPersonnage = new List<Personnage>();
                List<Caracteristique> lstCar = new List<Caracteristique>();
                if(lstPerso.Count() != 0){
                    for (int i = 0; i < lstPerso.Count(); i++) {
                        /* on doit aller faire le lien des caractéristiques pour chaque personnages donc un autre for du meme genre */
                    
                            Personnage perso = new Personnage(Convert.ToInt32(lstPerso[i][0]), lstPerso[i][1], Convert.ToInt32(lstPerso[i][2]), Convert.ToInt32(lstPerso[i][3]), lstPerso[i][4], lstCar);
                            lstPersonnage.Add(perso);
                            /* aller chercher leurs caractéristiques */
                            lstStringCaract = RetrieveCaracteristiques(Convert.ToInt32(lstPerso[i][0]));
                            for(int y = 0; y < lstStringCaract.Count(); y++){
                                if (lstStringCaract.Count() == 5)
                                {
                                    Caracteristique caract = new Caracteristique(Convert.ToInt32(lstStringCaract[y][0]), Convert.ToInt32(lstStringCaract[y][1]), lstStringCaract[y][2]);
                                    lstCar.Add(caract);
                                }
                                else
                                {
                                    return null;
                                }
                            }
                     }
                }
                return lstPersonnage;
            }
            else
            {
                return null;
            }
        }

        public List<string>[] RetrieveCaracteristiques(int idPersonnage)
        {
            /* pour chaque personnage qui existe je veux ajouter ses caractéristiques
             *  un tableau de tableau */
            
            List<string>[] lstCaracteristiques = null;

            string reqSelect = "SELECT c.idCaracteristique, c.nom, cp.valeur FROM Personnages p INNER JOIN CaracteristiquesPersonnages cp ON cp.idPersonnage =  p.idPersonnage INNER JOIN Caracteristiques c ON c.idCaracteristique = cp.idCaracteristique WHERE p.idPersonnage = '" + idPersonnage + "'";
            int nbLigne = 0;
            lstCaracteristiques = bdCombaxe.selection(reqSelect, 3, ref nbLigne);
            return lstCaracteristiques;
        }
    }
}
