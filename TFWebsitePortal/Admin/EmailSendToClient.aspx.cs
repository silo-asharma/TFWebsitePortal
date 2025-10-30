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
        protected job_post JobPost1 = new job_post();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        protected candidate_login canloginNow1 = new candidate_login();
        public category category = new category();
        public email_notification_setting emailnoti = new email_notification_setting();
        protected List<candidate_experience> canExpList = new List<candidate_experience>();
        protected candidate_experience canexp = new candidate_experience();
        protected candidate_experience canexp1 = new candidate_experience();
        protected share_link_history sharelink = new share_link_history();
        protected employer_login employerDetails = new employer_login();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        public string DisplayEmail = System.Configuration.ConfigurationManager.AppSettings["DisEmailId"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               // backqueryString();
                if (!IsPostBack)
                {
                    EmailHead.InnerText = "Send Email";
                    Session["EmailHead"] = "Send Email";
                    if (Request.QueryString["emailhidden3"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["emailhidden3"]);
                        //  plink.InnerHtml = "Use this link to invite candidate <span style='color: blue;'><a style='color: blue;' href=http://localhost:60242/Create_Profile?id=" + Request.QueryString["emailhidden3"] + "#wizard_Service> http://localhost:60242/Create_Profile?id=" + Request.QueryString["emailhidden3"] + "#wizard_Service</a></span>";
                        plink.InnerHtml = "Use this link to invite candidate <span style='color: blue;'><a style='color: blue;' href=" + URLDisplay + "/JobDetails?Ex=" + Request.QueryString["emailhidden3"] + "> http://localhost:60242/JobDetails?Ex=" + Request.QueryString["emailhidden3"] + "</a></span>";

                        EmailHead.InnerText = "Share Job";
                        Session["EmailHead"] = "Share Job";
                    }
                   else if (Request.QueryString["emailhidden"] != null)
                    {
                        //int ReqId = Convert.ToInt32(Request.QueryString["emailhidden"]);

                        string valueNew = Convert.ToString(Request.QueryString["emailhidden"]);

                        //String[] result = valueNew.Split('-');
                        //string newstring = "";
                        //foreach (var str in result)
                        //{

                        //   // newstring=
                        //}


                        sharelink.actual_url = "" + URLDisplay + "/admin/Multple-Candidate_List?vid=" + admincommon.Encrypt(Request.QueryString["emailhidden"].ToString()) + "&&newupdate=true";
                        sharelink.doc = DateTime.Now;
                        sharelink.created_by = Convert.ToInt32(Session["user-recid"]);

                        context.share_link_history.Add(sharelink);

                        context.SaveChanges();
              
                        string displayShareURL = "" + URLDisplay + "/CandidateProfile?Pr=" + admincommon.Encrypt(sharelink.rec_id.ToString()) + "";



                        
                        plink.InnerHtml = "Use this link to share profile to Client <span style='color: blue;'><a style='color: blue;' href=" + displayShareURL + "> " + displayShareURL + "</a></span>";
                        EmailHead.InnerText = "Share Profile";
                        Session["EmailHead"] = "Share Profile";
                    }
                    //Email For Retake 
                    else if (Request.QueryString["emailRetake"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["emailRetake"]);


                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();
                        if (canloginNow != null)
                        {

                            var originalEntity = context.candidate_login.AsNoTracking().FirstOrDefault(ok => ok.rec_id == canloginNow.rec_id);
                            context.candidate_login.Add(originalEntity);
                          

                            // context.Entry(canloginNow1).CurrentValues.SetValues(canloginNow);
                            context.SaveChanges();

                            originalEntity.doc= DateTime.Now;
                            originalEntity.status = "Pending";
                            originalEntity.result = null;
                            originalEntity.is_send_for_reupload = null;
                            originalEntity.is_final_save = null;


                            context.SaveChanges();




                            //job apply
                            CandidateJobapply = new candidate_job_apply();

                            CandidateJobapply.candidate_rec_id = originalEntity.rec_id;
                            CandidateJobapply.job_post_rec_id = canloginNow.job_apply_id;
                            CandidateJobapply.doc = DateTime.Now;
                            CandidateJobapply.active = true;


                            context.candidate_job_apply.Add(CandidateJobapply);
                            context.SaveChanges();


                            //expeience work
                            canExpList = context.candidate_experience.Where(c => c.candidate_id == canloginNow.rec_id && c.is_active == true).OrderBy(c => c.id).Take(3).ToList();
                            if (canExpList != null)
                            {
                                int balcal = 3 - canExpList.Count;
                                int canexpr;
                                for (int l = 0; l <= canExpList.Count - 1; l++)
                                {
                                       canexpr = Convert.ToInt32(canExpList[l].id);
                                       canexp = context.candidate_experience.Where(c => c.id == canexpr).FirstOrDefault();
                                    if (canexp != null)
                                    {

                                        var originalEntity1 = context.candidate_experience.AsNoTracking().FirstOrDefault(ok => ok.id == canexp.id);
                                        context.candidate_experience.Add(originalEntity1);

                                        context.SaveChanges();
                                        //  context.Entry(canexp1).CurrentValues.SetValues(canexp);
                                        //  context.SaveChanges();


                                    }
                                }

                            }
                            


                            //if (canloginNow != null)
                            // {

                            JobPost1 = context.job_post.Where(c => c.rec_id == originalEntity.job_apply_id).FirstOrDefault();
                            if (JobPost1 != null)
                            {

                                emailnoti = context.email_notification_setting.Where(c => c.email_name == "Profile completion Email").FirstOrDefault();

                                string Subject = "Interview Retake Invite For " + JobPost1.job_title + " | " + JobPost1.company + "";

                                string Body = "";

                                Body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Interview Retake Invite<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";
                                Body += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for the " + JobPost1.job_title + " position and completing the one-way interview. <br/>";// Login User Name



                                Body += emailnoti.email_details;

                                Body += "  <br/> We have reviewed your interview recording and think that you may be a good fit for the role.<br/>However, we noticed some recording issues and invite you to re-record. Please check your email for detailed feedback and <a href='" + URLDisplay + "/Create_Video_Interview?jobid=" + originalEntity.job_apply_id + "&&CandidateId=" + originalEntity.rec_id + "'>click here</a>  to record.";
                                

                                Body += "<br/><br/>";
                                Body += "</td></tr> <tr><td><br/>All the best !<br/>HR Team<br/>" + Session["CompanyName"].ToString() + "<br/>" + Session["useremail"].ToString() + "<br/>  " + emailnoti.email_signature + "<br/> ";
                                Body += "</td> </tr>  </table ></body></html>";





                                SendEmail(Subject, Body, canloginNow.email);
                                string returnquery = backqueryString();
                                Response.Redirect("candidate-interview-list?type=Back" + returnquery + "", true);

                            }
                        }
                        //bool isemail = isWelcomeMailsentForList(txtEmail.Text, ReqId);
                        //if (isemail == true)
                        //{
                        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email sent successfully!..')", true);
                        //    Response.Redirect("candidate-interview-list?type=All", true);
                        //}


                        // }
                    }
                    else
                        plink.InnerHtml = "";

                    }

                getList();
                
            }
            catch(Exception ex) { }
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
                body += "</td><td>Please view candidate profile, Click on link <a href=" + URLDisplay + "/admin/profile-for-company?vid=" + recid + ">Click Here</a>";
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
                //smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            { }

            return result;
        }
        //Interview completion Reminder Email
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
                body += "</td><td>Please Proceed your video interview, Click on link <a href=" + URLDisplay + "/Create_Profile?id=" + recid + "#wizard_Service>Click Here</a>";
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
                //smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert("+ ex.Message + ")", true);
            }

            return result;
        }
        //Share Job Details Email
        public bool isJobShareMailsent(string RecieverEmail, int recid,string jobtitle,string jobdetails)
        {

            // Welcome Email
            bool result = false;
            string companyName = "";
            string companyEmail = "";
            try
            {
                var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
                var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
                var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
                var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();
                emailnoti = context.email_notification_setting.Where(c => c.email_name == "Share Job Details Email").FirstOrDefault();


                employerDetails = context.employer_login.Where(c => c.rec_id == recid).FirstOrDefault();
                if (employerDetails != null)
                {
                    if (employerDetails.rec_id != 3)
                    {
                        companyName = employerDetails.company_name;
                        companyEmail = employerDetails.comapny_email;
                    }

                }


                //string body = "";


                //body += "<html><head></head><body><center><table style='height:auto;width:600px;'><tr><td style='background-color:#FE634E;width:100%;'><center><br/><span style='font-family:arial;font-size:14px;color:white;'><b>Job Details</b></span>    </center><br><br>";
                //body += "</td></tr><tr><td><br/><br/><a href=https://extuent.ai/job-Details?Jobid=" + recid + "#wizard_Service>Click Here</a> to register and apply for "+ jobtitle + "";
                //body += "</td></tr><tr><td><br/><b>Job Summary</b><br/>" + jobdetails+"";

                //// body += "</td></tr><tr><td><br/>You will be required to complete your profile and One-way interview. <br/> Once your one-way interview is completed, our HR team will get in touch with you regarding the next steps. <br/>";

                //body += "</td></tr><tr><td><br/> ";
                //body += emailnoti.email_details;
                //body += "<br/>";
                ////  body += "</td></tr><tr><td><br>All the Best!<br/>" + Session["CompanyName"].ToString() + " HR Team<br/>";
                // body += "</td></tr><tr><td><br><br/>" + emailnoti.email_signature + " <br/>";
                //body += "</td></tr><tr><td style='background-color:#FE634E;width:100%;'><br/></td></tr></table></center></body></html>";


                string body = "";


                body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> New Opening !<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";

                body += "<tr><td></td></tr> <tr><td> <br/><br/><a href=" + URLDisplay + "/JobDetails?Ex=" + recid + ">Click Here</a> to apply for " + jobtitle + "";// Login User Name
                body += "</td></tr><tr><td><br/><b>Job Summary</b><br/>" + jobdetails + "";
                body += "</td></tr><tr><td><br/> ";

                body += emailnoti.email_details;

                ;

                
                body += "</td></tr> <tr><td>All the best !<br/>HR Team<br/>" + companyName + "<br/>" + companyEmail + "<br/>  " + emailnoti.email_signature + "<br/> ";


                body += "</td> </tr>  </table ></body></html>";



                string[] Multiple = RecieverEmail.Split(',');


                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                string fromAddress = mailaddress;
                // var toAddress = new MailAddress(RecieverEmail);
                string subject = emailnoti.email_subject;//"Job Details";
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
                foreach (string multiple_email in Multiple)
                {
                    mail.To.Add(new MailAddress(multiple_email));
                }



                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.Body = body;
                mail.Subject = subject;
                //smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert(" + ex.Message + ")", true);
            }

            return result;
        }
        //Share Candidate Profile Email
        public bool isWelcomeMailsentForList(string RecieverEmail, string recid)
        {

            // Welcome Email
            bool result = false;
            try
            {
                int recidnow = 0; 

                Char delimiter = '-';
                String[] resultofstring = recid.Split(delimiter);
                try {

                    for (int i = 0; i < resultofstring.Length; i++)
                    {
                        if (resultofstring[i] != "-" && resultofstring[i] != null && resultofstring[i] != "" && resultofstring[i] != "on")
                        {
                            recidnow = recidnow+1;
                            
                        }
                    }
                }
                catch { }

                var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
                var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
                var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
                var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

                int employer_login_id = Convert.ToInt32(Session["user-recid"]);

                emailnoti = context.email_notification_setting.Where(c => c.email_name == "Share Candidate Profile Email").FirstOrDefault();

                string body = "";


                body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Candidate Profiles<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";

                body += "<tr><td></td></tr> <tr><td> " + Session["CompanyName"].ToString()+ " has shared " + recidnow + " candidate profiles for your review.";// Login User Name

                body += emailnoti.email_details;

                ;

                body += "  <br/> Kindly <a href=" + URLDisplay + "/admin/Multple-Candidate_List?vid=" + admincommon.Encrypt(recid) + "&&newupdate=true>Click Here</a> to view the interview recordings and assess the profiles."; 
                body += "</td></tr> <tr><td><br/>"+ Session["CompanyName"].ToString() + "<br/>" + Session["useremail"].ToString() + "<br/>  " + emailnoti.email_signature + "<br/> ";


                body += "</td> </tr>  </table ></body></html>";





                string[] Multiple = RecieverEmail.Split(',');
             

                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                string fromAddress = mailaddress;
                // var toAddress = new MailAddress(RecieverEmail);
                string subject = emailnoti.email_subject; //"Candidate Profile From Extuent INC";
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
                mail.From= new MailAddress(DisplayEmail);
                foreach (string multiple_email in Multiple)
                {
                    mail.To.Add(new MailAddress(multiple_email));
                }

                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.Body = body;
                mail.Subject = subject;
                //smtp.Send(mail);
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
        private void SendEmail(string subject, string body, string emailto)
        {
            var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
            var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
            var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
            var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

            string[] Multiple = emailto.Split(',');

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
            foreach (string multiple_email in Multiple)
            {
                mail.To.Add(new MailAddress(multiple_email));
            }

            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            mail.Body = body;
            mail.Subject = subject;
            //smtp.Send(mail);

            //var client = new SmtpClient("in-v3.mailjet.com", 587)
            //{
            //    Credentials = new NetworkCredential("38f32b15f54e1dba9ece6f115f02a0d6", "4fa32ee39174afe3006aec202684abf7"),
            //    EnableSsl = true
            //};

            //var message = new MailMessage(
            //    from: "abhisheksharma.swv@gmail.com",
            //    to: "abhisheksharma.swv@gmail.com",
            //    subject: "Mailjet SMTP Email",
            //    body: "This is a test email sent via Mailjet SMTP from ASP.NET"
            //);

            //client.Send(message);


            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            //System.Net.Mail.SmtpClient gmail = new System.Net.Mail.SmtpClient();
            //gmail.UseDefaultCredentials = false;
            //gmail.Credentials = new System.Net.NetworkCredential("jobs@extuent.ai", "Smart3022@Interview");
            //gmail.Host = "smtp.gmail.com";
            //gmail.Port = 587;    //465 this one times out
            //gmail.EnableSsl = true;
            //gmail.Timeout = 120000;

            //mail = new System.Net.Mail.MailMessage();
            //mail.IsBodyHtml = true;

            //mail.From = new System.Net.Mail.MailAddress("jobs@extuent.ai");
            //mail.To.Add(emailto);
            ////mail.CC.Add("vijay@extuent.com");
            ////mail.Bcc.Add("abhisheksharma.swv@gmail.com");
            //mail.Subject = subject;
            //mail.Body = "<html><body>" + body + "</body></html>";
            //gmail.Send(mail);


        }
        public string backqueryString()
        {
          string  retQry = "";
            try
            {


                string qrystring = "";
                if (Request.QueryString["category"] != null)
                {
                    qrystring = "&&category=" + Request.QueryString["category"].ToString();
                }
                if (Request.QueryString["job"] != null)
                {
                    qrystring += "&&job=" + Request.QueryString["job"].ToString();
                }
                if (Request.QueryString["application"] != null)
                {
                    qrystring += "&&application=" + Request.QueryString["application"].ToString();
                }
                if (Request.QueryString["desc"] != null)
                {
                    qrystring += "&&desc=" + Request.QueryString["desc"].ToString();
                }
                if (Request.QueryString["country"] != null)
                {
                    qrystring = Convert.ToString(Request.QueryString["country"]);

                }
                if (Request.QueryString["textSearch"] != null)
                {
                    qrystring += "&&textSearch=" + Request.QueryString["textSearch"].ToString();
                }
                if (Request.QueryString["Closed"] != null)
                {
                    qrystring += "&&Closed=" + Request.QueryString["Closed"].ToString();
                }
                //Session["Backqrystring"] = qrystring;
                retQry = qrystring;
            }
            catch { }

            return retQry;
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
                            string returnquery = backqueryString();
                            Response.Redirect("candidate-interview-list?type=Back" + returnquery + "", true); 
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
                            string returnquery = backqueryString();
                            Response.Redirect("candidate-interview-list?type=Back" + returnquery + "", true);
                    }


                    //}
                }
                else if (Request.QueryString["emailhidden3"] != null)
                {
                    //Share Job
                    int ReqId = Convert.ToInt32(Request.QueryString["emailhidden3"]);

                    Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    
                    //canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    //if (canloginNow != null)
                    // {

                    bool isemail = isJobShareMailsent(txtEmail.Text, ReqId, Jpost.job_title,Jpost.job_desc_short);
                    if (isemail == true)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email sent successfully!..')", true);
                        Response.Redirect("dashboard", true);
                    }


                    //}
                }
                //Profile of Candidate
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
                            string returnquery = backqueryString();
                            Response.Redirect("candidate-interview-list?type=Back" + returnquery + "", true);
                    }


                   // }
                }
              


            }
            catch (Exception ex) { }
        }
    }
}