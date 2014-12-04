using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Combaxe___New.classes;

namespace Combaxe___New.écrans
{
    /// <summary>
    /// Logique d'interaction pour EcranAide.xaml
    /// </summary>
    public partial class EcranAide : Window
    {
        public EcranAide()
        {
            InitializeComponent();
            if(VarGlobales.endroitAide == "Caracteristiques")
            {
                AideCaracteristiques();
            }
            else if(VarGlobales.endroitAide == "Combat")
            { 
                AideCombat();
            }
            else if(VarGlobales.endroitAide == "Menu principal")
            { 
                AideStrategie();
            }
        }

        private void btnCaracteristiquesAide_Click(object sender, RoutedEventArgs e)
        {
            AideCaracteristiques();
        }

        private void btnStrategieAide_Click(object sender, RoutedEventArgs e)
        {
            AideStrategie();
        }

        private void btnCombatAide_Click(object sender, RoutedEventArgs e)
        {
            AideCombat();
        }

        private void btnQuitterAide_Click(object sender, RoutedEventArgs e)
        {
            VarGlobales.QuitterAide = true;
            this.Close();
        }


        private void AideCaracteristiques()
        {
            btnCaracteristiquesAide.IsEnabled = false;
            btnCombatAide.IsEnabled = true;
            btnStrategieAide.IsEnabled = true;

            txtbAide.Text = "Les caractéristiques\n";
            txtbAide.Text += "­­­­­­­­­­­__________________________________________\n";
            txtbAide.Text += "La force:\n ----------------- \nLa force est la caractéristiques qui permet d'augmenter le dommage des attaques physique et des compétences dont l'efficacité est influencé par la force. Par exemple: les compétences de types 'phyisique' (attaque physique, coup précis, etc.) seront plus efficaces si vous avez plus de force.\n\n";
            txtbAide.Text += "L'énergie:\n ----------------- \nL'énergie est, comme la force, une caractéristique qui permet d'augmenter le dommage des attaques, mais celles de types magiques (coup divin, décharge électrique, boule de feu, etc.). Par ailleurs, l'énergie permet aussi d'augmenter vos points d'énergie (PE). Ces points d'énergie vous servent à pouvoir faire des attaques spéciales plus souvent.\n\n";
            txtbAide.Text += "La vitesse:\n ----------------- \nLa vitesse est la caractéristique qui vous permet de pouvoir vous enfuir d'un combat sans subir de dommage. C'est aussi celle-ci qui vous permet d'esquiver plus souvent, de faire des coups critiques, ou encore de commencer le combat.\n\n";
            txtbAide.Text += "La vie:\n ----------------- \nLa vie est la caractéristique qui permet d'augmenter vos points de vie (PV). Avoir plus de points de vie vous permet de survivre plus longtemps pendant les combats.\n\n";
            txtbAide.Text += "La défense:\n ----------------- \nLa défense est la caractéristique qui permet à votre personnage d'être plus résistant. Elle apporte un pourcentage de réduction des dégâts, donc plus vous en avez, plus votre personnage est résistant.\n\n";
        }

