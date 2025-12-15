using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tebacom_Demo
{
    public class Calificacion
    {
        public int CalificacionId { get; set; }
        public int AlumnoId { get; set; }
        public int Parcial { get; set; }   
        public int Grado { get; set; }     
        public decimal Valor { get; set; } 
    }
}