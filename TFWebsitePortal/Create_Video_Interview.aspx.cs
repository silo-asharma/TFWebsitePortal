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
using erpServiceModel;

namespace Extuent
{
    public partial class Create_Video_Interview : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        public static string path = string.Empty;
        public string question = "";
        public int JobId = 0;
        protected job_post JpbpostName = new job_post();
        protected List<add_questions> QuestionList = new List<add_questions>();
        protected candidate_login canlogin = new candidate_login();
        protected List<video_interview> vinterviewList = new List<video_interview>();
        protected video_interview vinterview = new video_interview();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                path = Server.MapPath("/videouplaodedfolder");
                Session["ReTake"] = 5;
                Session["Timer"] = "2:00";
                
                if (Request.QueryString["CandidateId"] != null && Request.QueryString["jobid"] != null)
                {
                    if(!IsPostBack)
                    { 
                            int cid=Convert.ToInt32(Request.QueryString["CandidateId"]);
                            canlogin = context.candidate_login.Where(c => c.rec_id == cid && c.status == "Completed").FirstOrDefault();
                            if (canlogin != null)
                            {
                            //Response To thank you page

                                 Response.Redirect("Thank_You?status=complete", false);

                            }
                            else
                            {

                                vinterviewList = context.video_interview.Where(c => c.candidate_id == cid).ToList();
                                if (vinterviewList != null)
                                {
                                    foreach (video_interview vi in vinterviewList)
                                    {
                                        vi.candidate_id = 0;
                                        vi.active = 0;

                                        context.SaveChanges();

                                    }

                                }
                            }
                    }
                    int ReqId = Convert.ToInt32(Request.QueryString["jobid"]);
                    QuestionList = context.add_questions.Where(c => c.job_id == ReqId).ToList();

                    question = "";
                    for (int k = 0; k < QuestionList.Count; k++)
                    {
                        question = question + QuestionList[k].question + ";";

                    }

                    Session["question"] = question;

                    question = Convert.ToString(Session["question"]);// "Question 2:- How did you hear about this position?;Question 3:- Why did you decide to apply for this position?;Question 4:- What are your strengths and weaknesses?";
                    question = question.Substring(0, question.Length - 1);
                    var quest = question.Split(';');
                    lblmsg.InnerText = quest[0];

                    Session["CandidateId"] = Request.QueryString["CandidateId"];
                    Session["JobID"] = Request.QueryString["jobid"];
                    JobId = Convert.ToInt32(Session["JobID"]);

                    JpbpostName = context.job_post.Where(c => c.rec_id == JobId).FirstOrDefault();
                    if (JpbpostName != null)
                    {
                        jobtitle.InnerText = JpbpostName.job_title;
                    }

                }
                else if (Request.QueryString["CandidateId"] != null)
                {
                    Session["CandidateId"] = Request.QueryString["CandidateId"];

                    question = Convert.ToString(Session["question"]);// "Question 2:- How did you hear about this position?;Question 3:- Why did you decide to apply for this position?;Question 4:- What are your strengths and weaknesses?";
                    question = question.Substring(0, question.Length - 1);
                    var quest = question.Split(';');
                    lblmsg.InnerText = quest[0];
                    JobId = Convert.ToInt32(Session["JobID"]);

                    JpbpostName = context.job_post.Where(c => c.rec_id == JobId).FirstOrDefault();
                    if (JpbpostName != null)
                    {
                        jobtitle.InnerText = JpbpostName.job_title;
                    }

                }


                if (Request.QueryString["id"] != null)
                {
                    string ok1 = Request.QueryString["id"].ToString();
                    if (ok1 == "How did you hear about this position")
                    {
                        lnknext.HRef = "http://localhost:60242/Create_Video_Interview?id=Why did you decide to apply for this position";
                        lblmsg.InnerText = "Question 2:- How did you hear about this position?";
                    }
                    else if (ok1 == "Why did you decide to apply for this position")
                    {
                        lnknext.HRef = "http://localhost:60242/Create_Video_Interview?id=What are your strengths and weaknesses";
                        lblmsg.InnerText = "Question 3:- Why did you decide to apply for this position?";
                    }
                    else if (ok1 == "What are your strengths and weaknesses")
                    {
                        lnknext.HRef = "http://localhost:60242/Create_Video_Interview?id=What do you know about Company";
                        lblmsg.InnerText = "Question 4:- What are your strengths and weaknesses?";
                    }
                    else if (ok1 == "What do you know about Company")
                    {
                        lnknext.InnerText = "Finish and Final Save";
                        lnknext.HRef = "http://localhost:60242/Thank_You";
                        lblmsg.InnerText = "Question 5:- What do you know about Company?";
                    }
                }
            }
            catch { }
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