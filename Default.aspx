<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DigitalizacionDocumentos.Default" %>

<HTML xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Multiple Files Upload</title>
<script type = "text/javascript">
    var counter = 0;
    function AddFileUpload() {
    var div = document.createElement('DIV');
    div.innerHTML = '<input id="file' + counter + '" name = "file' + counter +
     '" type="file" />' +
      '<input id="Button' + counter + '" type="button" ' +
      'value="Remove" onclick = "RemoveFileUpload(this)" />';
        document.getElementById("FileUploadContainer").appendChild(div);
        counter++;
    }
function RemoveFileUpload(div) {
        document.getElementById("FileUploadContainer").removeChild(div.parentNode);
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lblError" runat="server" Font-Bold="true" ForeColor="Red"> </asp:Label><br />
  <span style="font-family:Arial"><span style="color: #003366">&nbsp;Click to add files</span></span>
 <input id="Button1" onclick="AddFileUpload()" 
 style="height: 27px; width: 74px;" tabindex="25" type="button" value="add" /><br /> <br /><br />
  <div id="FileUploadContainer">
  <asp:FileUpload ID="FileUpload1" runat="server" />
  <!--FileUpload Controls will be added here -->
                                                                                          </div>                                                                                         <br />                                                                                         <br />                                                                                          <br />
<asp:Button ID="btnUpload" runat="server" Text="Upload" onclick="btnUpload_Click" />
<br /><br /></TD>
    </div>
    </form>
</body>
</html>