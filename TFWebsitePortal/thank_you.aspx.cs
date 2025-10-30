using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using System.Reflection;
using System.Web.Services;
using System.Net;
using System.Net.Mail;

namespace Extuent
{
    
    public partial class thank_you : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();     
      
        protected job_post JobPost = new job_post();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        public email_notification_setting emailnoti = new email_notification_setting();
        public string statusofinterview = "False";
        public string candidate_id = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
            //  ClientScript.RegisterStartupScript(Page.GetType(), "OnLoad", "gethidden();", true);
               // ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:gethidden(); ", true);


                if (!IsPostBack)
                {
                    if (Request.QueryString["status"] != null)
                    {
                        statusofinterview = "True";
                    }
                    if (Request.QueryString["JobID"] != null && Request.QueryString["CandidateID"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["JobID"]);

                        int CandidateID = Convert.ToInt32(Request.QueryString["CandidateID"]);
                        candidate_id = CandidateID.ToString();
                        JobPost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();
                        canlogin = context.candidate_login.Where(c => c.rec_id == CandidateID).FirstOrDefault();
                        

                        try
                        {
                            int jobcount = 0;
                            int RecordedVideojobcount = 0;
                            int jobrecidnew = ReqId;
                            jobcount = Convert.ToInt32(context.add_questions.Where(c => c.job_id == jobrecidnew).ToList().Count());

                            RecordedVideojobcount = Convert.ToInt32(context.video_interview.OrderByDescending(c => c.id).ToList().ToList().Count());

                            if (jobcount<=RecordedVideojobcount)
                                canlogin.status = "Completed";
                            else
                                canlogin.status = "Pending";

                        }
                        catch {
                            canlogin.status = "Pending";
                        }
                        //var kkkk = hdnBrowserName.Value;

                        context.SaveChanges();

                        emailnoti = context.email_notification_setting.Where(c => c.email_name == "Interview Submission Email").FirstOrDefault();


                        string Subject = "Interview Status:Video Interview of " + canlogin.name + " For Job " + JobPost.job_title + " completed successfully..";

                        string Body = "";

                        Body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Congratulations!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";
                        Body += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for " + JobPost.job_title + " position and completing the one-way interview recording. <br/>";// Login User Name

                        Body += emailnoti.email_details;

                        Body += "<br/> Our HR team will review your application and contact you regarding the next steps.";

                        Body += "<br/><br/>";
                        Body += "</td></tr> <tr><td><br/>All the best !<br/>HR Team<br/>" + Session["CompanyName"].ToString() + "<br/>" + Session["useremail"].ToString() + "<br/>  " + emailnoti.email_signature + "<br/> ";
                        Body += "</td> </tr>  </table ></body></html>";

                        SendEmail(Subject, Body);
                    }
                   
                }
            }
            catch (Exception ex) { }
        }

        private void SendEmail(string subject, string body)
        {
            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            //System.Net.Mail.SmtpClient gmail = new System.Net.Mail.SmtpClient();
            //gmail.UseDefaultCredentials = false;
            //gmail.Credentials = new System.Net.NetworkCredential("jobs@extuent.com", "HelloExtuent@?Go");
            //gmail.Host = "smtp.gmail.com";
            //gmail.Port = 587;    //465 this one times out
            //gmail.EnableSsl = true;
            //gmail.Timeout = 120000;

            //mail = new System.Net.Mail.MailMessage();
            //mail.IsBodyHtml = true;

            //mail.From = new System.Net.Mail.MailAddress("jobs@extuent.com");
            //mail.To.Add("support@extuent.com");
            //// mail.CC.Add("vijay@extuent.com");
            ////  mail.Bcc.Add("abhisheksharma.swv@gmail.com");
            //mail.Subject = subject;
            //mail.Body = "<html><body>" + body + "</body></html>";
            //gmail.Send(mail);

            var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
            var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
            var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
            var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();
            var DisplayEmail = System.Configuration.ConfigurationManager.AppSettings["DisEmailId"].ToString();

            //string[] Multiple = emailto.Split(',');

            //RecieverEmail = "abhisheksharma.swv@gmail.com";
            string fromAddress = mailaddress;
            // var toAddress = new MailAddress(emailto);

            var smtp = new SmtpClient
            {
                Host = smtpHost,
                Port = smtpPort,
                EnableSsl = true, //chk_usessl
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress, mailpassword)
            };

            ///  Attachment attach = new Attachment(file path);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(DisplayEmail);
            mail.To.Add("support@extuent.com");

            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            mail.Body = "<html><body>" + body + "</body></html>"; ;
            mail.Subject = subject;
          //  smtp.Send(mail);


        }

        [WebMethod]
        public static string assignUrl(string QID, int CandidateID)
        {
            
            string url = "";
            db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
            video_interview videoInterviewnNow = new video_interview();
            int qid = Convert.ToInt32(QID);
            videoInterviewnNow = context.video_interview.Where(c => c.question_id == qid && c.candidate_id == CandidateID).FirstOrDefault();
            if (videoInterviewnNow != null)
            {
               // string[] subs = videoInterviewnNow.question_vedio_URL.Split('.');

                //url = videoURL + subs[0];
            }

            return url;
        }
    }
}