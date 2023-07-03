using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;



namespace PlantillaCarrusel.Controllers
{
    public class periodosController : Controller
    {
        // GET: Carreras
        public ActionResult Periodos()
        {
            return View();
        }



        public JsonResult RetornaPeriodos()
        {
            BusinessLogic bs = new BusinessLogic();



            var Listperiodos = bs.RetornaPeriodos();



            return Json(Listperiodos, JsonRequestBehavior.AllowGet);
        }



        public void InsertaPeriodos(string pCodigo, DateTime pFechaInicio, DateTime pFechaFin)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.InsertaPeriodos(pCodigo, pFechaInicio, pFechaFin);
        }




        public JsonResult RetornaPeriodoPorId(int id_Periodo)
        {
            BusinessLogic bs = new BusinessLogic();



            var Listperiodos = bs.RetornaPeriodoPorId(id_Periodo);



            return Json(Listperiodos, JsonRequestBehavior.AllowGet);
        }



        public void ActualizaPeriodos(int pPeriodoId, string pCodigo, DateTime pFechaInicio, DateTime pFechaFin)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.ActualizaPeriodos(pPeriodoId, pCodigo, pFechaInicio, pFechaFin);
        }



        public void EliminaPeriodosPorID(int pid_Periodo)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.EliminaPeriodosPorID(pid_Periodo);
        }
    }
}