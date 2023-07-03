using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PlantillaCarrusel.Controllers
{
    public class MateriasController : Controller
    {
        // GET: Materias4
        public ActionResult Materias()
        {
            return View();
        }

        public JsonResult RetornaMaterias()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListaGrados = bs.RetornaMaterias();

            return Json(ListaGrados, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RetornaMateriasPorID(int pid_Materia)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListaMaterias = bs.RetornaMateriasPorID(pid_Materia);

            return Json(ListaMaterias, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public void ActualizaMaterias(int pid_Materia, string pMateriaNombre, string pMateriaCodigo, int pCant_Creditos, int pCant_Horas)
        {
            BusinessLogic bs = new BusinessLogic();
             bs.ActualizaMaterias(pid_Materia, pMateriaNombre, pMateriaCodigo, pCant_Creditos, pCant_Horas);
        }

        public void InsertaMaterias(string pMateriaNombre, string pMateriaCodigo, int pCant_Creditos, int pCant_Horas)
        {
            BusinessLogic bs = new BusinessLogic();
             bs.InsertaMaterias(pMateriaNombre, pMateriaCodigo, pCant_Creditos, pCant_Horas);
        }

        public void EliminaMateriasPorID(int pid_Materia)
        {
            BusinessLogic bs = new BusinessLogic();
             bs.EliminaMaterias(pid_Materia);
        }

    }
}