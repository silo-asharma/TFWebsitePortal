using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using System.IO;
using FFMpegSharp;
using System.Net;
using System.Net.Mail;
namespace Extuent
{
    public partial class Create_Profile : System.Web.UI.Page
    {
        
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected add_questions JQuestion = new add_questions();
        protected List<add_questions> QuestionList = new List<add_questions>();
        protected List<job_post> JobpostList = new List<job_post>();
        protected job_post JobPost = new job_post();
        protected job_post JobPost1 = new job_post();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected candidate_login canlogincheck = new candidate_login();
        protected string rolelist = "";
        public List<skills_master> sklList = new List<skills_master>();
        protected candidate_experience canexp = new candidate_experience();
        public user_login usr1 = new user_login();
        public email_notification_setting emailnoti = new email_notification_setting();
        string datename = DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
        public string jobname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                   

                    foreach(skills_master role in context.skills_master.ToList())
                      {
                        rolelist += "<option value = '" + role.skill_name + "'>" + role.skill_name + " </option>";
                    }
                    foreach (city_country cty in context.city_country.ToList())
                    {
                        countrycityList.InnerHtml += "<option>" + cty.city_name + ", " + cty.country + "</option>";

                    }

                   // sklList = context.skills_master.Where(c=>c.active==1).ToList();

