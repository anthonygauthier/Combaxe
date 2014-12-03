using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using Combaxe___New.classes;
using Combaxe___New.classes.services;
using System.Media;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Interaction logique pour EcranCombat.xaml
    /// </summary>
    public partial class EcranCombat : Window
    {
        public EcranCombat()
        {
            InitializeComponent();
            tempsRecharge = new List<int>();
            chargerEnnemi();
            chargerPersonnage();
            combat = new Combat(VarGlobales.Ennemi);
            chronometreCombat();
            StatistiqueService statsService = new StatistiqueService();
            statsService.miseAjourStatistiques("nombreDeCombat = nombreDeCombat+1");
            VerifierRapidite();
            EmphasePersonnage();
            //String valeur = effets.Source.ToString();
        }

        //On déclare les variables nécéssaires aux différents délais/timers - Anthony Gauthier
        DispatcherTimer horloge; //Pour le chronomètre
        DispatcherTimer timer; //Pour le délai d'attaque de l'ennemi 
        DispatcherTimer tempsCaracteristiques; //Pour la page de l'écran de caractéristiques

        TimeSpan temps; //Temps pour le chronomètre

        bool boutonClique = false;

        // pour utliser les méthodes de combat, tommy gingras
        Combat combat;
        int nbTour = 0;
        int boutonCliquer;
        List<int> tempsRecharge = null;
        
                
        //Méthode du bouton pour fuir un combat - Anthony Gauthier 23/10/2014
        private void btnFuir_Click(object sender, RoutedEventArgs e)
        {
            fuiteDuJoueur();
        }

        private void btnPotionEnergie_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            DeroulementCombat(5);
        }

        private void btnPotionVie_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            DeroulementCombat(4);
        }

        /// <summary>
        /// Fonction qui rempli les boutons au loading the l'écran
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            //On charge les boutons de potions
            btnPotionVie.Content = "Potion de vie (" + VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Vie].Quantite + ")";
            btnPotionEnergie.Content = "Potion d'énergie (" + VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Energie].Quantite + ")";
            btnPotionVie.ToolTip = "Cette potion régénère 30% de votre vie";
            btnPotionEnergie.ToolTip = "Cette potion régénère 30% de votre énergie";

            if (VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Vie].Quantite == 0)
            {
                btnPotionVie.IsEnabled = false;
            }
            if (VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Energie].Quantite == 0)
            {
                btnPotionEnergie.IsEnabled = false;
            }

            //On charge les boutons de compétence
            //Vérifie si le personnage a assez d'énergie pour ses actions
            VerifierEnergie();

            btnAction1.Content = VarGlobales.Personnage.ListeCompetence[0].Nom;
            btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom;
            btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom;
            btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom;

            btnAction1.ToolTip = afficherTooltip(0);
            btnAction2.ToolTip = afficherTooltip(1);
            btnAction3.ToolTip = afficherTooltip(2);
            btnAction4.ToolTip = afficherTooltip(3);

            tempsRecharge[0] = 0;
            if (tempsRecharge[1] > 0)
            {
                btnAction2.IsEnabled = false;
                btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom + "\n(" + (tempsRecharge[1] + 1) + ")";
            }
            if (tempsRecharge[2] > 0)
            {
                btnAction3.IsEnabled = false;
                btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom + "\n(" + (tempsRecharge[2] + 1) + ")";
            }
            if (tempsRecharge[3] > 0)
            {
                btnAction4.IsEnabled = false;
                btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom + "\n(" + (tempsRecharge[3] + 1) + ")";
            }

        }

        private void btnAction1_Click(object sender, RoutedEventArgs e)
        {
            //Tommy gingras
            boutonClique = true;
            DeroulementCombat(0); 
        }

        private void btnAction2_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            //tommy gingras
            DeroulementCombat(1); 
        }

        private void btnAction3_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            //tommy gingras
            DeroulementCombat(2); 
        }

        private void btnAction4_Click(object sender, RoutedEventArgs e)
        {
            boutonClique = true;
            //tommy gingras
            DeroulementCombat(3); 
        }

        /// <summary>
        /// Dès que les barres sont loadés, on met à jour la barre de points de vie du personnage.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void brdMaxWidth_Loaded(object sender, RoutedEventArgs e)
        {
            MajBarreViePerso((int)(brdMaxWidth.ActualWidth));
            MajBarreEnergiePerso((int)(brdMaxWidth.ActualWidth));
            MajBarreExperience((int)(brdMaxWidth.ActualWidth));
        }

        //Chronomètre de combat - Anthony Gauthier 28/10/2014
        private void chronometreCombat()
        {
            //Si un bouton a été cliqué
            if (boutonClique)
            {
                horloge.Stop();
            }
            //On initialise le temps de l'horloge et la progress bar
            temps = TimeSpan.FromSeconds(30);
            pbHorloge.Foreground = Brushes.LightGreen;
            pbHorloge.Maximum = temps.TotalSeconds;
            pbHorloge.Value = pbHorloge.Maximum;
            const int SOUSTRACTIONTEMPS = -1;

            horloge = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                txtbHorloge.Text = temps.ToString("%s"); //%s spécifie que nous ne voulons que les secondes qui s'affichent

                if(temps == TimeSpan.Zero)
                {
                    horloge.Stop();
                    DeroulementCombat(-1);
                }
                //Si l'horloge atteint "0", ou l'ennemi est mort, ou le personnage est mort : on arrête le cadran
                else if (combat.VieEnnemi <= 0 || VarGlobales.etaitMort == true)
                {
                    horloge.Stop(); 
                    if(timer != null)
                        timer.Stop();

                    VarGlobales.etaitMort = false;
                }
                //Sinon, on ajoute du temps à l'horloge
                else
                {
                    //Dépendemment du nombre de secondes qui sont affiché à l'horloge, la couleur de la progress bar change
                    if(temps == TimeSpan.FromSeconds(15))
                    {
                        pbHorloge.Foreground = Brushes.Yellow;
                    }
                    else if (temps == TimeSpan.FromSeconds(7))
                    {
                        pbHorloge.Foreground = Brushes.Red;
                    }                    
                    //On ajoute (enlève) le temps à l'horloge puis on modifie la valeur de la progress bar
                    temps = temps.Add(TimeSpan.FromSeconds(SOUSTRACTIONTEMPS));
                    pbHorloge.Value = temps.TotalSeconds;
                }
            }, Application.Current.Dispatcher);

            horloge.Start();  
        }

        /// <summary>
        /// pour mettre les infos d'un personnage, tommy gingras
        /// </summary>
        private void chargerPersonnage()
        {
            this.imgPerso.Source = VarGlobales.Personnage.Image;
            lblNomPerso.Content = VarGlobales.Personnage.Nom;
            lblNiveauPerso.Content = lblNiveauPerso.Content + VarGlobales.Personnage.Niveau.ToString();
            lblViePerso.Content = "Points de vie (PV): "+ VarGlobales.Personnage.Vie.ToString() + "/" + VarGlobales.Personnage.VieMaximale.ToString();
            lblEnergiePerso.Content = "Points d'énergie (PE): " + VarGlobales.Personnage.Energie.ToString() + "/" + VarGlobales.Personnage.EnergieMaximale.ToString();
            lblExperiencePerso.Content = "Points d'expérience (XP): " + VarGlobales.Personnage.Experience + "/" + VarGlobales.Personnage.ExperienceMaximale.ToString();
            tempsRecharge.Add(0);
            tempsRecharge.Add(0);
            tempsRecharge.Add(0);
            tempsRecharge.Add(0);
        }

        /// <summary>
        /// Pour mettre les infos d'un ennemi
        /// Fonction qui charge un nouvel ennemi - William Themens
        /// </summary>
        private void chargerEnnemi()
        {
            Ennemi ennemi = new Ennemi();
            if(VarGlobales.campagne)
            {
                ennemi.boss();

                //On affiche l'histoire relié au boss.
                this.IsEnabled = false;
                CampagneService campagneService = new CampagneService();
                string histoire = campagneService.RetrieveHistoire("début");

                if (MessageBox.Show(histoire, "Histoire campagne", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK)
                {
                    //On réactive la fenêtre et le combat commence.
                    this.IsEnabled = true;
                }
            }
            else
            {
                ennemi.ennemiAleatoire();
            }
            imgEnnemi.Source = VarGlobales.Ennemi.Image;
            lblNomEnnemi.Content = VarGlobales.Ennemi.Nom;
            lblNiveauEnnemi.Content = lblNiveauEnnemi.Content + VarGlobales.Ennemi.Niveau.ToString();
            lblVieEnnemi.Content = "Points de vie (PV): " + Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416).ToString() + "/" + Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416).ToString();
            lblEnergieEnnemi.Content = "Points d'énergie (PE): " + Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 10) / 3.1416).ToString() + "/" + Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 10) / 3.1416).ToString();
        }

        /// <summary>
        /// pour afficher le tooltip pour une compétence, tommy gingras
        /// </summary>
        /// <param name="num">le numéro du bouton</param>
        /// <returns>un objet de type tooltip</returns>
        private ToolTip afficherTooltip(int num)
        {
            CompetenceService competenceService = new CompetenceService();
            ToolTip toolTip = new ToolTip();
            toolTip.Content = VarGlobales.Personnage.ListeCompetence[num].Nom + "\nType : " + VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence;
            toolTip.Content += "\n" + VarGlobales.Personnage.ListeCompetence[num].Description;
            //if pour le type d'attaque
            //List<string> typesAttaque = competenceService.RetrieveListeTypeCompetence();
            // requête bd pour définir les types de competence
            toolTip.Content += afficherDetailsTooltip(num);
            toolTip.Content += "\nCoût d'énergie : " + VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise;
            toolTip.Content += "\nTemps de recharge : " + VarGlobales.Personnage.ListeCompetence[num].TempsRecarge;

            // on fait calcul valeur 
            // on attribut le bon texte pour le tooltip
            // on retourne la valeur
            return toolTip;
        }

        /// <summary>
        /// Pour afficher les détails d'un bouton, tommy gingras
        /// </summary>
        /// <param name="num">le numéro du bouton</param>
        /// <returns>la description</returns>
        private string afficherDetailsTooltip(int num)
        {
            string content = "";
            
            if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == TypeCompetence.Physique.ToString())
            { // Attaque physique
                // Min dégât + 31.416%/2.2 * (points de caractéristique de force + points de caractéristique de force des équipements)
                // Max dégât + 31.416%/2.2 * (des points de caractéristique de force + points de caractéristique de force des équipements)
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin * 0.31416 / 2.2 * (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int) Caracteristiques.Force].Valeur));
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax * 0.31416 / 2.2 * (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Force].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int) Caracteristiques.Force].Valeur));
                content = "\nDégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == TypeCompetence.Defensive.ToString())
            { // Defense
                // point de défense *1.5/3.1416
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int) Caracteristiques.Energie].Valeur) * 1.5 / 3.1416);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Energie].Valeur) * 1.5 / 3.1416);
                content = "\nRésistance au dégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == TypeCompetence.Magique.ToString())
            { // Magique
                // o	Min = Min dégât pouvoir + 31.416%/2 * des points de caractéristique d’énergie
                // o	Max = Max dégât pouvoir + 31.416%/2 * des points de caractéristique d’énergie

                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin* 0.31416 / 2.2 * (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int) Caracteristiques.Energie].Valeur));
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax* 0.31416 / 2.2 * (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int) Caracteristiques.Energie].Valeur));
                content = "\nDégât : " + valeurMin + " - " + valeurMax;
            }
            else if (VarGlobales.Personnage.ListeCompetence[num].NomTypeCompetence == TypeCompetence.Support.ToString())
            { // support
                //((point de caractéristique de vie)*20)/3.1416
                int valeurMin = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMin + (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int) Caracteristiques.Vie].Valeur) * 20 / 3.1416);
                int valeurMax = Convert.ToInt32(VarGlobales.Personnage.ListeCompetence[num].ValeurMax + (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int) Caracteristiques.Vie].Valeur) * 20 / 3.1416);
                content = "\nRégénération : " + valeurMin + " - " + valeurMax;
            }
            return content;
        }

        /// <summary>
        /// pour mettre à jour la vie et l'énergie
        /// </summary>
        private void majInterface(bool estEnnemi)
        {
            lblEnergieEnnemi.Content = "Points d'énergie (PE): " + combat.EnergieEnnemi + "/" + Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Energie].Valeur * 10) / 3.1416).ToString();
            lblEnergiePerso.Content = "Points d'énergie (PE): " + VarGlobales.Personnage.Energie + "/" + VarGlobales.Personnage.EnergieMaximale;
            lblVieEnnemi.Content = "Points de vie (PV): " + combat.VieEnnemi + "/" + Convert.ToInt32((VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vie].Valeur * 20) / 3.1416).ToString();
            tempsRecharge[0] = 0;

            if (VarGlobales.Personnage.Vie <= 0)
            {
                lblViePerso.Content = "Points de vie (PV): " + 0 + "/" + VarGlobales.Personnage.VieMaximale;
            }
            else 
            {
                lblViePerso.Content = "Points de vie (PV): " + VarGlobales.Personnage.Vie + "/" + VarGlobales.Personnage.VieMaximale;
            }
            
            if(estEnnemi == false)
            {
                //On vérifie le temps de recharge de chaque action
                if (tempsRecharge[1] > 0)
                {
                    btnAction2.IsEnabled = false;
                    btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom + "\n(" + tempsRecharge[1] + ")";
                    tempsRecharge[1] -= 1;
                }
                else
                {
                        btnAction2.Content = VarGlobales.Personnage.ListeCompetence[1].Nom;
                        btnAction2.IsEnabled = true;

                }

                if (tempsRecharge[2] > 0)
                {
                        btnAction3.IsEnabled = false;
                        btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom + "\n(" + tempsRecharge[2] + ")";
                        tempsRecharge[2] -= 1;
                }
                else
                {
                        btnAction3.IsEnabled = true;
                        btnAction3.Content = VarGlobales.Personnage.ListeCompetence[2].Nom;
                }
                if (tempsRecharge[3] > 0)
                {
                    btnAction4.IsEnabled = false;
                    btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom + "\n(" + tempsRecharge[3] + ")";
                    tempsRecharge[3] -= 1;
                }
                else
                {
                    btnAction4.IsEnabled = true;
                    btnAction4.Content = VarGlobales.Personnage.ListeCompetence[3].Nom;
                }

                //Vérifie si le personnage a assez d'énergie pour ses actions
                VerifierEnergie();
            }
            else if (estEnnemi == true)
            {
                btnPotionVie.Content = "Potion de vie (" + VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Vie].Quantite + ")";
                btnPotionEnergie.Content = "Potion d'énergie (" + VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Energie].Quantite + ")";

                if (VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Vie].Quantite == 0)
                {
                    btnPotionVie.IsEnabled = false;
                }
                if (VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Energie].Quantite == 0)
                {
                    btnPotionEnergie.IsEnabled = false;
                }
            }
            MajBarreEnergiePerso((int)(brdMaxWidth.ActualWidth));
            MajBarreEnergieEnnemi((int)(brdMaxWidth.ActualWidth));
            MajBarreViePerso((int)(brdMaxWidth.ActualWidth));
            MajBarreVieEnnemi((int)(brdMaxWidth.ActualWidth));
        }

        /// <summary>
        /// Pour effectuer ce que les items font, potion vie, potion énergie, tommy gingras
        /// </summary>
        private void actionItem(int potion)
        {
            if (potion == 4 && VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Vie].Quantite>0) // vie
            {
                VarGlobales.Personnage.Vie += VarGlobales.Personnage.VieMaximale*30/100;
                if(VarGlobales.Personnage.Vie > VarGlobales.Personnage.VieMaximale)
                    VarGlobales.Personnage.Vie = VarGlobales.Personnage.VieMaximale;

                txtDmgPerso.Text += "+"+ VarGlobales.Personnage.VieMaximale * 30 / 100+ " PV \n\n";

                VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Vie].Quantite -= 1;
                majInterface(true);
            }
            else if (potion == 5 && VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Energie].Quantite>0) // énergie
            {
                VarGlobales.Personnage.Energie += VarGlobales.Personnage.EnergieMaximale*30/100;
                if(VarGlobales.Personnage.Energie > VarGlobales.Personnage.EnergieMaximale)
                    VarGlobales.Personnage.Energie = VarGlobales.Personnage.EnergieMaximale;
                VarGlobales.Personnage.Inventaire.listeConsommation[(int)Consommations.Energie].Quantite -= 1;

                txtDmgPerso.Text += "+" + VarGlobales.Personnage.EnergieMaximale * 30 / 100 + " PE \n\n";

                majInterface(true);
            }
            txtAttaquesPerso.ScrollToEnd();
            txtAttaquesPerso.Text += "\n";
            txtDmgPerso.ScrollToEnd();
            txtDmgPerso.Text += "\n";
            VarGlobales.sonPotion.Play();
        }
        /// <summary>
        /// Pour effectuer ce que les boutons doivent faire, tommy gingras
        /// </summary>
        /// <param name="num">le id du bouton pour les compétences</param>
        private void actionBouton(int num)
        {
            if (num == 4 || num == 5)
            {
                actionItem(num);
            }
            else
            {
                // on va chercher la bonne compétence la 1
                // on vérifie que l'énergie n'est pas manquante
                bool estUtilisable = combat.VerifierEnergieRestante(VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise, VarGlobales.Personnage.Energie);

                if (estUtilisable && tempsRecharge[num] == 0)
                {
                    // on calcul la valeur qui est effectué
                    tempsRecharge[num] = VarGlobales.Personnage.ListeCompetence[num].TempsRecarge + 1;
                    bool estCritique = false;
                    int valMin = 0;
                    int valMax = 0;
                    
                    bool cibleEnnemi = true;
                    bool esquive = false;

                    // on applique la bonne action pour la cible
                    combat.cibleValeur(num, ref cibleEnnemi, ref valMin, ref valMax);

                    int valeur = combat.CalculValeurCompetence(valMin, valMax, true, ref estCritique);
                    if (cibleEnnemi)
                    {
                        combat.CalculDegatSubi(ref valeur, false, ref esquive);
                        if (!esquive)
                        {
                            combat.VieEnnemi -= valeur;
                            StatistiqueService statsService = new StatistiqueService();
                            statsService.miseAjourStatistiques("dommageTotal =  DommageTotal + "+ valeur + ", nombreAttaque = nombreAttaque+1");
                            if (combat.VieEnnemi <= 0)
                            {
                                combat.VieEnnemi = 0;
                            }
                            VarGlobales.Personnage.Energie -= VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise;
                            txtDmgPerso.Text += valeur.ToString() + " dégâts\n\n"; ;
                        }
                        else
                        {
                            txtAttaquesPerso.Text += VarGlobales.Personnage.ListeCompetence[num].Nom + "\n\n";
                            txtDmgPerso.Text += "Esquive" + "\n\n"; ;
                        }
                    }
                    else
                    {
                        VarGlobales.Personnage.Vie += valeur;
                        if (VarGlobales.Personnage.Vie > VarGlobales.Personnage.VieMaximale)
                            VarGlobales.Personnage.Vie = VarGlobales.Personnage.VieMaximale;

                        VarGlobales.Personnage.Energie -= VarGlobales.Personnage.ListeCompetence[num].EnergieUtilise;
                        txtDmgPerso.Text += "+"+ valeur.ToString()+" PV \n\n";
                    }

                    majInterface(false);// mettre à jour l'interface

                    // on vérifie que l'ennemi n'est plus en vie
                    if (combat.VieEnnemi <= 0)
                    {
                        InventaireService inventaireService = new InventaireService();
                        PersonnageService personnageService = new PersonnageService();
                        int expGagner = combat.ExperienceRecu();

                        txtAttaquesEnnemi.Text += VarGlobales.Ennemi.Nom;
                        txtDmgEnnemi.Text += "MORT\n\n";
                        personnageService.MAJVieEnergie(false);

                        combat.VieEnnemi = 0;

                        VarGlobales.Ennemi.butinDonne();

                        //Donne l'argent du butin au personnage
                        VarGlobales.Personnage.Inventaire.argent += VarGlobales.Ennemi.Inventaire.argent;
                        inventaireService.MAJArgent();

                        //Donne les équipements du butin au personnage
                        VarGlobales.Personnage.Inventaire.listeEquipement.AddRange(VarGlobales.Ennemi.Inventaire.listeEquipement);
                        //Insert dans la BD les nouveau objet acquis par le personnage
                        inventaireService.MAJEquipementInventaire(VarGlobales.Personnage.Inventaire.listeEquipement);

                        //On effectue toutes les opérations reliées à l'expérience.
                        ExperienceVictoire(expGagner);
                        MajBarreExperience((int)(brdMaxWidth.ActualWidth));

                        boutonClique = true;
                        MessageBox.Show("Combat terminé, vous avez gagné !\n" + "Vous gagnez " + expGagner + " points d'expérience et "+Math.Round(VarGlobales.Ennemi.Inventaire.argent,2)+"$ ", "Statut", MessageBoxButton.OK, MessageBoxImage.Information);
                        
                        switch(VarGlobales.Ennemi.Inventaire.listeEquipement.Count())
                        {
                            case 1:
                                MessageBox.Show("Vous avez gagné:\n "+VarGlobales.Ennemi.Inventaire.listeEquipement[0].Nom,"Butin", MessageBoxButton.OK, MessageBoxImage.Information);
                                break;
                            case 2:
                                MessageBox.Show("Vous avez gagné:\n " + VarGlobales.Ennemi.Inventaire.listeEquipement[0].Nom + ",\n " + VarGlobales.Ennemi.Inventaire.listeEquipement[1].Nom, "Statut", MessageBoxButton.OK, MessageBoxImage.Information);
                                break;
                            case 3:
                                MessageBox.Show("Vous avez gagné:\n " + VarGlobales.Ennemi.Inventaire.listeEquipement[0].Nom + ",\n" + VarGlobales.Ennemi.Inventaire.listeEquipement[1].Nom + ",\n" + VarGlobales.Ennemi.Inventaire.listeEquipement[2].Nom, "Statut", MessageBoxButton.OK, MessageBoxImage.Information);
                                break;
                            case 0:
                                break;
                        }
                        //Si l'expérience gagné est plus grande ou égale à l'expérience maximale, on monte de niveau
                        if (VarGlobales.aMonterNiveau == true)
                        {
                            //On initialise un timer égal à celui du progress bar de l'écran de repos pour déterminer quand nous allons rendre la fenêtre utilisable à nouveau
                            temps = TimeSpan.FromHours(9999);

                            horloge = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
                            {
                                //On enleve du temps au timer
                                temps = temps.Add(TimeSpan.FromSeconds(-1));

                                //Si le joueur a modifier ses caractéristiques, on ferme la fenêtre
                                if (VarGlobales.fermerModifCaracteristique == true)
                                {
                                    //On réactive l'écran de combat
                                    this.Opacity = 1;
                                    this.IsEnabled = true;

                                    if (this.WindowStyle != WindowStyle.None)
                                    {
                                        this.WindowStyle = WindowStyle.SingleBorderWindow;
                                        this.ResizeMode = ResizeMode.CanResize;
                                    }

                                    //Lorsque le joueur a terminer de modifier les caractéristiques, on affiche le menu principal
                                    menuPrincipal();
                                }
                            }, Application.Current.Dispatcher);

                            horloge.Start();
                        }
                        else
                        {
                            menuPrincipal();
                        }
                    } 
                }
                txtAttaquesPerso.ScrollToEnd();
                txtAttaquesPerso.Text += "\n";
                txtDmgPerso.ScrollToEnd();
                txtDmgPerso.Text += "\n";
            }
        }

        /// <summary>
        /// Fonction qui se déclanche lorsque le btnFuite est cliqué
        /// </summary>
        private void fuiteDuJoueur()
        { 
            int vitessePersonnage = VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vitesse].Valeur;
            int vitesseEnnemi = VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur;

            horloge.Stop();

            //Si la vitesse de l'ennemi est plus rapide que celle du joueur, on inflige des dégâts
            if (vitesseEnnemi >= vitessePersonnage)
            {
                PersonnageService personnageService = new PersonnageService();

                int dmgMin = VarGlobales.Ennemi.ListeCompetence[0].ValeurMin;
                int dmgMax = VarGlobales.Ennemi.ListeCompetence[0].ValeurMax;
                Random randDmg = new Random();
                int dommageInflige = randDmg.Next(dmgMin, dmgMax); //On génère le dommage infligé
                VarGlobales.Personnage.Vie -= dommageInflige;

                personnageService.MAJVieEnergie(false);

                if (VarGlobales.Personnage.Vie <= 0)
                {
                    int xpPerdu = (int)(VarGlobales.Personnage.Experience * 0.50);
                    DefaitePersonnage();
                    MajBarreExperience((int)(brdMaxWidth.ActualWidth));
                    VarGlobales.Personnage.Mort(nbTour, horloge, xpPerdu);
                    VarGlobales.etaitMort = true;
                    menuPrincipal();
                }
                else if(MessageBox.Show("Vous fuyez le combat, mais le monstre est plus rapide que vous et a eu le temps de vous attaquer une dernière fois pour " + dommageInflige + " de dégâts.", "Fuite", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK)
                {
                    menuPrincipal();
                }
            }
            else
            {
                if (MessageBox.Show("Vous êtes plus rapide que l'ennemi et fuyez le combat sans problème", "Fuite", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK)
                    menuPrincipal();
            }
        }

        /// <summary>
        /// Fonction qui amène le joueur au menu principal suite à une fuite
        /// </summary>
        private void menuPrincipal()
        {
            if(timer != null)
            { 
                timer.Stop();
            }

            horloge.Stop();
            var EcranMenuPrincipal = new EcranMenuPrincipal();

            if (VarGlobales.campagne && combat.VieEnnemi <= 0)
            {
                CampagneService campService = new CampagneService();
                string HistoireFin = campService.RetrieveHistoire("fin");

                if (MessageBox.Show(HistoireFin,"Histoire Campagne",MessageBoxButton.OK,MessageBoxImage.Information) == MessageBoxResult.OK)
                {
                    //On met à jour la campagne du joueur.
                    PersonnageService persoService = new PersonnageService();
                    persoService.MajCampagnePerso();

                    if (VarGlobales.Personnage.IdCampagne == 7)
                    { 
                        //TODO. Définir qu'est-ce que la récompense suite à avoir tuer Arkanos.
                    }

                    //On affiche le menu principal
                    EcranMenuPrincipal.Show();
                    this.Close();
                }
            }
            EcranMenuPrincipal.Show();
            this.Close();
        }

        private void ActionEnnemi()
        {
            horloge.Stop();
            // on calcul la valeur qui est effectué
            int num = VarGlobales.Ennemi.AI(combat.VieEnnemi,combat.EnergieEnnemi);
            bool estCritique = false;
            int valMin = VarGlobales.Ennemi.ListeCompetence[num].ValeurMin;
            int valMax = VarGlobales.Ennemi.ListeCompetence[num].ValeurMin;
            bool cibleEnnemi = true;
            bool esquive = false;

            // on applique la bonne action pour la cible
            combat.CibleValeurEnnemi(num, ref cibleEnnemi, ref valMin, ref valMax);

            int valeur = combat.CalculValeurCompetence(valMin, valMax, true, ref estCritique);
            if (cibleEnnemi)
            {
                combat.CalculDegatSubi(ref valeur, false, ref esquive);
                if (!esquive)
                {
                    VarGlobales.Personnage.Vie -= valeur;
                    combat.EnergieEnnemi -= VarGlobales.Ennemi.ListeCompetence[num].EnergieUtilise;
                    txtAttaquesEnnemi.Text += VarGlobales.Ennemi.ListeCompetence[num].Nom + "\n\n";
                    txtDmgEnnemi.Text += valeur.ToString() + " dégâts\n\n";
                }
                else
                {
                    txtAttaquesEnnemi.Text += VarGlobales.Ennemi.ListeCompetence[num].Nom + "\n\n";
                    txtDmgEnnemi.Text += "Esquive \n\n";
                }
            }
            else
            {
                combat.VieEnnemi += valeur;
                if(combat.VieEnnemi >= combat.VieMaximale)
                {
                    combat.VieEnnemi = combat.VieMaximale;
                }
                combat.EnergieEnnemi -= VarGlobales.Ennemi.ListeCompetence[num].EnergieUtilise;
                txtAttaquesEnnemi.Text += VarGlobales.Ennemi.ListeCompetence[num].Nom + "\n\n";
                txtDmgEnnemi.Text += "+"+ valeur.ToString() + " PV \n\n";
            }
            // on vérifie quel est le type de compétence
            majInterface(true);// mettre à jour l'interface

            // on vérifie que le joueur ou l'ennemi est encore en vie
            if (VarGlobales.Personnage.Vie <= 0)
            {
                PersonnageService personnageService = new PersonnageService();

                txtAttaquesPerso.Text += VarGlobales.Personnage.Nom + "\n\n";
                txtDmgPerso.Text += "MORT\n\n";
                VarGlobales.Personnage.Vie = 0;

                int xpPerdu = (int)(VarGlobales.Personnage.Experience* 0.5);

                DefaitePersonnage();
                MajBarreExperience((int)(brdMaxWidth.ActualWidth));
                VarGlobales.Personnage.Mort(nbTour, horloge, xpPerdu);
                VarGlobales.etaitMort = true;
                menuPrincipal();
            }
            txtAttaquesEnnemi.ScrollToEnd();
            txtAttaquesEnnemi.Text += "\n";
            txtDmgEnnemi.ScrollToEnd();
            txtDmgEnnemi.Text += "\n";
            //On redémarre l'horloge de combat
            chronometreCombat();
        }

        private void DeroulementCombat(int btnClique)
        {
            EmphasePersonnage();
            if(temps == TimeSpan.FromSeconds(0))
            {
                txtAttaquesPerso.Text += "Temps écoulé\n\n";
                horloge.Stop();
                txtDmgPerso.Text += "\n\n";
                majInterface(false); // pour mettre a jour selon le nb tour
                DelaiAttaqueEnnemi(false);
            }
            else // si combat habituel
            {
                if (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vitesse].Valeur >= VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur)
                {
                    //On affiche tout de suite l'attaque choisie par le joueur
                    txtAttaquesPerso.Text += VarGlobales.Personnage.ListeCompetence[btnClique].Nom + "\n\n";
                    actionBouton(btnClique);
                    
                    /*Si l'ennemi est encore en vie, il va attaquer, mais on ajoute un délai pour faire comme si l'ennemi
                    Choisissais son attaque - Anthony Gauthier 2014-11-06*/
                    if(combat.VieEnnemi > 0)
                    {
                        DelaiAttaqueEnnemi(false);
                    }
                }
                else
                {
                    //On affiche tout de suite l'attaque choisie par le joueur
                    if (btnClique != 4 && btnClique != 5)
                        txtAttaquesPerso.Text += VarGlobales.Personnage.ListeCompetence[btnClique].Nom + "\n\n";
                    else if(btnClique == 4)
                        txtAttaquesPerso.Text += "Potion vie\n\n";
                    else if(btnClique == 5)
                        txtAttaquesPerso.Text += "Potion d'énergie\n\n";

                    boutonCliquer = btnClique;
                    DelaiAttaqueEnnemi(true);
                    
                }
            }
            
            nbTour++;

            //À tous les 2 tours, on regénère un peu d'énergie au personnage.
            if(nbTour % 2 == 0)
            {
                VarGlobales.Personnage.Energie = (int)((VarGlobales.Personnage.Energie) + (VarGlobales.Personnage.EnergieMaximale * 0.10));
                if (VarGlobales.Personnage.Energie >= VarGlobales.Personnage.EnergieMaximale)
                {
                    VarGlobales.Personnage.Energie = VarGlobales.Personnage.EnergieMaximale;
                }

                //Et de l'ennemi aussi
                combat.EnergieEnnemi = (int)((combat.EnergieEnnemi) + (combat.EnergieMaximale * 0.10));
                if (combat.EnergieEnnemi >= combat.EnergieMaximale)
                {
                    combat.EnergieEnnemi = combat.EnergieMaximale;
                }
            }
        }

        /// <summary>
        /// Fonction activé lorsque le joueur gagne un combat - Augmentation de son expérience - Anthony Gauthier 30/10/2014
        /// </summary>
        private void ExperienceVictoire(int experienceGagner)
        {
            PersonnageService persoService = new PersonnageService();

            MajBarreExperience((int)(brdMaxWidth.ActualWidth));
            //On donne l'expérience au joueur - Anthony Gauthier 30/10/2014
            txtAttaquesPerso.Text += "Victoire!\n\n ";
            if (VarGlobales.Personnage.Niveau < 20)
            {
                txtDmgPerso.Text += "+" + experienceGagner.ToString() + " XP \n\n";
                VarGlobales.Personnage.Experience = VarGlobales.Personnage.Experience + experienceGagner;
            }
            else
            {
                VarGlobales.Personnage.Experience = VarGlobales.Personnage.ExperienceMaximale-1;
            }

            //Si l'expérience gagné est plus grande ou égale à l'expérience maximale, on monte de niveau
            if (combat.NiveauSuperieur())
            {
                VarGlobales.Personnage.MonterNiveau();
                VarGlobales.aMonterNiveau = true;
                var EcranCar = new EcranCaracteristiques();

                //On initialise un timer égal à celui du progress bar de l'écran de repos pour déterminer quand nous allons rendre la fenêtre utilisable à nouveau
                temps = TimeSpan.FromHours(9999);

                tempsCaracteristiques = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
                {
                    //On enleve du temps au timer
                    temps = temps.Add(TimeSpan.FromSeconds(-1));

                    //Si le joueur a modifier ses caractéristiques, on ferme la fenêtre
                    if (VarGlobales.fermerModifCaracteristique == true)
                    {
                        tempsCaracteristiques.Stop();
                        EcranCar.Close();
                        //On update le joueur dans l'application suite à sa mise à jour en BD
                        VarGlobales.Personnage = persoService.selectionUnPersonnage(VarGlobales.Personnage.IdPersonnage);
                    }
                }, Application.Current.Dispatcher);

                tempsCaracteristiques.Start();

                //On désactive carrément l'écran de combat
                this.Opacity = 0.5;
                this.IsEnabled = false;
                this.Focusable = false;
                //Si le jeu n'est pas fullscreen
                if (this.WindowStyle != WindowStyle.None)
                {
                    this.WindowStyle = WindowStyle.None;
                    this.ResizeMode = ResizeMode.NoResize;
                }

                EcranCar.Show();
            }
            else if (VarGlobales.Personnage.Niveau < 20)
            {
                persoService.MiseAJourExperience();
                lblExperiencePerso.Content = VarGlobales.Personnage.Experience.ToString() + "/" + VarGlobales.Personnage.ExperienceMaximale.ToString();
            }
            else
            {
                lblExperiencePerso.Content = "Niveau Maximum";
            }
            StatistiqueService statsService = new StatistiqueService();
            statsService.miseAjourStatistiques("victoire = victoire + 1");
        }

        /// <summary>
        /// Fonction activée lorsque le joueur perd un combat - Diminution de son expérience - Anthony Gauthier 30/10/2014
        /// </summary>
        private void ExperienceDefaite(int experiencePerdu)
        {
            horloge.Stop();
            if(timer != null)
                timer.Stop();

            PersonnageService persoService = new PersonnageService();

            //On retire l'expérience au joueur - Anthony Gauthier 30/10/2014
            txtAttaquesPerso.Text += "Défaite!\n\n ";
            if (VarGlobales.Personnage.Niveau < 20)
            {
                txtDmgPerso.Text += "-"+ experiencePerdu.ToString() + " XP \n\n";
                VarGlobales.Personnage.Experience = VarGlobales.Personnage.Experience - experiencePerdu;
            }

            //Si l'expérience perdu est plus petite ou égale à 0, on gèle l'expérience du joueur à 0
            if (VarGlobales.Personnage.Experience <= 0)
            {
                VarGlobales.Personnage.Experience = 0;
            }

            persoService.MiseAJourExperience();

            if (VarGlobales.Personnage.Niveau < 20)
            {
                lblExperiencePerso.Content = VarGlobales.Personnage.Experience.ToString() + "/" + VarGlobales.Personnage.ExperienceMaximale.ToString();
            }
            else 
            {
                lblExperiencePerso.Content = "Niveau Maximum";
            }
        }

        /// <summary>
        /// Lorsqu'un personnage périt au combat.
        /// </summary>
        private void DefaitePersonnage()
        {
            //On calcule l'expérience perdu - Anthony Gauthier 30/10/2014
            int xpPerdu = (int)(VarGlobales.Personnage.Experience * 0.50);
            ExperienceDefaite(xpPerdu);
            StatistiqueService statsService = new StatistiqueService();
            statsService.miseAjourStatistiques("defaite = defaite + 1");
        }

        /// <summary>
        /// Quand le joueur se fait attaquer, sa barre de vie se réduit - Anthony Gauthier 04/11/2014
        /// </summary>
        private void MajBarreViePerso(int max)
        {
            int poucentageVie = (VarGlobales.Personnage.Vie*100)/VarGlobales.Personnage.VieMaximale;

            int widthAjuste = max - ((max * poucentageVie)/100);
            brdViePerso.Margin = new Thickness(5, 5, widthAjuste, 5);
            MajCouleurBarreVie(brdViePerso, VarGlobales.Personnage);
        }

        /// <summary>
        /// Quand le joueur utilise un sort, sa barre d'énergie se réduit - Anthony Gauthier 05/11/2014
        /// </summary>
        private void MajBarreEnergiePerso(int max)
        {
            int pourcentageEnergie = (VarGlobales.Personnage.Energie * 100) / VarGlobales.Personnage.EnergieMaximale;

            int widthAjuste = max - ((max * pourcentageEnergie) / 100);
            brdEnergiePerso.Margin = new Thickness(5, 5, widthAjuste, 5);
        }

        /// <summary>
        /// Met à jour la barre d'expérience du joueur
        /// </summary>
        /// <param name="max"></param>
        private void MajBarreExperience(int max)
        {
            if (VarGlobales.Personnage.Niveau < 20)
            {
                int pourcentageExp = (VarGlobales.Personnage.Experience * 100) / VarGlobales.Personnage.ExperienceMaximale;

                int widthAjuste = max - ((max * pourcentageExp) / 100);
                brdExperience.Margin = new Thickness(5, 5, widthAjuste, 5);
            }
            else
            {
                lblExperiencePerso.Content = "Niveau Maximum";
            }
        }

        /// <summary>
        /// Quand l'ennemi se fait attaquer, sa barre de vie se réduit - Anthony Gauthier 05/11/2014
        /// </summary>
        private void MajBarreVieEnnemi(int max)
        {
            int poucentageVie = (combat.VieEnnemi * 100) / combat.VieMaximale;

            int widthAjuste = max - ((max * poucentageVie) / 100);
            brdVieEnnemi.Margin = new Thickness(widthAjuste, 5, 5, 5);
            MajCouleurBarreVie(brdVieEnnemi, combat);
        }

        /// <summary>
        /// Quand le joueur utilise un sort, sa barre d'énergie se réduit - Anthony Gauthier 05/11/2014
        /// </summary>
        private void MajBarreEnergieEnnemi(int max)
        {
            int pourcentageEnergie = (combat.EnergieEnnemi * 100) / combat.EnergieMaximale;

            int widthAjuste = max - ((max * pourcentageEnergie) / 100);
            brdEnergieEnnemi.Margin = new Thickness(widthAjuste, 5, 5, 5);
        }


        /// <summary>
        /// Met à jour la couleur des barres de vie de l'ennemi et du perso - Anthony Gauthier 05/11/2014 
        /// </summary>
        /// <param name="uneBordure">Recoit la barre a modifier</param>
        private void MajCouleurBarreVie(Border uneBordure, object unObjet)
        { 
            //Si l'objet passé est un personnage, on met à jour la couleur de la barre de vie du personnage
            if(unObjet.GetType() == VarGlobales.Personnage.GetType())
            { 
                //Si la vie du personnage est inférieur ou égale à 50%
                if (VarGlobales.Personnage.Vie <= VarGlobales.Personnage.VieMaximale * 0.5)
                {
                    if(VarGlobales.Personnage.Vie <= VarGlobales.Personnage.VieMaximale * 0.25)
                    {
                        uneBordure.Background = Brushes.Red;
                    }
                    else
                    {
                        uneBordure.Background = Brushes.Yellow;
                    }
                }
                else if (VarGlobales.Personnage.Vie > VarGlobales.Personnage.VieMaximale * 0.50)
                {
                    uneBordure.Background = Brushes.Green;
                }
            }
            //Sinon, on fait les changements pour la barre de points de vie de l'ennemi
            else
            {
                //Si la vie de l'ennemi est inférieur ou égale à 50%
                if (combat.VieEnnemi <= combat.VieMaximale * 0.5)
                {
                    if (combat.VieEnnemi <= combat.VieMaximale * 0.25)
                    {
                        uneBordure.Background = Brushes.Red;
                    }
                    else
                    {
                        uneBordure.Background = Brushes.Yellow;
                    }
                }
                else if (combat.VieEnnemi > combat.VieMaximale * 0.50)
                {
                    uneBordure.Background = Brushes.Green;
                }
            }
        }

        /// <summary>
        /// Méthode qui indique que c'est l'ennemi qui attaque en créer un "délai" qui désactive tout l'écran et
        /// lorsqu'on réactive, l'ennemi attaque. La désactivation permet aussi à ce que le joueur ne puisse 
        /// tricher et attaquer pendant le délai. - Anthony Gauthier 2014/11/06
        /// </summary>
        private void DelaiAttaqueEnnemi(bool rapiditePerso)
        {
            //Si le délai est mis à 0, l'ennemi attaque directement
            if (VarGlobales.delaiMin == 0 && VarGlobales.delaiMax == 0)
            {
                ActionEnnemi();
                if (rapiditePerso == true)
                {
                    if (VarGlobales.Personnage.Vie > 0)
                        actionBouton(boutonCliquer);
                }
            }
            //Sinon, on fait le délai
            else
            {
                this.IsEnabled = false;
                TimeSpan secondes;
                chronometreCombat();

                //On met l'emphase sur l'ennemi en grisant les choses du personnage
                brdEnnemiActif.Visibility = Visibility.Visible;
                brdPersoActif.Visibility = Visibility.Hidden;
                imgPerso.Opacity = 0.5;
                brdEnergiePerso.Opacity = 0.5;
                brdViePerso.Opacity = 0.5;
                brdExperience.Opacity = 0.5;
                lblNiveauPerso.Opacity = 0.5;
                lblNomPerso.Opacity = 0.5;

                //On ramenne les info de l'ennemi normalement
                imgEnnemi.Opacity = 1;
                brdEnergieEnnemi.Opacity = 1;
                brdVieEnnemi.Opacity = 1;
                lblNiveauEnnemi.Opacity = 1;
                lblNomEnnemi.Opacity = 1;

                Random rand = new Random();
                int nbrRandom = rand.Next(VarGlobales.delaiMin, VarGlobales.delaiMax);

                secondes = TimeSpan.FromSeconds(0);

                timer = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
                {
                    secondes = secondes.Add(TimeSpan.FromSeconds(1));

                    //Si le délai est terminé, on fait l'attaque de l'ennemi
                    if (secondes == TimeSpan.FromSeconds(nbrRandom))
                    {
                        timer.Stop();
                        this.IsEnabled = true;
                        if (combat.VieEnnemi != 0)
                        {
                            brdEnnemiActif.Visibility = Visibility.Hidden;
                            imgPerso.Opacity = 1;
                            brdEnergiePerso.Opacity = 1;
                            brdViePerso.Opacity = 1;
                            brdExperience.Opacity = 1;
                            lblNiveauPerso.Opacity = 1;
                            lblNomPerso.Opacity = 1;

                            ActionEnnemi();
                            if (rapiditePerso == true)
                            {
                                if (VarGlobales.Personnage.Vie > 0)
                                    actionBouton(boutonCliquer);
                            }
                            EmphasePersonnage();
                        }
                    }

                }, Application.Current.Dispatcher);
                timer.Start();
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string tourParTour = "But du jeu\nLe jeu se déroule tour par tour, celui qui est plus rapide débute le combat. Ensuite tour par tour les personnages s'affrontent en choisissant selon une stratégie des actions qui mèneront à la victoire.";
            string action = "\n\nActions\nPour effectuer une action, vous devez cliquer sur le bouton 'actions', ensuite vous pouvez faire le choix de votre action. Pour plus d'information à propos de leurs effets, vous pouvez passer la souris sur l'action désirée et vous pourrez voir sa description.";
            string items = "\n\nItems\nPour utiliser un objet qui aide le personnage, vous pouvez cliquer sur le bouton 'Items'. Ensuite si vous possédez préalablement des potions de vie ou de mana, vous allez pouvoir les utilisées. Pour connaitre leur effet, vous pouvez glisser votre souris sur la potion désirée";
            string fuir = "\n\nFuir\nVous pouvez fuir un combat, cependant si l'ennemi est plus rapide que vous il vous inflige des dégâts supplémentaires. Sinon vous pouvez fuir librement.";
            string personnage = "\n\nSection personnage\nCette section est la partie de gauche de l'écran. Tout ce qui se rapporte au personnage se retrouve de ce côté. Pour les actions, cette partie ce retrouve au centre.";
            string ennemi = "\n\nSection ennemi\nCette section est la partie de droite de l'écran. Tout ce qui se rapporte à l'ennemi se retrouve de ce côté.";
            string affichage = "\n\nJournal de combat\nLa partie de droite signifie le résultat de l'action du joueur. La partie de gauche signifie le résultat de l'action de l'ennemi.";
            string energie = "\n\nÉnergie\nL'énergie se régénère de 5% à chaque tour, autant chez le joueur que l'ennemi.";

            this.IsEnabled = false;
            horloge.Stop();

            if(MessageBox.Show(tourParTour + action + items + fuir + personnage + ennemi + affichage + energie, "Aide Combat", MessageBoxButton.OK, MessageBoxImage.Information) == MessageBoxResult.OK)
            { 
                this.IsEnabled = true;
                horloge.Start();
            }
        }

        /// <summary>
        /// Méthode qui vérifie et désactive les actions dont le personnage n'a pas assez d'énergie
        /// </summary>
        private void VerifierEnergie()
        {
            //On vérifie si le personnage a assez d'énergie pour faire l'action
            if (VarGlobales.Personnage.ListeCompetence[1].EnergieUtilise > VarGlobales.Personnage.Energie)
            {
                btnAction2.IsEnabled = false;
                btnAction2.Content += "\n" + VarGlobales.Personnage.ListeCompetence[1].EnergieUtilise + " PE requis";
            }

            if (VarGlobales.Personnage.ListeCompetence[2].EnergieUtilise > VarGlobales.Personnage.Energie)
            {
                btnAction3.IsEnabled = false;
                btnAction3.Content += "\n" +VarGlobales.Personnage.ListeCompetence[2].EnergieUtilise + " PE requis";
            }

            if (VarGlobales.Personnage.ListeCompetence[3].EnergieUtilise > VarGlobales.Personnage.Energie)
            {
                btnAction4.IsEnabled = false;
                btnAction4.Content += "\n" + VarGlobales.Personnage.ListeCompetence[3].EnergieUtilise + " PE requis";
            }
        }

        /// <summary>
        /// Fonction qui détermine qui est plus rapide entre l'ennemi et le personnage
        /// </summary>
        private void VerifierRapidite()
        { 
            if (VarGlobales.Personnage.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur + VarGlobales.lstCaracteristiqueEquipement[(int)Caracteristiques.Vitesse].Valeur >= VarGlobales.Ennemi.ListeCaracteristique[(int)Caracteristiques.Vitesse].Valeur)
            {
                if(nbTour==0)
                {
                    txtAttaquesPerso.Text += "Premier a attaquer\n\n";
                    txtDmgPerso.Text += "<- \n\n";
                    txtDmgEnnemi.Text += "\n\n\n";
                    txtAttaquesEnnemi.Text += "\n\n\n";
                }
            }
            else
            {
                if (nbTour == 0)
                {
                    txtAttaquesEnnemi.Text += "Premier a attaquer\n\n";
                    txtDmgEnnemi.Text += "->\n\n";
                    txtDmgPerso.Text += "\n\n\n";
                    txtAttaquesPerso.Text += "\n\n\n";
                }
            }
        }


        /// <summary>
        /// Met l'emphase sur le personnage lorsque c'est son tour - Anthony Gauthier 27 Nov. 2014
        /// </summary>
        private void EmphasePersonnage()
        {
            imgEnnemi.Opacity = 0.5;
            brdEnergieEnnemi.Opacity = 0.5;
            brdVieEnnemi.Opacity = 0.5;
            lblNiveauEnnemi.Opacity = 0.5;
            lblNomEnnemi.Opacity = 0.5;
            brdPersoActif.Visibility = Visibility.Visible;
        }
    }
}
