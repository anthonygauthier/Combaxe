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

        //Méthode qui va créer le compte du joueur
        public void CreerJoueur(string pseudo, string mdp)
        {
            //On insert le personnage
            string reqInsert = "INSERT INTO Joueurs (pseudonyme,motDePasse) VALUES ('"+pseudo+"','"+mdp.ToUpper()+"')";
            bdCombaxe.Insertion(reqInsert);
        }

        //Méthode qui vérifie si l'usager est disponible
        public bool usagerDisponible(string usager)
        {
            string selUsager = "SELECT pseudonyme FROM Joueurs WHERE pseudonyme='" + usager + "';";
            int r = 0;

            List<string>[] retourSel = bdCombaxe.selection(selUsager, 1, ref r);

            if (retourSel[0][0] == "")
            {
                return false;
            }

            else
            {
                return true;
            }
        }
    }
}
