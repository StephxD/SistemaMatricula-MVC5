using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlantillaCarrusel.Models
{
    public class MatriculaGenerals
    {
        // combos grados
        public int id_GradoEdit { get; set; }
        public int id_GradoIns { get; set; }
        public int id_Carrera { get; set; }

        //MateriasPorCarrera
        //CARRERAS
        public int id_CarreraEdit { get; set; }
        public int id_CarreraIns { get; set; }
        //MATERIAS
        public int id_MateriaEdit { get; set; }
        public int id_MateriaIns { get; set; }

        //PERIODOS
        public int id_PeriodoEdit { get; set; }
        public int id_PeriodoIns { get; set; }
        public int id_Periodo { get; set; }

        //ALUMNO
        public int id_ProvinciaEdit { get; set; }
        public int id_ProvinciaIns { get; set; }
        public int id_Provincia { get; set; }

        public int id_CantonEdit { get; set; }
        public int id_CantonIns { get; set; }
        public int id_Canton { get; set; }

        public int id_DistritoEdit { get; set; }
        public int id_DistritoIns { get; set; }
        public int id_Distrito { get; set; }


        public int id_Materia { get; set; }
        public int id_AlumnoEdit { get; set; }
        public int id_AlumnoIns { get; set; }
        public int id_Alumno { get; set; }


    }



}