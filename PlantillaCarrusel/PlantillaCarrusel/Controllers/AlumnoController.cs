using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PlantillaCarrusel.Models;

namespace PlantillaCarrusel.Controllers
{
    public class AlumnoController : Controller
    {
        // GET: Alumno

        public ActionResult Alumno()
        {

            return View();
        }

        public JsonResult RetornaAlumno()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListCarreras = bs.RetornaAlumno();

            return Json(ListCarreras, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RetornaProvincias()
        {
            BusinessLogic bs = new BusinessLogic();

            var ListProvincias = bs.RetornaProvincias();

            return Json(ListProvincias, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RetornaCantonPorProvincia(int pid_Provincia)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListCantones = bs.RetornaCantonPorProvincia(pid_Provincia);

            return Json(ListCantones, JsonRequestBehavior.AllowGet);
        }


        public JsonResult RetornaDistritoPorCanton(int pid_Canton)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListCantones = bs.RetornaDistritoPorCanton(pid_Canton);

            return Json(ListCantones, JsonRequestBehavior.AllowGet);
        }

        public void InsertaAlumno(DateTime pFecha_Ingreso, string pCedula, string pGenero, DateTime pFecha_Nacimiento, string pNombre, string pApellido1, string pApellido2, string pDireccion, string pTelefono1, string pTelefono2, string pCorreo, int pid_Provincia, int pid_Canton, int pid_Distrito)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.InsertaAlumno(pFecha_Ingreso, pCedula, pGenero, pFecha_Nacimiento, pNombre, pApellido1, pApellido2, pDireccion, pTelefono1, pTelefono2, pCorreo, pid_Provincia, pid_Canton, pid_Distrito);
        }

        public JsonResult RetornaAlumnoPorID(int pid_Alumno)
        {
            BusinessLogic bs = new BusinessLogic();

            var ListAlumnos = bs.RetornaAlumnoPorID(pid_Alumno);

            return Json(ListAlumnos, JsonRequestBehavior.AllowGet);
        }

        public void ActualizaAlumno(DateTime pFecha_Ingreso, string pCedula, string pGenero, DateTime pFecha_Nacimiento, string pNombre, string pApellido1, string pApellido2, string pDireccion, string pTelefono1, string pTelefono2, string pCorreo, int pid_Provincia, int pid_Canton, int pid_Distrito, int pid_Alumno)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.ActualizaAlumno(pFecha_Ingreso, pCedula, pGenero, pFecha_Nacimiento, pNombre, pApellido1, pApellido2, pDireccion, pTelefono1, pTelefono2, pCorreo, pid_Provincia, pid_Canton, pid_Distrito, pid_Alumno);
        }


        public void EliminaAlumnoPorID(int pid_Alumno)
        {
            BusinessLogic bs = new BusinessLogic();
            bs.EliminaAlumnoPorID(pid_Alumno);
        }

        public JsonResult RetornaAlumnoData(string pLogin)
        {
            BusinessLogic bs = new BusinessLogic();
            
            var ListAlumnos = bs.RetornaAlumnoData(pLogin);

            return Json(ListAlumnos, JsonRequestBehavior.AllowGet);
        }
        

    }
}
