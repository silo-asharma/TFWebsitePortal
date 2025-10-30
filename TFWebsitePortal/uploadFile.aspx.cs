using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services;

namespace Extuent
{
    public partial class uploadFile : System.Web.UI.Page
    {
        public static string path = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //path = Server.MapPath("/videouplaodedfolder");
            string formValue;
            if (!string.IsNullOrEmpty(Request.Form["video-blob"]))
            {
                formValue = Request.Form["video-blob"];
            }


        } 
        
        public string Save()
        {
            string formValue;
            if (!string.IsNullOrEmpty(Request.Form["video-blob"]))
            {
                formValue = Request.Form["video-blob"];
            }
           // blobData = blobData.Replace("data:video/mp4;base64,", "");

            //byte[] resource = Convert.FromBase64String(blobData);
            //FileInfo file = new FileInfo(path + "\\TestVideo.mp4");
            //using (Stream sw = file.OpenWrite())
            //{
            //    sw.Write(resource, 0, resource.Length);
            //    sw.Close();
            //}
            return "success";
        }
    }
}