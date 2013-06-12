<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SinPermiso.aspx.cs" Inherits="DigitalizacionDocumentos.SinPermiso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title>Digitalización de Docuentos::Cofiño Stahl::</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="Stylesheet" type="text/css" href="css/uploadify.css" />
 <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
 <script type="text/javascript" src="js/jquery.uploadify.js"></script>  
</head>
<body>
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
                <div class="titulo"><u><a href="#" id="A1" style="font-size:14pt;color:#fcfcfc;"><asp:Label ID="lblUsuario" data-intro="Click para cerrar sesión." runat="server"></asp:Label></a></u></div>
                <div class="nav clear"> <!-- The nav link semantically marks your main site navigation -->
                    <ul>
                        <li><a href="#article1">Digitalizaci&oacute;n</a></li>                        
                    </ul>
                </div>
            
            </div>
            <br />
            <br />
       
        
    </div>
    
    
     <div class="section" id="articles"> <!-- A new section with the articles -->

				<!-- Article 1 start -->
                
                <div class="article" id="article1"> <!-- The new article tag. The id is supplied so it can be scrolled into view. -->
                    <h2>No tiene permisos de acceso.</h2>
                    
                    <div class="line"></div>
                    
                    <div class="control" style="width:309px; height:330px; margin:auto; text-align:center">
                        <img src="img/denied.png" alt="Permiso denegado" /> 
                        <div style="margin-left: auto;	margin-right: auto;	margin-top:10px;	left:0;	right:0;">                        
                       
                        </div>
                    </div>

                </div>
				<!-- Article 1 end -->
            </div>
    
     <div class="footer"> <!-- Marking the footer section -->
     
            <div class="line"></div>           
            <p>Todos los derechos reservados</p> <!-- Change the copyright notice -->
            <a href="#" class="up">Volver Arriba</a>
            <a href="#" id="opener2" class="by">Cofal Divisi&oacute;n Inform&aacute;tica</a>                     
  
    
      </div>  
    
    </form>
</body>
</html>
