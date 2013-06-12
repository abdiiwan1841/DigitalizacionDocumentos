<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Digitalizacion.aspx.cs" Inherits="DigitalizacionDocumentos.Digitalizacion" %>
<%@ Register src="ucDatosCliente.ascx" tagname="ucDatosCliente" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <title>Digitalización de Docuentos::Cofiño Stahl::</title>
 <link rel="Stylesheet" type="text/css" href="css/uploadify.css" />
 <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> 
 <script type="text/javascript" src="js/jquery.uploadify.js"></script> 
 <link rel="stylesheet" type="text/css" href="css/styles.css" />

    <script src="js/jquery.MultiFile.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
            javascript: window.history.forward(-1);
        </script>
 
 
 </head>
<body>
<div class="section" id="page"> <!-- Defining the #page section with the section tag -->
    <form id="form1" runat="server">
    <div>

        <div class="header"> <!-- Defining the header section of the page with the appropriate tag -->

                <div class="titulo">
                <h1>CARGA DE IMAGENES</h1>
                    <h3>Digitalizaci&oacute;n de Documentos de Clientes de Veh&iacute;culos</h3>               
                </div>
                <div class="logo"> 
                    <img src="img/logo.png" alt="logo"/>
                </div>
                <div class="line"></div>  <!-- Dividing line -->
                <div class="titulo"><u><a href="Login.aspx" id="A1" style="font-size:14pt;color:#fcfcfc;"><asp:Label ID="lblUsuario" runat="server" ToolTip="Click para cerrar sesión."></asp:Label></a></u></div>                
                
                 <br />
            <br />
                <div class="nav clear"> <!-- The nav link semantically marks your main site navigation -->
                    <ul>
                        <li><a href="#article1">Digitalizaci&oacute;n</a></li>                        
                    </ul>
                </div>
            
            </div>
            <br />
            <br />
       
       <!-- Carga de documentos -->
       
   
<br />
        <uc1:ucDatosCliente ID="ucDatosCliente1" runat="server" />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
<br />

       
       <!-- Carga de documentos -->
       
        
      
       
        
    </div>
     
     <div class="footer"> <!-- Marking the footer section -->
     
            <div class="line"></div>           
            <p>Todos los derechos reservados</p> <!-- Change the copyright notice -->
            <a href="#" class="up">Volver Arriba</a>
            <a href="#" id="opener2" class="by">Cofal Divisi&oacute;n Inform&aacute;tica</a>                     
  
    
      </div>  
    
    </form>
    </div>
</body>
</html>
