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

            if(nbLigne != 0){
                List<Personnage> lstPersonnage = new List<Personnage>();
                List<Caracteristique> lstCar = new List<Caracteristique>();

                if(lstPerso.Count() != 0){
                    for (int i = 0; i < lstPerso.Count(); i++) 
                    {
                            /* aller chercher leurs caractéristiques */
                            lstCar = RetrieveCaracteristiques(Convert.ToInt32(lstPerso[i][0]));
                            
                            Personnage perso = new Personnage(Convert.ToInt32(lstPerso[i][0]), lstPerso[i][1], Convert.ToInt32(lstPerso[i][2]), Convert.ToInt32(lstPerso[i][3]), lstPerso[i][4], lstCar);
                            lstPersonnage.Add(perso);
                            lstCar = new List<Caracteristique>();
                     }
                }
                return lstPersonnage;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Récupère toutes les caractéristiques d'un personnage
        /// </summary>
        /// <param name="idPersonnage">le id du personnage</param>
        /// <returns>retourne sous forme d'objet caractéristique</returns>
        public List<Caracteristique> RetrieveCaracteristiques(int idPersonnage)
        {
            /* pour chaque personnage qui existe je veux ajouter ses caractéristiques
             */
            List<string>[] lstCaracteristiques = null;
            List<Caracteristique> lstCar = new List<Caracteristique>();

            string reqSelect = "SELECT c.idCaracteristique, c.nom, cp.valeur FROM Personnages p INNER JOIN CaracteristiquesPersonnages cp ON cp.idPersonnage =  p.idPersonnage INNER JOIN Caracteristiques c ON c.idCaracteristique = cp.idCaracteristique WHERE p.idPersonnage = '" + idPersonnage + "'";
            int nbLigne = 0;
            lstCaracteristiques = bdCombaxe.selection(reqSelect, 3, ref nbLigne);

            for (int y = 0; y < lstCaracteristiques.Count(); y++)
            {
                /* on doit aller faire le lien des caractéristiques pour chaque personnages donc un autre for du meme genre */
                if (lstCaracteristiques.Count() == 5)
                {
                    Caracteristique caract = new Caracteristique(Convert.ToInt32(lstCaracteristiques[y][0]), Convert.ToInt32(lstCaracteristiques[y][2]), lstCaracteristiques[y][1]);
                    lstCar.Add(caract);
                }
                else
                {
                    return null;
                }
            }
            return lstCar;
        }

        /// <summary>
        /// On veut sélectionner un personnage selon son ID
        /// </summary>
        /// <param name="id">le id du personnage désirée</param>
        /// <returns>on retourne un objet de type personnage</returns>
        public Personnage selectionUnPersonnage(int id)
        {            
            string reqSelect = "SELECT idPersonnage, nom, niveau, experience, image FROM Personnages WHERE idJoueur = '" + VarGlobales.Joueur.idJoueur + "' AND idPersonnage = '"+id+"';";
            int nbLigne = 0;
            List<string>[] lstPerso = bdCombaxe.selection(reqSelect, 5, ref nbLigne);
            List<Caracteristique> lstCaracteristique = new List<Caracteristique>();

            if (nbLigne != 0)
            {
                Personnage perso = null;
                List<Caracteristique> lstCar = new List<Caracteristique>();

                if (lstPerso.Count() != 0)
                {
                    /* aller chercher leurs caractéristiques */
                    lstCar = RetrieveCaracteristiques(Convert.ToInt32(lstPerso[0][0]));

                    perso = new Personnage(Convert.ToInt32(lstPerso[0][0]), lstPerso[0][1], Convert.ToInt32(lstPerso[0][2]), Convert.ToInt32(lstPerso[0][3]), lstPerso[0][4], lstCar);
                   
                }
                
                return perso;
            }
            else
            {
                return null;
            }
        }
    }
}
