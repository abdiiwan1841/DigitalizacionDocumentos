<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;
using PGENL0001;

public class Upload : IHttpHandler, System.Web.SessionState.IRequiresSessionState {

    
    
    public void ProcessRequest (HttpContext context) {
        AccesoDatos ad = new AccesoDatos();
        ManipulacionDatos md = new ManipulacionDatos();
        string usu = context.Request["usuarioOpera"].ToString();
        string sub = context.Request["usuarioSub"].ToString();
        string cia = context.Request["cia"].ToString();
        string clindc = "000207"; //context.Request["clindc"].ToString();
        HttpFileCollection hfc = context.Request.Files;        
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        HttpContext.Current.ApplicationInstance.CompleteRequest();
        try
        {
            HttpPostedFile postedFile = context.Request.Files["Filedata"];            
            string savepath = "";
            string tempPath = "";
            tempPath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"];
            savepath = context.Server.MapPath(tempPath);
            string filename = postedFile.FileName;
            if (!Directory.Exists(savepath))
                Directory.CreateDirectory(savepath);
            postedFile.SaveAs(savepath + @"\" + filename);
            byte[] tmpImg = md.ReadFileByteArray(savepath + @"\" + filename);
            string tmpFormato = System.IO.Path.GetExtension(filename).ToLower();
            tmpFormato = tmpFormato.Replace('.', ' ');
            string fecha = DateTime.Now.ToString("yyyy-MM-dd H:mm:ss");
            string qryCorrelativo = String.Format("select coalesce(max(seqdocto)+1,1) as correlativo from cdigen.twgen0003 where clondc='{0}' and vcocia='{1}' and subare='{2}'", clindc, cia, sub);
            string correlativo = ad.RealizaConsulta(qryCorrelativo).Rows[0]["correlativo"].ToString();
            string formato = ad.RealizaConsulta(String.Format("select IDFORMAT from cdigen.twgen0001 where formato='{0}'", tmpFormato.Trim())).Rows[0]["IDFORMAT"].ToString();
            string qry = "insert into cdigen.twgen0003 (SEQDOCTO,VCOCIA,SUBARE,CLONDC,IDFORMATO,VUSUAR,VFECHA,NOMBREDOC,DIMAGEN) VALUES({0},'{1}','{2}','{3}',{4},'{5}','{6}','{7}',?)";
            string consulta = String.Format(qry, correlativo, cia, sub, clindc, formato, usu, fecha.ToString(), filename);
            int i = ad.RealizaDml(consulta, "archivo", tmpImg);
            context.Response.Write(tempPath + "/" + filename);
            context.Response.StatusCode = 200;
        }
        catch (Exception ex)
        {
            context.Response.Write("Error: " + ex.Message);
        }
    }
   
    public bool IsReusable {
        get {
            return false;
        }
    }
}