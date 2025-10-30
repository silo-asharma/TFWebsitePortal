using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services;
using System.Web.Script.Services;
using System.Json;
using System.Web.Script.Serialization;

namespace Extuent
{
    public partial class testvideo : System.Web.UI.Page
    {
        public static string path = string.Empty;
        public string question = "";
        public int JobId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            path = Server.MapPath("/videouplaodedfolder");
            Session["ReTake"] = 5;
            Session["Timer"] = "2:00";
            question = Convert.ToString(Session["question"]);// "Question 2:- How did you hear about this position?;Question 3:- Why did you decide to apply for this position?;Question 4:- What are your strengths and weaknesses?";
            var quest = question.Split(';');
          //  lblmsg.InnerText = "Question 1:- " + quest[0];
            JobId = Convert.ToInt32(Session["JobID"]);
            if (Request.QueryString["CandidateId"] != null)
            {
                Session["CandidateId"] = Request.QueryString["CandidateId"];
            }
            if (Request.QueryString["id"] != null)
            {
                string ok1 = Request.QueryString["id"].ToString();
                if (ok1 == "How did you hear about this position")
                {
                   // lnknext.HRef = "http://localhost:60242/Create_Video_Interview?id=Why did you decide to apply for this position";
                   // lblmsg.InnerText = "Question 2:- How did you hear about this position?";
                }
                else if (ok1 == "Why did you decide to apply for this position")
                {
                  //  lnknext.HRef = "http://localhost:60242/Create_Video_Interview?id=What are your strengths and weaknesses";
                   // lblmsg.InnerText = "Question 3:- Why did you decide to apply for this position?";
                }
                else if (ok1 == "What are your strengths and weaknesses")
                {
                    //lnknext.HRef = "http://localhost:60242/Create_Video_Interview?id=What do you know about Company";
                    //lblmsg.InnerText = "Question 4:- What are your strengths and weaknesses?";
                }
                else if (ok1 == "What do you know about Company")
                {
                    //lnknext.InnerText = "Finish and Final Save";
                   // lnknext.HRef = "http://localhost:60242/Thank_You";
                   // lblmsg.InnerText = "Question 5:- What do you know about Company?";
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //if (usernameInput.Value.ToString() == "Admin" && passwordInput.Value.ToString() == "adminadmin")
            //{
            //    Response.Redirect("admin/dashboard", false);
            //}

        }
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
        public static string GenerateHtmlFromXml()
        {
            if (HttpContext.Current.Request.Files != null)
            {
                var file = HttpContext.Current.Request.Files[0];
            }

            return string.Empty;
        }
        [WebMethod]
        public static string Save()
        {

            // var filesToDelete = videoblob;
            //  JavaScriptSerializer j = new JavaScriptSerializer();
            //  object a = j.Deserialize(filesToDelete, typeof(object));
            var clientContactId = HttpContext.Current.Request.Files["videoblob"];

            //blobData = blobData.Replace("data:video/mp4;base64,", "");

            //byte[] resource = Convert.FromBase64String(clientContactId);
            //  FileInfo file = new FileInfo(path + "\\TestVideo.mp4");
            // using (Stream sw = file.OpenWrite())
            // {
            //    sw.Write(resource, 0, resource.Length);
            //   sw.Close();
            //}
            return "success";
        }

        protected void btntest_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onSavevideo", "onSavevideo()", true);
        }
    }
}