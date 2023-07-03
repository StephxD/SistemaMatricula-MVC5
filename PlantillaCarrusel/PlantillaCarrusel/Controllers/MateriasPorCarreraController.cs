using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PlantillaCarrusel.Controllers
{
    public class MateriasPorCarreraController : Controller
    {
        // GET: MateriasPorCarrera
        public ActionResult MateriasPorCarrera()
        {
            return View();
        }

        public JsonResult RetornaMateriasPorCarrera()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListMateriasPorCarrera = bs.RetornaMateriasPorCarrera();

            return Json(ListMateriasPorCarrera, JsonRequestBehavior.AllowGet);
        }

        public void InsertaMateriasPorCarrera(int pid_Carrera, int pid_Materia)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.InsertaMateriasPorCarrera(pid_Carrera, pid_Materia);
        }

        

        public void ActualizaMateriasPorCarrera(int pid_CarreraOLD, int pid_MateriaOLD, int pid_CarreraNEW, int pid_MateriaNEW)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.ActualizaMateriasPorCarrera(pid_CarreraOLD, pid_MateriaOLD, pid_CarreraNEW, pid_MateriaNEW);
        }

        public void EliminaMateriasPorCarrerasPorID(int pid_Carrera, int pid_Materia)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.EliminaMateriasPorCarrerasPorID(pid_Carrera, pid_Materia);
        }

    }
}