using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PlantillaCarrusel.Controllers
{
    public class MatriculaController : Controller

    {
        // GET: Matricula
        public ActionResult Matricula()
        {
            return View();
        }

        public JsonResult RetornaMatricula()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListMatricula = bs.RetornaMatricula();

            return Json(ListMatricula, JsonRequestBehavior.AllowGet);
        }

        public void InsertaMatricula(int pid_Materia, int pid_Alumno, int pNota, int pid_Periodo)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.InsertaMatricula(pid_Materia, pid_Alumno, pNota, pid_Periodo);
        }


        public JsonResult RetornaMatriculaporAlumno(int pid_Alumno)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListaMatricula = bs.RetornaMatriculaporAlumno(pid_Alumno);

            return Json(ListaMatricula, JsonRequestBehavior.AllowGet);
        }

        public void ActualizaMatricula(int pid_Matricula, int pid_Materia, int pid_Alumno, int pNota, int pid_Periodo)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.ActualizaMatricula(pid_Matricula, pid_Materia, pid_Alumno, pNota, pid_Periodo);
        }

        public void EliminaMatricula(int pid_Matricula)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.EliminaMatricula(pid_Matricula);
        }
    }


}

