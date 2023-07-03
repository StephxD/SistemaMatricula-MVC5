using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PlantillaCarrusel.Controllers
{
    public class ReportesController : Controller
    {
        // GET: Reportes
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ReporteMaterias()
        {
            return View();
        }


        public JsonResult ReporteMatriculaGen()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListRep = bs.ReporteMatriculaGen();

            return Json(ListRep, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReporteMatriculaPorEstudiante(string pLogin)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListRep = bs.ReporteMatriculaPorEstudiante(pLogin);

            return Json(ListRep, JsonRequestBehavior.AllowGet);
        }
    }
}