<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;
using PGENL0001;

public class Upload : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        AccesoDatos ad = new AccesoDatos();
        ManipulacionDatos md = new ManipulacionDatos();
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
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
           
            int i = ad.MySQL_RealizaDml("INSERT INTO documento (archivo) values(?archivo)", "archivo", tmpImg);
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