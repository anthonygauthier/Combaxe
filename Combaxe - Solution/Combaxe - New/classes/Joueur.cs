using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Joueur
    {
        private int _idJoueur;
        private string _pseudo;
        private string _motDePasse;
        private List<Personnage> _listePersonnage;

        public int idJoueur
        {
            get { return _idJoueur; }
            set { _idJoueur = value; }
        }

        public string pseudo
        {
            get { return _pseudo; }
            set { _pseudo = value; }
        }

        public string motDePasse
        {
            get { return _motDePasse; }
            set { _motDePasse = value; }
        }

        public List<Personnage> listePersonnage
        {
            get { return _listePersonnage; }
            set { _listePersonnage = value; }
        }

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
