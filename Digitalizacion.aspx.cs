using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PGENL0001;
using System.Data;

namespace DigitalizacionDocumentos
{
    public partial class Digitalizacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (!(bool)Session["Autentica"])
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                catch
                {
                    Response.Redirect("Login.aspx");
                }
                lblUsuario.Text = "Bienvenido: " + Session["User"].ToString();
            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));

            Response.Cache.SetNoStore();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AccesoDatos a = new AccesoDatos();
            DataTable _ds = new DataTable();
            _ds = a.MySQL_RealizaConsulta("SELECT archivo FROM documento where idDocumento=1");
            byte[] MyData = (byte[])_ds.Rows[0]["archivo"];
            int ArraySize = new int();
            ArraySize = MyData.GetUpperBound(0);

            System.IO.FileStream fs = new System.IO.FileStream(@"C:\essairecup.png"
                                 , System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
            fs.Write(MyData, 0, ArraySize);
            fs.Close();
        }
       
    }
}
