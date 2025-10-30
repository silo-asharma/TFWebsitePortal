using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent
{
    public partial class email_notification : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected user_type usrtype = new user_type();
        protected category cty = new category();
        public List<user_login> usrloginlist = new List<user_login>();
        public List<user_type> usrtypelist = new List<user_type>();
        public List<email_notification_setting> emailnotlist = new List<email_notification_setting>();
        public email_notification_setting emailnot = new email_notification_setting();
        public email_notification_setting emailnoti = new email_notification_setting();
        public List<email_notification_setting> emailnotilist = new List<email_notification_setting>();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();

        string FirstSectionBody = "";
        string SecondSectionBody = "";
        string ThirdSectionBody = "";
        string subjectline = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    emailnotlist = context.email_notification_setting.Where(c => c.active == true).ToList();

                    ddlEmailType.DataSource = emailnotlist;
                    ddlEmailType.DataValueField = "rec_id";
                    ddlEmailType.DataTextField = "email_name";
                    ddlEmailType.DataBind();

                    ddlEmailType.Items.Insert(0, "Select Email Type");




                    int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                        usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            //txtname.Value = usr.Name;
                            //txtemail.Value = usr.email;
                            //txtpassword.Value = usr.password;
                            //txtuserid.Value = usr.userName;
                           // if (usr.role != null)
                                //txtrole.Value = usr.role.ToString();


                            // btnUpdate.Visible = true;
                            //btnAdd.Visible = false;


                        }
                    

                }

                getList();
                getEmailDetails();
            }
            catch { }
        }
        public void getList()
        {
            // usrloginlist = context.user_login.Where(c => c.active == true).ToList();
        }

        public void getEmailDetails()
        {

            emailnotilist = context.email_notification_setting.Where(c => c.active==true).ToList();

            if (emailnotilist != null)
            {
                for (int i = 0; i <= emailnotilist.Count - 1; i++)
                {
                    #region"Profile Completion email"
                    if (emailnotilist[i].email_name == "Profile completion Email")
                    {
                        subjectline = "";

                        subjectline += "Email Subject Line: " + emailnotilist[i].email_subject + " <Job Title>|<Company Name>";



                        FirstSectionBody = "";
                        FirstSectionBody += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Congratulations!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";
                        FirstSectionBody += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for the <Job title> position. <br/>";// Login User Name
                        FirstSectionBody += "  <br/> If you have not completed the application process, please <a href='" + URLDisplay + "/Create_Video_Interview?jobid=10&&CandidateId=1' > click here</a>  to record your one-way interview.";




                        FirstSectionBody += "</td></tr> <tr><td>";

                        FirstSectionBody += "</td> </tr>  </table ></body></html>";


                        SecondSectionBody += "<br/> Once your one-way interview is complete, our HR team will contact you regarding the next steps.";
                        SecondSectionBody += "<br/><br/>";


                        ThirdSectionBody = "";
                        ThirdSectionBody = emailnotilist[i].email_signature;

                   

                        profilesubject.InnerHtml = subjectline;
                        profiledetails.InnerHtml = FirstSectionBody;
                        profiledetailsentry.InnerHtml = "<mark>" + SecondSectionBody+ "</mark>";
                        profiledetailsentry.InnerHtml += "<mark>" + ThirdSectionBody+"</mark>";

                        //txtProfileCompletion.Text = SecondSectionBody;
                        //txtPemailsign.Text = ThirdSectionBody;
                    }
                    #endregion
                    #region"Application Completion email"
                    if (emailnotilist[i].email_name == "Interview Submission Email")
                    {
                        subjectline = "";

                        subjectline += "Email Subject Line: " + emailnotilist[i].email_subject + "<Candidate Name> For Job <Job Title> completed successfully ";

                      
                        FirstSectionBody = "";
                        FirstSectionBody += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Congratulations!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";
                        FirstSectionBody += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for the <Job title> position and completing the one-way interview recording. <br/>";// Login User Name
                        FirstSectionBody += "  <br/> ";




                        FirstSectionBody += "</td></tr> <tr><td>";

                        FirstSectionBody += "</td> </tr>  </table ></body></html>";

                        SecondSectionBody = "";
                        SecondSectionBody += "<br/> Our HR team will review your application and contact you regarding the next steps.";
                        SecondSectionBody += "<br/><br/>";


                        ThirdSectionBody = "";
                        ThirdSectionBody = emailnotilist[i].email_signature;



                        Applicationsubject.InnerHtml = subjectline;
                        Applicationdetails.InnerHtml = FirstSectionBody;
                        Applicationdetailsentry.InnerHtml = "<mark>" + SecondSectionBody + "</mark>";
                        Applicationdetailsentry.InnerHtml += "<mark>" + ThirdSectionBody + "</mark>";

                        //txtProfileCompletion.Text = SecondSectionBody;
                        //txtPemailsign.Text = ThirdSectionBody;
                    }
                    #endregion
                    #region"Interview Completion Reminder"
                    if (emailnotilist[i].email_name == "Interview completion Reminder Email")
                    {
                        subjectline = "";

                        subjectline += "Email Subject Line: " + emailnotilist[i].email_subject + " <Job Title>|<Company Name>";



                        FirstSectionBody = "";
                        FirstSectionBody += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Congratulations!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";
                        FirstSectionBody += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for the <Job title> position. <br/>";// Login User Name
                        FirstSectionBody += "  <br/> If you have not completed the application process, please <a href='" + URLDisplay + "/Create_Video_Interview?jobid=10&&CandidateId=1' > click here</a>  to record your one-way interview.";




                        FirstSectionBody += "</td></tr> <tr><td>";

                        FirstSectionBody += "</td> </tr>  </table ></body></html>";

                        SecondSectionBody = "";
                        SecondSectionBody += "<br/> Once your one-way interview is complete, our HR team will contact you regarding the next steps.";
                        SecondSectionBody += "<br/><br/>";


                        ThirdSectionBody = "";
                        ThirdSectionBody = emailnotilist[i].email_signature;



                       // InterviewCompletesubject.InnerHtml = subjectline;
                       // InterviewCompetedetails.InnerHtml = FirstSectionBody;
                       // InterviewCompletedetailsentry.InnerHtml = "<mark>" + SecondSectionBody + "</mark>";
                       // InterviewCompletedetailsentry.InnerHtml += "<mark>" + ThirdSectionBody + "</mark>";

                        //txtProfileCompletion.Text = SecondSectionBody;
                        //txtPemailsign.Text = ThirdSectionBody;
                    }
                    #endregion
                    #region"Share Candidate Profile"
                    if (emailnotilist[i].email_name == "Share Candidate Profile Email")
                    {
                        subjectline = "";

                        subjectline += "Email Subject Line: " + emailnotilist[i].email_subject + " <Job Title>|<Company Name>";



                        FirstSectionBody = "";
                        FirstSectionBody += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Congratulations!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";
                        FirstSectionBody += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for the <Job title> position. <br/>";// Login User Name
                        FirstSectionBody += "  <br/> If you have not completed the application process, please <a href='" + URLDisplay + "/Create_Video_Interview?jobid=10&&CandidateId=1' > click here</a>  to record your one-way interview.";




                        FirstSectionBody += "</td></tr> <tr><td>";

                        FirstSectionBody += "</td> </tr>  </table ></body></html>";

                        SecondSectionBody = "";
                        SecondSectionBody += "<br/> Once your one-way interview is complete, our HR team will contact you regarding the next steps.";
                        SecondSectionBody += "<br/><br/>";


                        ThirdSectionBody = "";
                        ThirdSectionBody = emailnotilist[i].email_signature;



                        Shareprofilesubject.InnerHtml = subjectline;
                        Shareprofiledetails.InnerHtml = FirstSectionBody;
                        Shareprofiledetailsentry.InnerHtml = "<mark>" + SecondSectionBody + "</mark>";
                        Shareprofiledetailsentry.InnerHtml += "<mark>" + ThirdSectionBody + "</mark>";

                        //txtProfileCompletion.Text = SecondSectionBody;
                        //txtPemailsign.Text = ThirdSectionBody;
                    }
                    #endregion
                    #region"Retake Email"
                    if (emailnotilist[i].email_name == "Retake")
                    {
                        subjectline = "";


                       


                        subjectline += "Email Subject Line: " + emailnotilist[i].email_subject + " <Job Title>|<Company Name>";



                        FirstSectionBody = "";
                        FirstSectionBody += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Interview Retake Invite!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";
                        FirstSectionBody += "<tr><td></td></tr> <tr><td> Thank You for submitting your profile for the <Job title> position. <br/>";// Login User Name
                        FirstSectionBody += "  <br/> ";




                        FirstSectionBody += "</td></tr> <tr><td>We have reviewed your interview recording and think that you may be a good fit for the role.<br/>However, we noticed some recording issues and invite you to re-record. Please check your email for detailed feedback and <a href='" + URLDisplay + "/Create_Video_Interview?jobid=1&&CandidateId=1'>click here</a>  to record.";

                        FirstSectionBody += "</td> </tr>  </table ></body></html>";

                        SecondSectionBody = "";
                        SecondSectionBody += "<br/> Once your one-way interview is complete, our HR team will contact you regarding the next steps.";
                        SecondSectionBody += "<br/><br/>";


                        ThirdSectionBody = "";
                        ThirdSectionBody = emailnotilist[i].email_signature;



                        RetakeSubject.InnerHtml = subjectline;
                        Retakedetails.InnerHtml = FirstSectionBody;
                        Retakedetailsentry.InnerHtml = "<mark>" + SecondSectionBody + "</mark>";
                        Retakedetailsentry.InnerHtml += "<mark>" + ThirdSectionBody + "</mark>";

                        //txtProfileCompletion.Text = SecondSectionBody;
                        //txtPemailsign.Text = ThirdSectionBody;
                    }
                    #endregion
                    #region"Share Job Email"
                    if (emailnotilist[i].email_name == "Share Job Details Email")
                    {
                        subjectline = "";

                        


                        subjectline += "Email Subject Line: " + emailnotilist[i].email_subject + "";



                        FirstSectionBody = "";
                        FirstSectionBody += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> New Opening !<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";
                        FirstSectionBody += "<tr><td></td></tr> <tr><td> <a href=" + URLDisplay + "/JobDetails?Ex=1>Click Here</a> to apply for <jobtitle> <br/>";// Login User Name
                        FirstSectionBody += "  <br/> <br/><b>Job Summary</b><br/> <Job Summary>";




                        FirstSectionBody += "</td></tr> <tr><td>";

                        FirstSectionBody += "</td> </tr>  </table ></body></html>";

                        SecondSectionBody = "";
                        SecondSectionBody += "<br/> ";
                        SecondSectionBody += "<br/><br/>";


                        ThirdSectionBody = "";
                        ThirdSectionBody = emailnotilist[i].email_signature;



                        ShareJobSubject.InnerHtml = subjectline;
                        ShareJobdetails.InnerHtml = FirstSectionBody;
                        ShareJobdetailsentry.InnerHtml = "<mark>" + SecondSectionBody + "</mark>";
                        ShareJobdetailsentry.InnerHtml += "<mark>" + ThirdSectionBody + "</mark>";

                        //txtProfileCompletion.Text = SecondSectionBody;
                        //txtPemailsign.Text = ThirdSectionBody;
                    }
                    #endregion
                    #region"New User"
                    if (emailnotilist[i].email_name == "New User")
                    {
                        subjectline = "";

                        subjectline += "Email Subject Line: " + emailnotilist[i].email_subject + "";

                        

                        FirstSectionBody = "";
                        FirstSectionBody += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Welcome!, Welcome to Extuent AI !<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";
                        FirstSectionBody += "<tr><td></td></tr> <tr><td> User Name: <User Name>  <br/> Password: <Password> <br/> <br/>";// Login User Name
                        FirstSectionBody += "  <br/> <br/><a href='" + URLDisplay + "login'>Click Here</a>  to login. Please reset your password. ";




                        FirstSectionBody += "</td></tr> <tr><td>";

                        FirstSectionBody += "</td> </tr>  </table ></body></html>";

                        SecondSectionBody = "";
                        SecondSectionBody += "<br/> ";
                        SecondSectionBody += "<br/><br/>";


                        ThirdSectionBody = "";
                        ThirdSectionBody = emailnotilist[i].email_signature;



                        NewUsersubject.InnerHtml = subjectline;
                        NewUserdetails.InnerHtml = FirstSectionBody;
                        NewUserdetailsentry.InnerHtml = "<mark>" + SecondSectionBody + "</mark>";
                        NewUserdetailsentry.InnerHtml += "<mark>" + ThirdSectionBody + "</mark>";

                        //txtProfileCompletion.Text = SecondSectionBody;
                        //txtPemailsign.Text = ThirdSectionBody;
                    }
                    #endregion
                }
            }
        }


        public void clear()
        {
            //txtemail.Value = "";
            //txtname.Value = "";
            //txtpassword.Value = "";
            //txtuserid.Value = "";


        }



        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            try
            {
               
                



                int ssel = Convert.ToInt32(1);
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {
                
                    //emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;
                    emailnot.email_details = txtProfileCompletion.Text;
                    //emailnot.email_subject = txtemailSubject.Value;
                    //emailnot.email_signature = TextBox1.Text;

                    context.SaveChanges();


                    getEmailDetails();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);


                    // getList();

                    //clear();

                }
            }
            catch (Exception ex) { }
        }

        protected void ddlEmailType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ssel = Convert.ToInt32(ddlEmailType.SelectedValue);
            emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
            if (emailnot != null)
            {
                if (emailnot.rec_id == 4)
                {
                    EmailSendIn.Visible = true;
                }
                else
                {
                    EmailSendIn.Visible = false;
                }
                EmailSendIn.SelectedValue = emailnot.email_duration;
                text.Text = emailnot.email_details;
                txtemailSubject.Value = emailnot.email_subject;
                TextBox1.Text = emailnot.email_signature;
            }
            else
            {
                text.Text = "";
                txtemailSubject.Value = "";
                TextBox1.Text = "";
            }
        }

        protected void btnApplication_Click(object sender, EventArgs e)
        {
            try
            {
                //int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
              
                


                int ssel = 2;
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {
                    
                    //emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;
                    emailnot.email_details = txtApplicationCompletionemail.Text;
                    //emailnot.email_subject = txtemailSubject.Value;
                    //emailnot.email_signature = TextBox1.Text;

                    context.SaveChanges();

                    getEmailDetails();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);

                }
            }
            catch (Exception ex) { }

        }

        protected void btnInterViewComletion_Click(object sender, EventArgs e)
        {
            try
            {
                //int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);




                int ssel = 3;
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {

                   // emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;
                    emailnot.email_details = txtInterview.Text;
                   // emailnot.email_subject = txtemailSubject.Value;
                   // emailnot.email_signature = TextBox1.Text;

                    context.SaveChanges();

                    getEmailDetails();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);

                }
            }
            catch (Exception ex) { }
        }

        protected void btnShareProfile_Click(object sender, EventArgs e)
        {
            try
            {
                //int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);




                int ssel = 4;
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {

                    //emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;
                    emailnot.email_details = txtShare.Text;
                   // emailnot.email_subject = txtemailSubject.Value;
                   // emailnot.email_signature = TextBox1.Text;

                    context.SaveChanges();

                    getEmailDetails();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);

                }
            }
            catch (Exception ex) { }
        }

        protected void btnRetake_Click(object sender, EventArgs e)
        {
            try
            {
                //int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);




                int ssel = 8;
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {

                    //emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;
                    emailnot.email_details = txtRetake.Text;
                   // emailnot.email_subject = txtemailSubject.Value;
                   // emailnot.email_signature = TextBox1.Text;

                    context.SaveChanges();

                    getEmailDetails();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);

                }
            }
            catch (Exception ex) { }
        }

        protected void btnShaeJob_Click(object sender, EventArgs e)
        {
            try
            {
                //int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);




                int ssel = 6;
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {

                   // emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;
                    emailnot.email_details = txtsharejob.Text;
                  //  emailnot.email_subject = txtemailSubject.Value;
                   // emailnot.email_signature = TextBox1.Text;

                    context.SaveChanges();

                    getEmailDetails();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);

                }
            }
            catch (Exception ex) { }
        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            try
            {
                //int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);




                int ssel = 7;
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {

                    //emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;
                    emailnot.email_details = txtNewUser.Text;
                    //emailnot.email_subject = txtemailSubject.Value;
                   // emailnot.email_signature = TextBox1.Text;

                    context.SaveChanges();

                    getEmailDetails();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);

                }
            }
            catch (Exception ex) { }
        }
    }
}