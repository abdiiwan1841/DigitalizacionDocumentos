<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DigitalizacionDocumentos.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Digitalización de Docuentos::Cofiño Stahl::</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    
        <script type="text/javascript" language="javascript">
            javascript: window.history.forward(-1);
        </script>
   
    </head>
<body>
    <form id="form1" runat="server">

    	<div class="section" id="page"> <!-- Defining the #page section with the section tag -->
    
            <div class="header"> <!-- Defining the header section of the page with the appropriate tag -->
                <br />
                <div class="titulo">
               <h1>CARGA DE IMAGENES</h1>
                    <h3>Digitalizaci&oacute;n de Documentos de Clientes de Veh&iacute;culos</h3>    
                </div>
                <div class="logo"> 
                    <img src="img/logo.png" alt="logo"/>
                </div>
                
                <div class="line"></div>
            
            </div>
            
            <div class="section" id="articles"> <!-- A new section with the articles -->

				<!-- Article 1 start -->
                
                <div class="article" id="article1"> <!-- The new article tag. The id is supplied so it can be scrolled into view. -->
                    <h3>Bienvenido</h3>
                    
                    <div class="line"></div>
                    
                    <div class="control" style="width:230px; height:330px; margin:auto">
                            <asp:Login ID="LoginFace" runat="server" TextLayout="TextOnTop" 
                                onauthenticate="LoginFace_Authenticate" onloggingin="LoginFace_LoggingIn" 
                                onloginerror="LoginFace_LoginError" DisplayRememberMe="False" 
                                UserNameLabelText="Usuario:">
                                <LoginButtonStyle CssClass="button medium verde" />
                                <ValidatorTextStyle Font-Bold="True" />
                                <TitleTextStyle Font-Size="Large" />
                            </asp:Login>
                            <br />
                    </div>
                </div>
				<!-- Article 1 end -->
            </div>
            
            <div class="ui-dialog">
                    <div id="dialog-confirm" title="Abandonar p&aacute;gina">
	                    <p>Esta seguro de abandonar el sitio actual?</p>
                    </div>
             </div>
             
        <div class="footer"> <!-- Marking the footer section -->

          <div class="line"></div>
           
           <p>Todos los derechos reservados</p> <!-- Change the copyright notice -->
           
           <a href="#" class="up">Volver Arriba</a>
           <a href="#" id="opener2" class="by">Cofal Divisi&oacute;n Inform&aacute;tica</a>
           

        </div>
            
		</div> <!-- Closing the #page section -->

        </form>
</body>
</html>