                    if (Request.QueryString["id"] != null)
                    {
                     //   Div1.Visible = true;
                     //   Div2.Visible = false;

                        int ReqId = Convert.ToInt32(Request.QueryString["id"]);
                        Session["JobID"]= Convert.ToInt32(Request.QueryString["id"]);

                        JobPost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (JobPost != null)
                        {
                            jobname = txtjobtitle.Value = JobPost.job_title;
                             lblapplied.InnerText = "Position : " + txtjobtitle.Value;
                            txtjobdescription.Value = JobPost.job_desc;
                            Session["jobcateg"] = JobPost.job_category;
                            Session["ReqId"] = ReqId;
                            int catId = Convert.ToInt32(JobPost.job_category);
                            QuestionList = context.add_questions.Where(c => c.job_id == ReqId && c.cat_id == catId).ToList();

                            string question = "";
                            for (int k = 0; k < QuestionList.Count; k++)
                            {
                                question = question +QuestionList[k].question+";";

                            }

                            Session["question"] = question;

                            string[] roless = JobPost.skills.Split(',');
                           
                           
                            List<int> listOfRoleId = new List<int>();
                            foreach (var li in roless)
                            {
                                if (li != "")
                                {
                                    listOfRoleId.Add(Convert.ToInt32(li));
                                    
                                }//ListBox1.se = li;

                            }

                            //int[] roles = Array.ConvertAll(roless, int.Parse);

                            //var listOfRoleId = roles;
                            if(listOfRoleId!=null)
                                sklList = context.skills_master.Where(c => listOfRoleId.Contains(c.id)).ToList();
                            // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }

                        if (Request.QueryString["page"] != null)
                        {
                            //Div1.Visible = false;
                           // Div2.Visible = false;
                           // Div3.Visible = true;
                        }
                        }


                    }

             
            }
            catch(Exception ex) { }
        }


        public string uploadFile1()
        {
            string ret = "";
            try
            {
                
                if (flvResume.HasFile)
                {
                    string extension = Path.GetExtension(flvResume.PostedFile.FileName);
                    string newName = "ResumeFile" + datename + extension;
                    flvResume.SaveAs(@"C:\Live\Extuent\Admin\Upload\PortalDocument\" + newName);
                    ret = newName;
                }
            }
            catch { }
            return ret;
        }
        public string uploadFile()
        {
            string ret = "";
            try
            {
                if (flvUploadProfilePic.HasFile)
                {
                    string extension = Path.GetExtension(flvUploadProfilePic.PostedFile.FileName);
                    string newName = "ProfilePic" + datename + extension;
                  
                    flvUploadProfilePic.SaveAs(@"C:\Live\Extuent\Admin\Upload\PortalProfile\" + newName);
                    ret = newName;
                }
              
            }
            catch { }
            return ret;
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {


            try
            {
               // Response.Redirect("http://localhost:60242/Create_Profile?id=14#wizard_Time");
               // return;
                if (txtname.Value=="")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Name must be filled out')", true);
                    return;
                }

                if (txtemail.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email must be filled out')", true);
                    return;
                }
                else
                {
                    int jobrecId = Convert.ToInt32(Session["JobID"]);
                    canlogincheck = context.candidate_login.Where(c => c.email == txtemail.Value && c.job_apply_id== jobrecId && c.active == 1).FirstOrDefault();
                    if (canlogincheck != null)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id Already Exist')", true);
                        lnkVideo.Visible = true;
                        lnkVideo.NavigateUrl = "Create_Video_Interview?CandidateId=" + canlogincheck.rec_id + "";
                           
                        return;

                    }
                }
                //if (txtphoneNumber.Value == "")
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Phone Number must be filled out')", true);
                //    return;
                //}
                //if (txtaddress.Value == "")
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Address must be filled out')", true);
                //    return;
                //}

               



                //if (txtHighertitle.Value == "")
                //{
                //  Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Highe Education title must be filled out')", true);
                //return;
                //}
                //  if (txtdegree.Value == "")
                //    {
                //       Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Degree must be filled out')", true);
                //      return;
                //   }

                //    if (txtinstitute.Value == "")
                //  {
                //     Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Highe Education Institute must be filled out')", true);
                //      return;
                // }
                // if (txtyear.Value == "")
                // {
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Year must be filled out')", true);
                //    return;
                // }
                //if (txtskills.Value == "")
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Skills must be filled out')", true);
                //    return;
                //}

                if (!flvResume.HasFile)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select your resume')", true);
                    return;
                }
                string[] validFileTypes = { "docx", "doc", "pdf" };

                string ext = System.IO.Path.GetExtension(flvResume.PostedFile.FileName);

                bool isValidFile = false;

                for (int i = 0; i < validFileTypes.Length; i++)
                {

                    if (ext == "." + validFileTypes[i])
                    {

                        isValidFile = true;

                        break;

                    }

                }

                if (!isValidFile)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please upload resume in doc and pdf format only)", true);
                    return;

                }





                
                if (!flvUploadProfilePic.HasFile)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select your Profile Picture')", true);
                    return;
                }
                string[] validFileTypes1 = {  "png", "jpg", "jpeg" };

                string ext1 = System.IO.Path.GetExtension(flvUploadProfilePic.PostedFile.FileName);

                bool isValidFile1 = false;

                for (int i = 0; i < validFileTypes1.Length; i++)
                {

                    if (ext1 == "." + validFileTypes1[i])
                    {

                        isValidFile1 = true;

                        break;

                    }

                }

                if (!isValidFile1)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please upload picture in png,jpg and jpeg format only)", true);
                    return;

                }


                string[] roles = hidUsersRoles.Value.Split(',');


                canlogin = new candidate_login();

                canlogin.name = txtname.Value;
                canlogin.last_name = txtlastname.Value;
                canlogin.email = txtemail.Value;
                canlogin.mobile_no = txtphoneNumber.Value;
                canlogin.location = txtaddress.Value;
                if(rdoGender.Checked==true)
                    canlogin.gender = "Male";
                else if(rdoFemale.Checked == true)
                        canlogin.gender = "Female";
                else if (rdoTransgen.Checked == true)
                    canlogin.gender = "Transgender";

                canlogin.hq_tittle = txtotheredu.Value;//others
                canlogin.hq_degree = DropDownList1.SelectedValue;
                canlogin.hq_institute = txtHighertitle.Value;
                canlogin.hq_year = txtyear.Value;
                canlogin.hq_skill = hidUsersRoles.Value +", "+ txtskills.Value;
                if (Session["jobcateg"] != null)
                    canlogin.available_for_job_type = Convert.ToString(Session["jobcateg"]);

                canlogin.active = 1;
                canlogin.doc = DateTime.Now;
                canlogin.status = "Pending";
                canlogin.fixed_ctc = txtfixedctc.Value;
                canlogin.total_ctc = txttotalctc.Value;
                canlogin.variable_ctc = txtvarctc.Value;
                canlogin.notice_period = ddlNoticeP.SelectedValue;
                canlogin.job_apply_id= Convert.ToInt32(Session["ReqId"]);
                try
                {
                    canlogin.candidate_login_id = Convert.ToString(context.job_post.Where(c => c.rec_id == canlogin.job_apply_id).FirstOrDefault().employer_login_rec_id);
                   
                }
                catch { }

                context.candidate_login.Add(canlogin);
                context.SaveChanges();

                CandidateJobapply = new candidate_job_apply();

                CandidateJobapply.candidate_rec_id = canlogin.rec_id;
                CandidateJobapply.job_post_rec_id = Convert.ToInt32(Session["ReqId"]);
                CandidateJobapply.doc = DateTime.Now;
                CandidateJobapply.active = true;
                

                context.candidate_job_apply.Add(CandidateJobapply);
                context.SaveChanges();

                //uploadFile();

                canlogin.candidate_resume_url = uploadFile1();
                canlogin.candidate_profile_pic_url = uploadFile();

                context.SaveChanges();

                //add experience

                if (company.Value != "")
                {
                    canexp.candidate_id = canlogin.rec_id;
                    canexp.company_name = company.Value;
                    canexp.job_title = title.Value;
                    canexp.start_date = from.Value;
                    canexp.end_date = to.Value;
                    canexp.is_active = true;

                    context.candidate_experience.Add(canexp);
                    context.SaveChanges();
                }

                if (company1.Value != "")
                {
                    canexp = new candidate_experience();

                    canexp.candidate_id = canlogin.rec_id;
                    canexp.company_name = company1.Value;
                    canexp.job_title = title1.Value;
                    canexp.start_date = from1.Value;
                    canexp.end_date = to1.Value;
                    canexp.is_active = true;

                    context.candidate_experience.Add(canexp);
                    context.SaveChanges();
                }

                if (company2.Value != "")
                {
                    canexp = new candidate_experience();

                    canexp.candidate_id = canlogin.rec_id;
                    canexp.company_name = company2.Value;
                    canexp.job_title = title2.Value;
                    canexp.start_date = from2.Value;
                    canexp.end_date = to2.Value;
                    canexp.is_active = true;

                    context.candidate_experience.Add(canexp);
                    context.SaveChanges();
                }


                Session["canlogin"] = canlogin.rec_id;
                try
                {
                    JobPost1 = context.job_post.Where(c => c.rec_id == canlogin.job_apply_id).FirstOrDefault();
                    if (JobPost1 != null)
                    {


                        //Response.Redirect("Create_Video_Interview?CandidateId="+ canlogin.rec_id + "");

                        //Profile completion Email
                        emailnoti = context.email_notification_setting.Where(c => c.email_name == "Profile completion Email").FirstOrDefault();

                        string Subject = emailnoti.email_subject + " "+ JobPost1.company + "";


    

                        string Body = "";

                        Body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Congratulations!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";
                        Body += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for the " + JobPost1.job_title + " position. <br/>";// Login User Name



                        Body += emailnoti.email_details;

                        Body += "  <br/> If you have not completed the application process, please <a href='https://extuent.net/Create_Video_Interview?jobid=" + canlogin.job_apply_id + "&&CandidateId=" + canlogin.rec_id + "'>click here</a>  to record your one-way interview.";
                        Body += "<br/> Once your one-way interview is complete, our HR team will contact you regarding the next steps.";


                        Body += "<br/><br/>";
                       //New logic this
                        // Body += "</td></tr> <tr><td><br/>All the best !<br/>HR Team<br/>" + Session["CompanyName"].ToString() + "<br/>" + Session["useremail"].ToString() + "<br/>  " + emailnoti.email_signature + "<br/> ";
                        Body += "</td></tr> <tr><td><br/><br>"+ emailnoti.email_signature + "<br/> ";
                        Body += "</td> </tr>  </table ></body></html>";

                       SendEmail(Subject, Body, txtemail.Value);
                    }
                }
                catch { }

              //  Response.Redirect("Create_Video_Interview?CandidateId=" + Session["canlogin"] + "");

                divmainnew.Visible = false;
                Div2.Visible = true;
                //   Div1.Visible = false;
                //   Div2.Visible = true;
                //Div3.Visible = false;



                //JobPost.job_title = txtjob_title.Value;
                ////Jpost.c =txtjobdesc.Text;
                //JobPost.job_locations = txtlocation.Value;
                //JobPost.job_rate = txtsalary.Value;
                //JobPost.exprience = txtexperience.Value;
                //JobPost.job_type = ddljobType.SelectedItem.Text;
                //JobPost.job_category = ddlCategory.SelectedItem.Value;
                //JobPost.job_desc = txtjobdesc.Text;
                //JobPost.active = true;

                //context.job_post.Add(Jpost);
                //context.SaveChanges();

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                //getList();

                //clear();
            }
            catch (Exception ex) { }

        }
        private void SendEmail(string subject, string body, string emailto)
        {
         
            //gmail.UseDefaultCredentials = false;
            //gmail.Credentials = new System.Net.NetworkCredential("jobs@extuent.com", "HelloExtuent@?Go");
            //gmail.Host = "smtp.gmail.com";
            //gmail.Port = 587;    //465 this one times out
            //gmail.EnableSsl = true;
            //gmail.Timeout = 120000;

            //mail = new System.Net.Mail.MailMessage();
            //mail.IsBodyHtml = true;

            //mail.From = new System.Net.Mail.MailAddress("jobs@extuent.com");
            //mail.To.Add(emailto);
            ////mail.CC.Add("vijay@extuent.com");
            ////mail.Bcc.Add("abhisheksharma.swv@gmail.com");
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
            mail.To.Add(emailto);

            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            mail.Body = "<html><body>" + body + "</body></html>"; ;
            mail.Subject = subject;
          //  smtp.Send(mail);


        }
        protected void applynow_Click(object sender, EventArgs e)
        {
           // Div1.Visible = false;
           // Div2.Visible = false;
          //  Div3.Visible = true;
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Video_Interview?CandidateId=" + Session["canlogin"] + "");
          //  Response.Redirect("Create_Video_Interview?CandidateId=" + Session["canlogin"] + "");
           
        }

        protected void lnkbutton_Click(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string CheckEmail(string useroremail,string userorjobid)
        {
            string retval = "";
            int jobrecId = Convert.ToInt32(userorjobid);

            db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
            candidate_login usr = new candidate_login();

            usr = context.candidate_login.Where(c => c.email == useroremail && c.job_apply_id == jobrecId && c.active == 1).FirstOrDefault();


          
            
           

            if (usr!=null)
            {
                retval = "true";
            }
            else
            {
                retval = "false";
            }

            return retval;
        }
    }
}