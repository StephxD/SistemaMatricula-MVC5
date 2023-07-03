using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PlantillaCarrusel.Controllers
{
    public class CarrerasController : Controller
    {
        // GET: Carreras
        public ActionResult Carreras()
        {
            return View();
        }

        public JsonResult RetornaCarreras()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListCarreras = bs.RetornaCarreras();

            return Json(ListCarreras, JsonRequestBehavior.AllowGet);
        }

        public void InsertaCarreras(int pGrado, string pNombre, string pDescripcion)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.InsertaCarreras(pGrado, pNombre, pDescripcion);
        }


        public JsonResult RetornaCarrerasPorId(int id_Carrera, int id_Grado)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListaGrados = bs.RetornaCarrerasPorId(id_Carrera, id_Grado);

            return Json(ListaGrados, JsonRequestBehavior.AllowGet);
        }

        public void ActualizaCarreras(int pid_Carrera, int pid_Grado, string pCarreraNombre, string pCarreraDescripcion)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.ActualizaCarreras(pid_Carrera, pid_Grado, pCarreraNombre, pCarreraDescripcion);
        }

        public void EliminaCarrerasPorID(int pid_Carrera, int pid_Grado)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.EliminaCarrerasPorID(pid_Carrera,pid_Grado);
        }
    }
}