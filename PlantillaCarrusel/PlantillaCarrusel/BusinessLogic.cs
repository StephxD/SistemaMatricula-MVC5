using PlantillaCarrusel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PlantillaCarrusel
{
    public class BusinessLogic
    {
        SistemaMatriculaEntities db = new SistemaMatriculaEntities();

        public UserData LoginValidator(string username, string password)
        {
            var Lst = db.sp_RetornaInicioSesion(username, password).FirstOrDefault();
            if (Lst != null)
            {

                UserData userData = new UserData();
                userData.Usuario = Lst.Usuario;
                userData.Activo = Lst.Activo;
                userData.esAlumno = Lst.EsAlumno;



                return userData;
            }
            else
            {
                return null;
            }
        }

        public object RetornaGrados()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaGrados().ToList();
        }
        public object RetornaGradosPorId(int id_Grado)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaGradosPorID(id_Grado).ToList();
        }


        public void ActualizaGrados(int pid_Grado, string pGradoNombre, string pGradoDescripcion)
        {
            db.sp_ActualizaGrados(
                    pid_Grado,
                    pGradoNombre,
                    pGradoDescripcion
                    );

                
        }


        public void EliminaGrados(int pid_Grado)
        {
          db.sp_EliminaGrados(
                    pid_Grado
                    );

                
        }



        public void InsertaGrado(string pNombre, string pDescripcion)
        {
           db.sp_InsertaGrados(pNombre,pDescripcion
                    );

                
        }
        /// Aqui inicia la logica de Carreras

        public object RetornaCarreras()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaCarrera().ToList();
        }

        public void InsertaCarreras(int pGrado, string pNombre, string pDescripcion)
        {
                this.db.sp_InsertaCarrera(pGrado, pNombre, pDescripcion);
        }

        public object RetornaCarrerasPorId(int id_Carrera, int id_Grado)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaCarreraPorID(id_Carrera, id_Grado).ToList();
        }


        public void ActualizaCarreras(int pid_Carrera, int pid_Grado, string pCarreraNombre, string pCarreraDescripcion)
        {
                this.db.sp_ActualizaCarrera(
                    pid_Carrera,
                    pid_Grado,
                    pCarreraNombre,
                    pCarreraDescripcion
                    );
        }

        public void EliminaCarrerasPorID(int pid_Carrera, int pid_Grado)
        {
            this.db.sp_EliminaCarrera(
                pid_Carrera,
                pid_Grado
                );
        }  /// Aqui FINALIZA la logica de Carreras


        /// Aqui inicia la logica de Materias//////

        public object RetornaMaterias()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaMateria().ToList();
        }
        // con id para poder hacer el edit
        public object RetornaMateriasPorID(int id_Materia)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaMateriaPorID(id_Materia).ToList();
        }


        public void ActualizaMaterias(int pid_Materia, string pMateriaNombre, string pMateriaCodigo, int pCant_Creditos, int pCant_Horas)
        {
           db.sp_ActualizaMateria(
                    pid_Materia,
                    pMateriaNombre,
                    pMateriaCodigo,
                    pCant_Creditos,
                    pCant_Horas
                    );

        }

        public void InsertaMaterias(string pMateriaNombre, string pMateriaCodigo, int pCant_Creditos, int pCant_Horas)
        {
           db.sp_InsertaMateria(pMateriaNombre, pMateriaCodigo, pCant_Creditos, pCant_Horas
                    );

               
        }

        public void EliminaMaterias(int pid_Materia)
        {
           db.sp_EliminaMateria(
                    pid_Materia
                    );

                
        }

        /// Aqui FINALIZA la logica de MATERIAS

        /// Aqui INICIA la logica de MATERIAS_POR_CARRERA

        public object RetornaMateriasPorCarrera()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaMateriasCarrera().ToList();
        }

        public void InsertaMateriasPorCarrera(int pid_Carrera, int pid_Materia)
        {
            this.db.sp_InsertaMateriaCarrera(pid_Carrera, pid_Materia);
        }

      

        public void ActualizaMateriasPorCarrera(int pid_CarreraOLD, int pid_MateriaOLD, int pid_CarreraNEW, int pid_MateriaNEW)
        {
            this.db.sp_ActualizaMateriaCarrera(
                pid_CarreraOLD,
                pid_MateriaOLD,
                pid_CarreraNEW,
                pid_MateriaNEW
                );
        }

        public void EliminaMateriasPorCarrerasPorID(int pid_Carrera, int pid_Materia)
        {
            this.db.sp_EliminaMateriaCarrera(
                pid_Carrera,
                pid_Materia
                );
        }
        /// Aqui FINALIZA la logica de MATERIAS_POR_CARRERA


        /// Aqui INICIA la logica de PERIODOS

        public object RetornaPeriodos()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaPeriodo().ToList();
        }



        public void InsertaPeriodos(string pCodigo, DateTime pFechaInicio, DateTime pFechaFin)
        {
            this.db.sp_InsertaPeriodo(pCodigo, pFechaInicio, pFechaFin);
        }



        public object RetornaPeriodoPorId(int id_Periodos)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaPeriodoporID(id_Periodos).ToList();
        }




        public void ActualizaPeriodos(int pPeriodoId, string pCodigo, DateTime pFechaInicio, DateTime pFechaFin)
        {
            this.db.sp_ActualizaPeriodo(
            pPeriodoId,
            pCodigo,
            pFechaInicio,
            pFechaFin
            );
        }



        public void EliminaPeriodosPorID(int id_Periodos)
        {
            this.db.sp_EliminaPeriodo(
            id_Periodos
            );
        }



        /// Aqui FINALIZA la logica de PERIODOS
        /// 

        ///Alumno
        ///
        public object RetornaAlumno()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaAlumno().ToList();
        }

        public object RetornaProvincias()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.RetornaProvincias().ToList();
        }


        public object RetornaCantonPorProvincia(int pid_Provincia)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaCantonPorProvincia(pid_Provincia).ToList();
        }

        public object RetornaDistritoPorCanton(int pid_Canton)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaDistritoPorCanton(pid_Canton).ToList();
        }

        public void InsertaAlumno(DateTime pFecha_Ingreso, string pCedula, string pGenero, DateTime pFecha_Nacimiento, string pNombre, string pApellido1, string pApellido2, string pDireccion, string pTelefono1, string pTelefono2, string pCorreo, int pid_Provincia, int pid_Canton, int pid_Distrito)
        {
            this.db.sp_InsertaAlumno(
            pFecha_Ingreso, pCedula, pGenero, pFecha_Nacimiento, pNombre, pApellido1, pApellido2, pDireccion, pTelefono1, pTelefono2, pCorreo, pid_Provincia, pid_Canton, pid_Distrito
            );
        }


        public object RetornaAlumnoPorID(int pid_Alumno)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaAlumnoporID(pid_Alumno).ToList();
        }


        public void ActualizaAlumno(DateTime pFecha_Ingreso, string pCedula, string pGenero, DateTime pFecha_Nacimiento, string pNombre, string pApellido1, string pApellido2, string pDireccion, string pTelefono1, string pTelefono2, string pCorreo, int pid_Provincia, int pid_Canton, int pid_Distrito, int pid_Alumno)
        {
            this.db.sp_ActualizaAlumno(
            pid_Alumno, pFecha_Ingreso, pCedula, pGenero, pFecha_Nacimiento, pNombre, pApellido1, pApellido2, pDireccion, pTelefono1, pTelefono2, pCorreo, pid_Provincia, pid_Canton, pid_Distrito
            );
        }


        public void EliminaAlumnoPorID(int pid_Alumno)
        {
            this.db.sp_EliminaAlumno(
            pid_Alumno
            );
        }


        public object RetornaAlumnoData(string pLogin)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaAlumnoData(pLogin).ToList();
        }

        /// Aqui inicia la logica de Matricula

        public object RetornaMatricula()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaMatricula().ToList();
        }

        public void InsertaMatricula(int pid_Materia, int pid_Alumno, int pNota, int pid_Periodo)
        {
            this.db.sp_InsertaMatricula(pid_Materia, pid_Alumno, pNota, pid_Periodo);
        }

        public object RetornaMatriculaporAlumno(int pid_Alumno)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_RetornaMatriculaporAlumno(pid_Alumno).ToList();
        }


        public void ActualizaMatricula(int pid_Matricula, int pid_Materia, int pid_Alumno, int pNota, int pid_Periodo)
        {
            this.db.sp_ActualizaMatricula(
                pid_Matricula,
                pid_Materia,
                pid_Alumno,
                pNota,
                pid_Periodo
                );
        }

        public void EliminaMatricula(int pid_Matricula)
        {
            this.db.sp_EliminaMatricula(
                pid_Matricula
                );
        }  /// Aqui FINALIZA la logica de Matricula




        public object ReporteMatriculaGen()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_ReporteMatriculaGen().ToList();
        }



        public object ReporteMatriculaPorEstudiante(string pLogin)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.sp_ReporteMatriculaPorEstudiante(pLogin).ToList();
        }

        

    }
}
