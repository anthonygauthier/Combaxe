using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;

namespace Combaxe___New.classes.services
{
    class JoueurService
    {
        BdService bdCombaxe = new BdService();

        //Méthode qui retourne les informations du compte du joueur (id, nom, mdp)
        public List<string>[] RetrieveInfoJoueur(string nomUsager, string mdp)
        {
            string selConnexion = "SELECT * FROM joueurs WHERE pseudonyme = '" + nomUsager + "' AND motDePasse = '" + mdp + "';";
            List<string>[] unJoueur;

            int nombreRange = 0;
            unJoueur = bdCombaxe.selection(selConnexion, 3, ref nombreRange);

            return unJoueur;
        }
        //-------CHANGER DANS PERSONNAGE SERVICE
        //Méthode pour vérifier si l'utilisateur a des personnages - Anthony Gauthier 09/10/2014
        public bool verificationPersonnage(string nom, string mdp)
        {
            List<string>[] unJoueur;
            unJoueur = RetrieveInfoJoueur(nom, mdp);

            string selPerso = "SELECT * FROM personnages WHERE idJoueur = " + unJoueur[0][0] + ";";

            List<string>[] persosDuJoueur;
            int nombreRange = 0;
            persosDuJoueur = bdCombaxe.selection(selPerso, 9, ref nombreRange);

            //Si le joueur n'a pas de personnages, on retourne false - Anthony Gauthier 09/10/2014
            if (persosDuJoueur[0][0].Length == 0)
            {
                return false;
            }
            //S'il en a, on retourne true - Anthony Gauthier 09/10/2014
            else
            {
                VarGlobales.aPersonnage = true;
                return true;
            }
        }
    }
}
