using System;
using System.Web.Script.Serialization;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    protected string DatosGeneroJson { get; set; }
    protected string DatosLenguaJson { get; set; }
    protected string DatosAvanceJson { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarDatosJson();
        }
    }
    
    #region Datos Graficas
    private void CargarDatosJson()
    {
        var serializer = new JavaScriptSerializer();

        var genero = RepositorioDatosDemo.ObtenerDistribucionGenero().ToList();
        var lengua = RepositorioDatosDemo.ObtenerDistribucionLengua().ToList();
        var avance = RepositorioDatosDemo.ObtenerAvanceCaptura().ToList();

        DatosGeneroJson = serializer.Serialize(genero);
        DatosLenguaJson = serializer.Serialize(lengua);
        DatosAvanceJson = serializer.Serialize(avance);
    }
    #endregion
}
