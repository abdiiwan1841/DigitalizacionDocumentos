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
    public partial class ucDatosCliente : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    hfUsuario.Value=Request.QueryString["usuario"].ToString();
                    txtCodigoCliente.Text = Request.QueryString["codigo"].ToString();

                }else{
                        hfUsuario.Value = Session["User"].ToString();
                        hfSub.Value = "FIN";
                    }
            }

        }
        public void limpiar()
        {
            txtCodigoCliente.Text = "";
            gvDatosCliente.DataSource = null;
            gvDatosCliente.DataBind();
            pDatosCliente.Visible = false;
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            try
            {
                string codCliente = txtCodigoCliente.Text;

                //--------------CONSULTA NUEVA
                string qry = "";
                string qryDocumentos = "";

                if (!(codCliente.Trim().Length == 9) && !(codCliente.Trim().Length == 6))
                {
                    MsgBox1.alert("El código proporcionado no es NDC ni de un cliente existente");
                }
                else
                {
                    AccesoDatos ad = new AccesoDatos();
                    if (codCliente.Trim().Length == 9)
                        qry = String.Format("select LNUCSO AS NDC, lclnoc as CLIENTE, LCLNOC AS NOMBRE, '' AS DIRECCION, '' AS NIT, LEMAIL AS EMAIL  from cdicrm.cr0029f where LNUCSO='{0}'", codCliente);
                    else if (codCliente.Trim().Length == 6)
                        qry = String.Format("select '' AS NDC, gclcod as CLIENTE, gclnom as NOMBRE, ( gcldir||gclcod||gclciu ) as DIRECCION, gclnit as nit, GCLTX1 as EMAIL from intgen.fgen035 where gclcod='{0}'", codCliente);

                    qryDocumentos = @"select d.seqdocto as nodocumento, d.vcocia as compania, d.subare as area, t.nombretipo as tipo_documento, d.nombredoc
                            from cdigen.twgen0003 d left join cdigen.twgen0002 t on d.idtipodoc=t.idtipodoc
                            where d.clondc='{0}'  and UPPER(coalesce(d.estado,''))<>'X'";

                    DataTable dtDatosCliente = new DataTable();
                    dtDatosCliente = ad.RealizaConsulta(qry);

                    DataTable dtDocumentosCliente = new DataTable();
                    dtDocumentosCliente = ad.RealizaConsulta(String.Format(qryDocumentos,txtCodigoCliente.Text));


                    if (dtDatosCliente != null && dtDatosCliente.Rows.Count > 0)
                    {
                        //this.ViewState["CLIENTE"] = dtDatosCliente;
                        //if (dtDatosCliente.Rows.Count > 0)
                        {
                            gvDatosCliente.DataSource = dtDatosCliente;
                            gvDatosCliente.DataBind();
                            pDatosCliente.Visible = true;

                            gvDocumentosCliente.DataSource = dtDocumentosCliente;
                            gvDocumentosCliente.DataBind();
                            pDocumentosCliente.Visible = true;
                        }
                        //else
                        //{
                        //    this.obtenerDatos(0);
                        //}
                    }
                    else
                    {
                        gvDatosCliente.DataSource = dtDatosCliente;
                        gvDatosCliente.DataBind();
                        pDatosCliente.Visible = true;
                    }
                }
            }
            catch (Exception arg_146_0)
            {
                Exception exception = arg_146_0;
                MsgBox1.alert("Error al cargar los datos " + exception.Message);
            }            
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the HttpFileCollection
                HttpFileCollection hfc = Request.Files;
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    if (hpf.ContentLength > 0)
                    {
                        hpf.SaveAs(Server.MapPath("uploads") + "\\" +
                          System.IO.Path.GetFileName(hpf.FileName));
                        Response.Write("<b>File: </b>" + hpf.FileName + " <b>Size:</b> " +
                            hpf.ContentLength + " <b>Type:</b> " + hpf.ContentType + " Uploaded Successfully <br/>");
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

       

        //protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        //{
        //    //AjaxFileUpload1.SaveAs(Server.MapPath("ArchivosSubidos/" + e.FileName));
        //    try
        //    {
        //        string path = String.Format("{0}{1}", MapPath("~/uploads/"), System.IO.Path.GetFileName(e.FileName));
        //        AjaxFileUpload1.SaveAs(path);
        //    }
        //    catch (Exception ex)
        //    {
        //        // grab exception here.
        //    }

        //    string nombre = e.FileName;
        //    int tamaño = e.FileSize;
        //    string Id = e.FileId;

        //    string tipo = e.ContentType;

        //}
    }
}