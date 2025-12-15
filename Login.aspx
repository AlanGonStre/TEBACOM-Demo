<%@ Page Title="Tebacom-Demo" Language="C#" MasterPageFile="~/MasterPageTebacom.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Tebacom_Demo.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="<%= ResolveClientUrl("~/Content/bootstrap.min.css") %>" rel="Stylesheet" type="text/css"/>
    <script src="<%= ResolveClientUrl("~/Content/bootstrap.bundle.min.js") %>"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link href="../Content/font-awesome-3.3.6/css/font-awesome-min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  
    <br />
    <div class="container">     
        <div class="card ">
            <div class="container-fluid">                     
                <div class="row justify-content-md-center">                                                        
                    <div class ="col-5">
                        <div class="card-body text-center" style="background:#EEEEEE">
                            <h1 class="card-title text-center" style: style="color:#666666">Iniciar Sesión</h1>                      
                            <div class= "col-auto">
                                <asp:Label ID="LBLUSUARIO" runat="server" for="usuario" Text="Usuario:" Font-Size="Medium" Font-Bold="true" style="Color:#6A6A71; text-align:center" ></asp:Label>
                                <div>
                                    <span class="fas fa-user-lock" style='font-size: 20px; color:#007336'></span>&nbsp;
                                    <i class="bi bi-person"></i>
                                    <asp:TextBox ID="txtUusario" runat="server" CssClass="btn" BorderColor="DarkGray"></asp:TextBox>
                                </div>
                            </div>
                            <p></p>
                            <div class="col-auto">        
                                <asp:Label ID="lblcontra"  runat="server" for="contrasena" Text="Password:" Font-Size="Medium" Font-Bold="true" style="Color:#6A6A71"></asp:Label>
                                <div>
                                    <span class="fab fa-expeditedssl" style='font-size: 25px; color:#007336'></span>&nbsp;
                                    <asp:TextBox ID="txtcontra" runat="server" TextMode="Password" CssClass="btn" ForeColor="black" BorderColor="DarkGray"></asp:TextBox>
                                </div>
                            </div>
                            <p></p>
                            <asp:Button ID="Btningresr" runat="server" CssClass="btn" Text="Ingresar" style="Color:white" BackColor="#007336"  OnClick="Btningresr_Click"/>
                            <br />
                        </div>
                    </div>
                    <p></p>
                </div>
                <div class="row justify-content-md-center">                                                        
                    <div class ="col-2">
                        <button type="button"  class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#modalWindow">
                            Aviso de Privacidad
                        </button>
                        <p></p> 
                        <div class="modal fade" id="modalWindow" tabindex="-1" aria-labelledby="modalWindowLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalWindowLabel" style="color: #93B84A">Aviso de Privacidad Simplificado de los procesos de Control Escolar en los Sistemas Electrónicos.</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        La Secretaría de Educación del Gobierno del Estado de Veracruz de Ignacio de la Llave, es el responsable del tratamiento de los datos personales que nos proporcione.
                                        <p></p>
                                        Los datos personales son utilizados para las siguientes finalidades: a) integrar el registro de solicitantes del servicio prestado, b) informar sobre los resultados de la solicitud, c) notificar y contactar a los usuarios, d) otorgar las Certificaciones de Estudios elaboradas, y e) realizar un informe estadístico de los servicios atendidos por la dependencia y no se efectuará tratamiento adicional, con excepción de que la autoridad competente lo requiera a través de una solicitud debidamente fundamentada y motivada.
                                        <p></p>
                                        Usted podrá consultar el aviso de privacidad integral en:
                                        <a href="http://www.sev.gob.mx" target="_blank" rel="noopener noreferrer">http://www.sev.gob.mx.</a>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container3">
            <div class="centered-element2">
                <footer class="footer mt-auto py-3">
                    <div class="container alinear-centro" >
                        <div class="text-center">
                            <span class="text-muted">
                                <b>• SECRETARÍA DE EDUCACIÓN DE VERACRUZ © <%: DateTime.Now.Year %>- TODOS LOS DERECHOS RESERVADOS • <br />  • TELEBACHILLERATO COMUNITARIO •</b>
                            </span>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>
</asp:Content>
