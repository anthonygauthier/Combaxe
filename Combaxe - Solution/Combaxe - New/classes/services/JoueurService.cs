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
    }
}
