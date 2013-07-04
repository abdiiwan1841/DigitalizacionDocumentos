using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.IO;

namespace DigitalizacionDocumentos
{
    public partial class Default : System.Web.UI.Page
    {
        string error;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                error = "";
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string FileName = "";
            try
            {  // Get the HttpFileCollection
                HttpFileCollection hfc = Request.Files;
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    FileName = System.IO.Path.GetFileName(hpf.FileName);
                    if (hpf.ContentLength > 0)
                    {
                        if (hpf.ContentLength < 307200)
                        {
                            string Ext = System.IO.Path.GetExtension(hpf.FileName);
                            if ((Ext == ".txt") || (Ext == ".doc") || (Ext == ".docx") || (Ext == ".xls") || (Ext == ".xlsx") || (Ext == ".jpg") || (Ext == ".jpeg") || (Ext == ".PNG") || (Ext == ".rar") || (Ext == ".bmp"))
                            {
                                hpf.SaveAs(Server.MapPath("~/uploads/") + "doc[" + (i + 1).ToString() + "]@" + System.DateTime.Now.Date.Date.ToString("dd-MM-yy") + Ext);
                                error = "'" + FileName.ToString() + "'" + " Uploaded Successfully..." + "<br>";
                            }
                            else
                            {
                                error = "'" + FileName.ToString() + "'" + " Failed :" + "'" + Ext.ToString() + "'" + " Extension not supported... " + "<br>";
                            }
                        }


                        else
                        {
                            error = "'" + FileName.ToString() + "'" + " Failed : " + " file length should not exceed 3MB... " + "<br>";
                        }
                    }
                    else
                    {
                        error = "'" + FileName.ToString() + "'" + " Failed : " + " File is Empty... " + "<br>";
                    }
                    lblError.Text = error + lblError.Text;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
