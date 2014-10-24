using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniBD;
using Combaxe___New.classes;

namespace Combaxe___New.classes.services
{
    class ProfessionService
    {
        // on ouvre la connection
        BdService bdCombaxe = new BdService();

        //Méthode qui va chercher la description de la profession dans la BD et la retourne
        public string selectionDescription(string nom)
        {
            string description = string.Empty;
            string requete = "SELECT description FROM professions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '" + nom + "');";
            List<string>[] maDescription;
            int nombreRange = 0;

            maDescription = bdCombaxe.selection(requete, 1, ref nombreRange);

            description = maDescription[0][0];

            return description;
        }

        //Méthode qui va chercher le idProfession
        public int RetrieveIdProfession(string nom)
        {
            string requete = "SELECT idProfession FROM Professions WHERE idProfession = (SELECT idProfession FROM professions WHERE nom = '" + nom + "');";
            List<string>[] lstId;
            int nombreRange = 0;
            int id = 0;

            lstId = bdCombaxe.selection(requete, 1, ref nombreRange);

            id = Int32.Parse(lstId[0][0]);

            return id;
        }
        /// <summary>
        /// Retourne un objet profession selon l'id passé, Tommy Gingras
        /// </summary>
        /// <param name="id"> le id de la profession</param>
        /// <returns>une profession</returns>
        public Profession RetrieveIdProfessionAvecId(int id)
        {
            List<string>[] lstProf = null;
            Profession profession = null;
            string requete = "SELECT idProfession, nom, image, description FROM professions WHERE idProfession = '" + id + "';";
            int nombreRange = 0;

            lstProf = bdCombaxe.selection(requete, 4, ref nombreRange);

            if (lstProf.Count() == 1)
            {
                profession = new Profession(Convert.ToInt32(lstProf[0][0]), lstProf[0][1], lstProf[0][2], lstProf[0][3]);
            }

            return profession;
        }
    }
}
