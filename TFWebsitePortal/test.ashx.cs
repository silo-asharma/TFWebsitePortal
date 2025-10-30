using erpServiceModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace Extuent
{
    /// <summary>
    /// Summary description for test
    /// </summary>
    public class test : IHttpHandler
    {
        public static string path = string.Empty;
        //public void ProcessRequest(HttpContext context)
        //{
        //    //Check if Request is to Upload the File.
        //    if (context.Request.Files.Count > 0)
        //    {
        //        //Fetch the Uploaded File.
        //        HttpPostedFile postedFile = context.Request.Files[0];

        //        //Set the Folder Path.
        //        string folderPath = context.Server.MapPath("~/Uploads/");

        //        //Set the File Name.
        //        string fileName = Path.GetFileName(postedFile.FileName);

        //        //Save the File in Folder.
        //        postedFile.SaveAs(folderPath + fileName);

        //        //Send File details in a JSON Response.
        //        string json = new JavaScriptSerializer().Serialize(
        //            new
        //            {
        //                name = fileName
        //            });
        //        context.Response.StatusCode = (int)HttpStatusCode.OK;
        //        context.Response.ContentType = "text/json";
        //        context.Response.Write(json);
        //        context.Response.End();
        //    }
        //}

        public void ProcessRequest(HttpContext context)
        {
            db_a45c8e_VIPortalEntities contextDB = new db_a45c8e_VIPortalEntities();
            HttpContext.Current.Server.ScriptTimeout = 14400;
            HttpResponse r = context.Response;
            HttpFileCollection UploadedFile = context.Request.Files;
            try
            {
               
                if (context.Request.Files.Count > 0)
                {
                  
                    var clientContactId = HttpContext.Current.Request.Files["videoblob"];
                    var clientContactId1 = HttpContext.Current.Request.Params["name"];
                    var Questionvalue = HttpContext.Current.Request.Params["Question"];
                    int JobId = Convert.ToInt32( HttpContext.Current.Request.Params["JobId"]);
                    int CandidateID = Convert.ToInt32(HttpContext.Current.Request.Params["CandidateId"]);
                    int QuetionID = contextDB.add_questions.FirstOrDefault(q => q.question == Questionvalue && q.job_id== JobId).id;
                  
                  
                    string ss = clientContactId.FileName;
                    string datename = DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
                  
                    string Filena = "extuent112334" + datename + ".webm";
                    string url = HttpContext.Current.Server.MapPath( "~/admin/Upload/" + "extuent112334" + datename + ".webm");
                    video_interview vinterview = new video_interview();
                    vinterview.candidate_id = CandidateID;
                    vinterview.question_id = QuetionID;
                    vinterview.video_interviewcol = Convert.ToString(JobId);
                    vinterview.question_vedio_URL = Filena;
                    vinterview.uplodaded_date = DateTime.Now;
                    contextDB.video_interview.Add(vinterview);
                    contextDB.SaveChanges();
                    clientContactId.SaveAs(url);

                  
                    string json = new JavaScriptSerializer().Serialize(
                                    new
                                    {
                                        name = Filena
                                    });
                    r.StatusCode = (int)HttpStatusCode.OK;
                }
            }
            catch (Exception ex)
            {
                r.Write("Failed");
            }
            // r.Write("success");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}