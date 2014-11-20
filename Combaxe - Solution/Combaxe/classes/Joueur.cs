using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Combaxe___New.classes.services;

namespace Combaxe___New.classes
{
    public class Joueur
    {
        public int IdJoueur { get; set; }
        private int _idJoueur;
        private string _pseudo;

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

        /// <summary>
        /// Constructeur de base
        /// </summary>
        public Joueur()
        {
            idJoueur = 0;
            pseudo = "";
        }

        /// <summary>
        /// Constructeur paramétré
        /// </summary>
        /// <param name="id">id du joueur</param>
        /// <param name="user">pseudonyme du compte du joueur</param>
        /// <param name="mdp">mot de passe du compte du joueur</param>
        /// <param name="lstPerso">liste de personnage(s) du joueur</param>
        public Joueur(int id, string user)
        {
            idJoueur = id;
            pseudo = user;
        }

        /// <summary>
        /// Méthode pour changer de personnage
        /// </summary>
        public void ChangerPersonnage()
        {
            return;
        }

        /// <summary>
        /// Méthode pour se déconnecter
        /// </summary>
        public void Deconnexion()
        { 
            this.idJoueur = 0; // vaut 0 lorsque le joueur n'est pas connecté
            this.pseudo = "";
            if (VarGlobales.Personnage != null)
                VarGlobales.Personnage.Deconnexion();
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
