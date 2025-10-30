using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Reflection;

namespace Extuent.Admin
{
    public partial class EmailSendToClient : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        public category category = new category();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                }

                getList();
            }
            catch { }
        }
        public bool isWelcomeMailsent(string RecieverEmail, int recid)
        {

            // Welcome Email
            bool result = false;
            try
            {
                var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
                var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
                var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
                var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

                string body = "";


                body += "<html><head></head><body><center><table style='height:auto;width:600px;'><tr><td><span style='font-family:arial;font-size:14px;'><b>Dear Hello</b></span><br><br>";
                body += "</td><td>Please view candidate profile, Click on link <a href=https://extuent.ai/admin/profile-for-company?vid=" + recid + ">Click Here</a>";
                body += "</td></tr></table></center></body></html>";






                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                var fromAddress = new MailAddress(mailaddress);
                var toAddress = new MailAddress(RecieverEmail);
                const string subject = "Candidate Profile From Extuent INC";
                var smtp = new SmtpClient
                {
                    Host = smtpHost,
                    Port = smtpPort,
                    EnableSsl = true, //chk_usessl
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, mailpassword)
                };

                ///  Attachment attach = new Attachment(file path);
                MailMessage mail = new MailMessage(fromAddress, toAddress);


                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.Body = body;
                mail.Subject = subject;
                smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            { }

            return result;
        }
        public bool isVideoInterviewMailsent(string RecieverEmail, int recid)
        {

            // Welcome Email
            bool result = false;
            try
            {
                var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
                var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
                var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
                var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

                string body = "";


                body += "<html><head></head><body><center><table style='height:auto;width:600px;'><tr><td><span style='font-family:arial;font-size:14px;'><b>Dear Hello</b></span><br><br>";
                body += "</td><td>Please Proceed your video interview, Click on link <a href=http://extuent.ai/Create_Profile?id=" + recid + "#wizard_Service>Click Here</a>";
                body += "</td></tr></table></center></body></html>";






                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                var fromAddress = new MailAddress(mailaddress);
                var toAddress = new MailAddress(RecieverEmail);
                const string subject = "Video Interview Link";
                var smtp = new SmtpClient
                {
                    Host = smtpHost,
                    Port = smtpPort,
                    EnableSsl = true, //chk_usessl
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, mailpassword)
                };

                ///  Attachment attach = new Attachment(file path);
                MailMessage mail = new MailMessage(fromAddress, toAddress);


                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.Body = body;
                mail.Subject = subject;
                smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            { }

            return result;
        }
        public bool isWelcomeMailsentForList(string RecieverEmail, string recid)
        {

            // Welcome Email
            bool result = false;
            try
            {
                var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
                var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
                var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
                var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

                string body = "";


                body += "<html><head></head><body><center><table style='height:auto;width:600px;'><tr><td><span style='font-family:arial;font-size:14px;'><b>Dear Hello</b></span><br><br>";
                body += "</td><td>Please view candidate profile, Click on link <a href=https://extuent.ai/admin/Multple-Candidate_List?vid=" + recid + ">Click Here</a>";
                body += "</td></tr></table></center></body></html>";






                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                var fromAddress = new MailAddress(mailaddress);
                var toAddress = new MailAddress(RecieverEmail);
                const string subject = "Candidate Profile From Extuent INC";
                var smtp = new SmtpClient
                {
                    Host = smtpHost,
                    Port = smtpPort,
                    EnableSsl = true, //chk_usessl
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, mailpassword)
                };

                ///  Attachment attach = new Attachment(file path);
                MailMessage mail = new MailMessage(fromAddress, toAddress);


                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.Body = body;
                mail.Subject = subject;
                smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            { }

            return result;
        }
        public void getList()
        {
            canloginList = context.candidate_login.Where(c => c.active == 1).ToList();

        }
    

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["email"] != null)
                {
                    int ReqId = Convert.ToInt32(Request.QueryString["email"]);


                    canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    if (canloginNow != null)
                    {

                        bool isemail = isWelcomeMailsent(txtEmail.Text, ReqId);
                        if (isemail == true)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email sent successfully!..')", true);
                            Response.Redirect("send-profile",true);
                        }


                    }
                }

               else if (Request.QueryString["emailhidden2"] != null)
                {
                    //jobid
                    int ReqId = Convert.ToInt32(Request.QueryString["emailhidden2"]);


                    //canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    //if (canloginNow != null)
                   // {

                        bool isemail = isVideoInterviewMailsent(txtEmail.Text, ReqId);
                        if (isemail == true)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email sent successfully!..')", true);
                            Response.Redirect("send-profile", true);
                        }


                    //}
                }
                else if (Request.QueryString["emailhidden"] != null)
                {
                    string ReqId = Request.QueryString["emailhidden"];


                    //canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    //if (canloginNow != null)
                   // {

                        bool isemail = isWelcomeMailsentForList(txtEmail.Text, ReqId);
                        if (isemail == true)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email sent successfully!..')", true);
                            Response.Redirect("send-profile", true);
                        }


                   // }
                }
            }
            catch (Exception ex) { }
        }
    }
}