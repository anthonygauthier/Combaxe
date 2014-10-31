using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Combaxe___New.classes
{
    public class Combat
    {
        public int ViePersonnage { get; set; }
        public int EnergiePersonnage { get; set; }
        public int VieEnnemi { get; set; }
        public int EnergieEnnemi { get; set; }

        public Combat()
        {
            ViePersonnage = 0;
            EnergiePersonnage = 0;
            VieEnnemi = 0;
            EnergieEnnemi = 0;
        }

        public Combat(Personnage personnage, Ennemi ennemi)
        {
            ViePersonnage = VarGlobales.Personnage.Vie;
            EnergiePersonnage = VarGlobales.Personnage.Energie;
            VieEnnemi = Convert.ToInt32((ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416);
            EnergieEnnemi = Convert.ToInt32((ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 10) / 3.1416);
        }

        /// <summary>
        /// Fonction qui enleve le nombre de point de vie perdu selon l'attaque- William Themens
        /// </summary>
        /// <param name="degat">Le nombre de dégât infligé</param>
        /// <param name="victime">L'unité qui resoit les dégats</param>
        /// <returns></returns>
        //public void PerteDeVie(int degat, Object victime)
        //{
        //    if(victime.GetType() == VarGlobales.Ennemi.GetType())
        //    {
        //        VieEnnemi = VieEnnemi - degat;
        //    }
        //    else
        //    {
        //        ViePersonnage = ViePersonnage - degat;
        //    }
        //}

        /// <summary>
        /// Fonction qui enleve le nombre de point d'énergie utilisé - William Themens
        /// </summary>
        /// <param name="energie">Le nombre de point d'énergie utilisé</param>
        /// <param name="victime">L'unité qui pert de l'énergie</param>
        /// <returns></returns>
        //public int PerteDEnergie(int energie, Object victime)
        //{
        //    if (victime.GetType() == VarGlobales.Ennemi.GetType())
        //    {
        //        EnergieEnnemi = EnergieEnnemi - energie;
        //        return EnergieEnnemi;
        //    }
        //    else
        //    {
        //        EnergiePersonnage = EnergiePersonnage - energie;
        //        return EnergiePersonnage;
        //    }
        //}

        /// <summary>
        /// Fonction qui verifie, selon le nombre de point d'énergie restante et nessessaire si la compétence peut être utilisé - William Themens
        /// </summary>
        /// <param name="energieNecessaire">Nombre d'énergie nécessaire pour faire la compétence</param>
        /// <param name="energieRestant">Nombre d'énergie restant à l'utilisateur</param>
        /// <returns></returns>
        public bool VerifierEnergieRestante(int energieNecessaire, int energieRestant)
        {
            if(energieRestant>=energieNecessaire)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Fonction qui vérifie si l'unité fait un coup critique - William Themens
        /// </summary>
        /// <param name="vitesse">La vitesse de l'unité qui tente de faire un coup critique</param>
        /// <returns></returns>
        public bool EstCritique(int vitesse)
        {
            int chanceCritique = Convert.ToInt32(vitesse * 2 / 3.1416);
            Random rand = new Random();
            if (rand.Next(100) <= chanceCritique)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        /// <summary>
        /// Fonction qui vérifie si l'unité esquive - William Themens
        /// </summary>
        /// <param name="vitesse">La vitesse de l'unité qui tente d'esquivé</param>
        /// <returns></returns>
        public bool EstEsquive(int vitesse)
        {
            int chanceEsquive = Convert.ToInt32(vitesse / 3.1416);
            Random rand = new Random();
            if (rand.Next(100) <= chanceEsquive)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        /// <summary>
        /// Fonction pour calculer les dégâts/les points d'absortions/points de guérisons - William Themens
        /// </summary>
        /// <param name="pointMin">La valeur minimum de la compétence</param>
        /// <param name="pointMax">La valeur maximum de la compétence</param>
        /// <param name="estPersonnage">Savoir s'il s'agit d'un personnage ou non</param>
        /// <param name="critique">Savoir s'il s'agit d'un cout critique</param>
        /// <returns>Le nombre de dégâts que l'attaque cause</returns>
        public int CalculValeurCompetence(int pointMin, int pointMax, bool estPersonnage, ref bool critique)
        {
            int valeur = 0;
            Random aleatoire = new Random();
            //on fait le random entre le min et le max
            valeur = aleatoire.Next(pointMin, pointMax);
            //on vérifie si le coup est estCritique
            if (estPersonnage)
            {
                if (EstCritique(Convert.ToInt32(VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur)))
                {
                    //si critique, on change la valeur du bool et augmente de 50% les dégats
                    critique = true;
                    valeur = Convert.ToInt32(valeur * 1.5);
                }
            }
            else
            {
                if (EstCritique(Convert.ToInt32(VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur)))
                {
                    //si critique, on change la valeur du bool et augmente de 50% les dégats
                    critique = true;
                    valeur = Convert.ToInt32(valeur * 1.5);
                }
            }
            // on retourne la valeur
            return valeur;

        }

        /// <summary>
        /// Fonction qui calcul les dégats qui son subi - William Themens
        /// </summary>
        /// <param name="pointDegat">Les dégâts fait par l'autre unité</param>
        /// <param name="estPersonnage">Permet de savoir s'il s'agit d'un personnage</param>
        /// <param name="esquive">permet de savoir si l'attaque a été esquivé</param>
        /// <returns>Le nombre de dégats subi</returns>
        public int CalculDegatSubi(ref int pointDegat, bool estPersonnage, ref bool esquive)
        {
            int valeur = 0;
            //on vérifie si le coup est esquivé
            if (estPersonnage)
            {
                //On appele la fonction esquive
                if (EstEsquive(Convert.ToInt32(VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur)))
                {
                    //Si esquivé on change la valeur du bool et on retourne 0
                    esquive = true;
                    return 0;
                }
                //on calcule la résistance de la cible
                int resistance = Convert.ToInt32(Convert.ToInt32(VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur)/3.1416);

                //on soustrait la résistance aux dégâts
                valeur = pointDegat - resistance;
            }
            else
            {
                //On appele la fonction esquive
                if (EstEsquive(Convert.ToInt32(VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur)))
                {
                    //Si esquivé on change la valeur du bool et on retourne 0
                    esquive = true;
                    return 0;
                }
                //on calcule la résistance de la cible
                int resistance = Convert.ToInt32(Convert.ToInt32(VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Defense].Valeur)/ 3.1416);

                //on soustrait la résistance aux dégâts
                valeur = pointDegat - resistance;
            }

            return valeur;
        }

        /// <summary>
        /// Pour définir qui est la cible et les valeurs réels pour le min et max
        /// </summary>
        /// <param name="num">le bouton cliqué</param>
        /// <param name="cibleEnnemi">si la cible est l'ennemi ou le personnage</param>
        /// <param name="valeurMin">la valeur minimum de la compétence</param>
        /// <param name="valeurMax">la valeur maximum de la compétence</param>
        public void cibleValeur(int num, ref bool cibleEnnemi, ref int valeurMin, ref int valeurMax)
        {
            if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Physique.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                cibleEnnemi = true;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Defensive.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                cibleEnnemi = false;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Magique.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                cibleEnnemi = true;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == Competences.Support.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                cibleEnnemi = false;
            }
        }

        /// <summary>
        /// Pour définir qui est la cible et les valeurs réels pour le min et max
        /// </summary>
        /// <param name="num">le bouton cliqué</param>
        /// <param name="cibleEnnemi">si la cible est l'ennemi ou le personnage</param>
        /// <param name="valeurMin">la valeur minimum de la compétence</param>
        /// <param name="valeurMax">la valeur maximum de la compétence</param>
        public void CibleValeurEnnemi(int num, ref bool cibleEnnemi, ref int valeurMin, ref int valeurMax)
        {
            if (VarGlobales.Ennemi.ListeCompetence[num].NomTypeCompetence == Competences.Physique.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                valeurMax = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Force].Valeur);
                cibleEnnemi = true;
            }
            else if (VarGlobales.Ennemi.ListeCompetence[num].NomTypeCompetence == Competences.Defensive.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMin + VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                valeurMax = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMax + VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 1.5 / 3.1416);
                cibleEnnemi = false;
            }
            else if (VarGlobales.Ennemi.ListeCompetence[num].NomTypeCompetence == Competences.Magique.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                valeurMax = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur);
                cibleEnnemi = true;
            }
            else if (VarGlobales.Ennemi.ListeCompetence[num].NomTypeCompetence == Competences.Support.ToString())
            {
                valeurMin = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMin + VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                valeurMax = Convert.ToInt32(VarGlobales.Ennemi.ListeCompetence[num].ValeurMax + VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20 / 3.1416);
                cibleEnnemi = false;
            }
        }

        /// <summary>
        /// Fonction qui renvoie l'expérience gagné pour le combat - William Themens
        /// </summary>
        /// <returns></returns>
        public int ExperienceRecu()
        {
            return Convert.ToInt32((((VarGlobales.Ennemi.Niveau * 10) * (VarGlobales.Ennemi.Niveau * 10) + 1000) / 31) * 3.1416);
        }

        /// <summary>
        /// Fonction qui dit si le personnage monte de niveau - William Themens
        /// </summary>
        /// <returns></returns>
        public bool NiveauSuperieur()
        {
            if(VarGlobales.Personnage.Experience>= Convert.ToInt32(((VarGlobales.Personnage.Niveau*10)*(VarGlobales.Personnage.Niveau*10) +10)*3.1416))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
