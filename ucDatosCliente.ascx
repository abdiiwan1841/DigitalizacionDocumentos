<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDatosCliente.ascx.cs" Inherits="DigitalizacionDocumentos.ucDatosCliente" %>
<%@ Register TagPrefix="cc1" Namespace="BunnyBear" Assembly="msgBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<cc1:msgBox id="MsgBox1" style="Z-INDEX: 103; LEFT: 536px; POSITION: absolute; TOP: 184px" runat="server"></cc1:msgBox>

    <div id = "panelCentral" align="center">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
<asp:Panel ID="pVistaBusqueda" runat="server" 
    
    GroupingText="Búsqueda de Documentos por Cliente" Height="90px" Width="80%" 
        class="accordionContent" DefaultButton="btnBuscar">
    <div align = "center" style="height: 65px">
        <br />
        <asp:TextBox ID="txtCodigoCliente" runat="server" Width="305px" 
            ></asp:TextBox>        
        <asp:TextBoxWatermarkExtender ID="tbweNDC" runat="server" 
            TargetControlID="txtCodigoCliente" 
            WatermarkText="Introduzca código de cliente o NDC" 
            WatermarkCssClass="watermarked">
        </asp:TextBoxWatermarkExtender>
    
        <asp:Button ID="btnBuscar" class="boton" runat="server" Text="Busca" 
            Width="108px" OnClientClick="this.disabled = true; this.value = 'Buscando...';" 
            UseSubmitBehavior="False" onclick="btnBuscar_Click" 
            CssClass="button medium verde" /> 
    </div>
</asp:Panel>
<asp:Label ID="lbError" runat="server" Font-Bold="True" 
                Font-Size="Medium" ForeColor="#FF3300"></asp:Label>
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="pDatosCliente" runat="server"  
        GroupingText="Datos Cliente" Visible="False" Width="80%" class="accordionContent">
        <asp:GridView ID="gvDatosCliente" runat="server" AutoGenerateColumns="False" 
            CaptionAlign="Top" CellPadding="4" EmptyDataText="**NO EXISTEN DATOS**" 
            Font-Size="12px" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
            Width="100%" >
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="ndc" HeaderText="NDC" 
                    NullDisplayText="N/D">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="cliente" HeaderText="CLIENTE" 
                    NullDisplayText="N/D">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="nombre" HeaderText="NOMBRE DE CLIENTE" NullDisplayText="N/D">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="direccion" HeaderText="DIRECCION" NullDisplayText="N/D">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField> 
                <asp:BoundField DataField="nit" HeaderText="NIT" NullDisplayText="N/D">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>  
                <asp:BoundField DataField="email" HeaderText="EMAIL" NullDisplayText="N/D">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField> 
                <asp:TemplateField HeaderText="--">
                    <ItemTemplate>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Edit">Seleccionar</asp:LinkButton>--%>
                       <asp:ImageButton ID="ImageButton1" runat="server" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Edit" 
                            Height="16px" ImageUrl="~/img/Find.png" Width="16px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    <br />
       
    

            <a href="javascript:$('#<%=FileUpload1.ClientID%>').fileUploadStart()">Iniciar carga</a>&nbsp; 
           |&nbsp;<a href="javascript:$('#<%=FileUpload1.ClientID%>').fileUploadClearQueue()">Limpiar lista</a> 
            <div style = "padding:40px">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>

</div>
<p>
    <br />
</p>
<script type = "text/javascript">
    $(window).load(
    function() {
        $("#<%=FileUpload1.ClientID%>").fileUpload({
            'uploader': 'js/uploader.swf',
            'cancelImg': 'img/cancel.png',
            'buttonText': 'Buscar archivos',
            'script': 'Upload.ashx',
            'folder': 'uploads',
            'fileDesc': 'Image Files',
            'fileExt': '*.jpg;*.jpeg;*.gif;*.png;*.pdf',
            'multi': true,
            'auto': false
        });
    }
);
</script>