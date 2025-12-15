using System;
using System.Collections.Generic;
using System.Linq;
using Tebacom_Demo;

public static class RepositorioDatosDemo
{
    private static readonly List<Genero> _generos;
    private static readonly List<LenguaIndigena> _lenguas;
    private static readonly List<Grupo> _grupos;
    private static readonly List<Alumno> _alumnos;
    private static readonly List<Calificacion> _calificaciones;

    static RepositorioDatosDemo()
    {        
        _generos = new List<Genero>
        {
            new Genero { GeneroId = 1, Nombre = "Femenino" },
            new Genero { GeneroId = 2, Nombre = "Masculino" },
            new Genero { GeneroId = 3, Nombre = "No binario" }
        };

        _lenguas = new List<LenguaIndigena>
        {
            new LenguaIndigena { LenguaIndigenaId = 1, Nombre = "Náhuatl" },
            new LenguaIndigena { LenguaIndigenaId = 2, Nombre = "Totonaco" },
            new LenguaIndigena { LenguaIndigenaId = 3, Nombre = "Otra" }
        };

        _grupos = new List<Grupo>
        {
            new Grupo { GrupoId = 1, Grado = 1, GrupoNombre = "A" },
            new Grupo { GrupoId = 2, Grado = 2, GrupoNombre = "A" },
            new Grupo { GrupoId = 3, Grado = 3, GrupoNombre = "B" }
        };

        _alumnos = new List<Alumno>
        {
            new Alumno { AlumnoId = 1, NombreCompleto = "Ana López", GeneroId = 1, LenguaIndigenaId = 1, GrupoId = 1 },
            new Alumno { AlumnoId = 2, NombreCompleto = "Luis Pérez", GeneroId = 2, LenguaIndigenaId = 2, GrupoId = 1 },
            new Alumno { AlumnoId = 3, NombreCompleto = "María Cruz", GeneroId = 1, LenguaIndigenaId = null, GrupoId = 2 },
            new Alumno { AlumnoId = 4, NombreCompleto = "José Díaz", GeneroId = 2, LenguaIndigenaId = null, GrupoId = 2 },
            new Alumno { AlumnoId = 5, NombreCompleto = "Alex Romero", GeneroId = 3, LenguaIndigenaId = 3, GrupoId = 3 },
        };

        _calificaciones = new List<Calificacion>
        {
            new Calificacion { CalificacionId = 1, AlumnoId = 1, Parcial = 1, Grado = 1, Valor = 8.5m },
            new Calificacion { CalificacionId = 2, AlumnoId = 1, Parcial = 2, Grado = 1, Valor = 9.0m },
            new Calificacion { CalificacionId = 3, AlumnoId = 2, Parcial = 1, Grado = 1, Valor = 7.0m },

            new Calificacion { CalificacionId = 4, AlumnoId = 3, Parcial = 1, Grado = 2, Valor = 8.0m },
            new Calificacion { CalificacionId = 5, AlumnoId = 3, Parcial = 2, Grado = 2, Valor = 8.5m },
            new Calificacion { CalificacionId = 6, AlumnoId = 4, Parcial = 1, Grado = 2, Valor = 6.5m },

            new Calificacion { CalificacionId = 7, AlumnoId = 5, Parcial = 1, Grado = 3, Valor = 9.5m },
        };
    }

    #region Genero
    public static IEnumerable<object> ObtenerDistribucionGenero()
    {
        var query = from a in _alumnos
                    join g in _generos on a.GeneroId equals g.GeneroId
                    group a by g.Nombre
                    into grp
                    select new
                    {
                        Genero = grp.Key,
                        Total = grp.Count()
                    };
        return query;
    }
    #endregion
    
    #region Lengua Indigena
    public static IEnumerable<object> ObtenerDistribucionLengua()
    {
        var query = from a in _alumnos
                    join l in _lenguas
                        on a.LenguaIndigenaId equals l.LenguaIndigenaId into lj
                    from l in lj.DefaultIfEmpty()
                    group a by (l != null ? l.Nombre : "Sin lengua indígena")
                    into grp
                    select new
                    {
                        Lengua = grp.Key,
                        Total = grp.Count()
                    };
        return query;
    }
    #endregion
    
    #region Avance Captura Parciales
    public static IEnumerable<object> ObtenerAvanceCaptura()
    {
        var alumnosPorGrado = from a in _alumnos
                              join g in _grupos on a.GrupoId equals g.GrupoId
                              group a by g.Grado
                              into grp
                              select new
                              {
                                  Grado = grp.Key,
                                  TotalAlumnos = grp.Count(),
                                  Alumnos = grp.Select(x => x.AlumnoId).ToList()
                              };
        var resultado = new List<object>();
        foreach (var grado in alumnosPorGrado)
        {
            for (int parcial = 1; parcial <= 3; parcial++)
            {
                int alumnosConCalif = _calificaciones
                    .Where(c => c.Parcial == parcial &&
                                c.Grado == grado.Grado &&
                                grado.Alumnos.Contains(c.AlumnoId))
                    .Select(c => c.AlumnoId)
                    .Distinct()
                    .Count();

                decimal porcentaje = grado.TotalAlumnos == 0
                    ? 0
                    : (alumnosConCalif * 100m) / grado.TotalAlumnos;

                resultado.Add(new
                {
                    Grado = grado.Grado,
                    Parcial = parcial,
                    Porcentaje = Math.Round(porcentaje, 2)
                });
            }
        }
        return resultado;
    }
    #endregion
}
