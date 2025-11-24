using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tebacom_Demo
{
    public class Alumno
    {
        public int AlumnoId { get; set; }
        public string NombreCompleto { get; set; }
        public int GeneroId { get; set; }
        public int? LenguaIndigenaId { get; set; }  
        public int GrupoId { get; set; }
    }
}