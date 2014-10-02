using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Joueur
    {
        private int idJoueur;
        private string pseudo;
        private string motDePasse;
        private List<Personnage> listePersonnage;

        /// <summary>
        /// Constructeur de base
        /// </summary>
        public Joueur()
        {
            idJoueur = 0;
            pseudo = "";
            motDePasse = "";
            listePersonnage = null;
        }

        /// <summary>
        /// Constructeur paramétré
        /// </summary>
        /// <param name="id">id du joueur</param>
        /// <param name="user">pseudonyme du compte du joueur</param>
        /// <param name="mdp">mot de passe du compte du joueur</param>
        /// <param name="lstPerso">liste de personnage(s) du joueur</param>
        public Joueur(int id, string user, string mdp, List<Personnage> lstPerso)
        {
            idJoueur = id;
            pseudo = user;
            motDePasse = mdp;
            listePersonnage = lstPerso;
        }

        /// <summary>
        /// Méthode pour changer de personnage
        /// </summary>
        public void ChangerPersonnage()
        {
            return;
        }

        /// <summary>
        /// Méthode pour se connecter
        /// </summary>
        public void Connexion()
        { 
            return;
        }

        /// <summary>
        /// Méthode pour se déconnecter
        /// </summary>
        public void Deconnexion()
        { 
            return;
        }

        /// <summary>
        /// Méthode modifier le mot de passe
        /// </summary>
        public void ModifierMotDePasse()
        { 
            return;
        }
    }
}