        private void AideStrategie()
        {
            btnCaracteristiquesAide.IsEnabled = true;
            btnCombatAide.IsEnabled = true;
            btnStrategieAide.IsEnabled = false;

            txtbAide.Text = "Les stratégies\n";
            txtbAide.Text += "­­­­­­­­­­­__________________________________________\n";
            txtbAide.Text += "Stratégie pour paladin:\n -----------------\n Le paladin est une profession basé sur la défense, l'énergie et la vie. Pour optimiser votre paladin, il vous est idéal de mettre vos points de caractéristiques dans ces trois caractéristiques. L'énergie vous permettra d'augmenter l'efficacité de toutes vos compétences y compris votre 'Prière de guérison'. La défense vous permettra d'être plus résistant lors de l'attaque de l'ennemi, puis finalement, la vie vous sera utile pour pouvoir rester en vie durant une longue période de temps. Lors d'un combat, utilisez votre 'Prière de guérison' seulement lorsque votre vie est basse. Sinon, utilisez le plus souvent possible votre 'Marteau des dieux' et votre 'Coup divin'.\n\n";
            txtbAide.Text += "Stratégie pour guerrier:\n -----------------\n Le guerrier est une profession basé principalement sur la défense, la force et la vie. Pour optimiser votre guerrier, il vous est idéal de mettre vos points de caractéristiques dans ces trois caractéristiques. La force vous permettra d'augmenter l'efficacité de vos compétences telles que 'Attaque physique', 'Attaque précise' et 'Vision de sang'. La défense vous permet de réduire les dégâts subis pendant le combat, puis la vie vous permet de ne pas succomber rapidement. Par contre, il est important de ne pas négliger votre énergie, car si vous n'avez pas de points dans cette caractéristique il vous sera impossible d'utiliser vos compétences spéciales. En tant que guerrier, vous vous basez sur la force brute pour vaincre votre ennemi, utiliser donc le plus souvent possible vos attaques offensives (Attaque physique, Attaque Précise et Vision de sang). Si vous êtes sur le point de mourrir, une potion de vie devrait pouvoir vous aider, sinon vous pouvez toujours utiliser votre compétence 'Peau d'acier' qui vous remettera un peu de points de vie.\n\n";
            txtbAide.Text += "Stratégie pour magicien:\n -----------------\n Le magicien est un profession basé sur la vie, l'énergie et la vitesse. L'énergie augmente l'efficacité de vos compétences tel que 'Boule de feu', 'Bouclier arcanique' et 'Décharge électrique'. La vitesse vous permet d'attaquer le premier ce qui vous est utile pour pouvoir vous remettre des dégâts subit rapidement et pouvoir en infligé rapidement. La vie elle vous permet de pouvoir survivre longtemps pendant un combat, en tant que magicien, vous n'êtes pas nécéssairement résistant. Pendant un combat, si vous êtes le premier à commencer, n'hésitez pas a utiliser 'Décharge électrique' pour infligé un gros montant de dégâts à l'ennemi rapidement, ceci le forcera à utiliser des sorts de guérison plutôt que de vous faire des dégâts. Par la suite, faite des boules de feu et si vous êtes proche de la mort, utilisez une potion de vie ou votre 'Bouclier arcanique'.\n\n";
        }

        private void AideCombat()
        {
            btnCaracteristiquesAide.IsEnabled = true;
            btnCombatAide.IsEnabled = false;
            btnStrategieAide.IsEnabled = true;

            string tourParTour = "But du jeu:\n -----------------\nLe jeu se déroule tour par tour, celui qui est plus rapide débute le combat. Ensuite tour par tour les personnages s'affrontent en choisissant selon une stratégie des actions qui mèneront à la victoire.";
            string action = "\n\nCompétences:\n -----------------\nPour effectuer une compétence, il vous suffit de choisir celle que vous voulez effectuer entre les 4 boutons juste en-dessous des potions. Pour plus d'information à propos d'une certaine compétence, simplement garder votre souris sur la compétence en question et vous verrez sa description, ses dégâts et son énergie utlisé.";
            string items = "\n\nPotions:\n -----------------\nPour utiliser une potion. Il faut que vous possédiez préalablement des potions de vie ou de d'énergie. Pour connaitre leur effet, vous pouvez glisser votre souris sur la potion désirée";
            string fuir = "\n\nFuir:\n -----------------\nVous pouvez fuir un combat, cependant si l'ennemi est plus rapide que vous il vous inflige des dégâts supplémentaires. Sinon vous pouvez fuir librement.";
            string personnage = "\n\nSection personnage:\n -----------------\nCette section est la partie de gauche de l'écran. Tout ce qui se rapporte au personnage se retrouve de ce côté. Pour les actions, cette partie ce retrouve au centre.";
            string ennemi = "\n\nSection ennemi:\n -----------------\nCette section est la partie de droite de l'écran. Tout ce qui se rapporte à l'ennemi se retrouve de ce côté.";
            string affichage = "\n\nJournal de combat:\n -----------------\nLa partie de droite signifie le résultat de l'action du joueur. La partie de gauche signifie le résultat de l'action de l'ennemi.";
            string energie = "\n\nÉnergie:\n -----------------\nL'énergie se régénère de 5% à chaque tour, autant chez le joueur que l'ennemi.";

            txtbAide.Text = "Les combats\n";
            txtbAide.Text += "­­­­­­­­­­­__________________________________________\n";
            txtbAide.Text += tourParTour + action + items + fuir + personnage + ennemi + affichage + energie;
        }
    }
}
