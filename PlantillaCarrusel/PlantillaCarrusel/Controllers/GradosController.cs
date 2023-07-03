using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PlantillaCarrusel.Controllers
{
    public class GradosController : Controller
    {
        // GET: Grados
        public ActionResult Grados()
        {
            return View("~/Views/Grados/Grados.cshtml");
        }

        public JsonResult RetornaGrados()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListaGrados = bs.RetornaGrados();

            return Json(ListaGrados, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RetornaGradosPorId(int id_Grado)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListaGrados = bs.RetornaGradosPorId(id_Grado);

            return Json(ListaGrados, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public void ActualizaGrados(int pid_Grado, string pGradoNombre, string pGradoDescripcion)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.ActualizaGrados(pid_Grado, pGradoNombre, pGradoDescripcion);
        }

        public void EliminaGradosPorID(int pid_Grado)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.EliminaGrados(pid_Grado);
        }

        public void InsertaGrado(string pNombre, string pDescripcion)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.InsertaGrado(pNombre,pDescripcion);
        }
    }
}