using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent
{
    public partial class Company_signup : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected employer_login employer = new employer_login();
        protected employer_login employercheck = new employer_login();
        protected user_login usr = new user_login();
        protected employer_plan_details empPlanDetails = new employer_plan_details();
        protected employer_payment_history empPaymentHistory = new employer_payment_history();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        public string emailid = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void SendEmail(string subject, string body, string emailto)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            System.Net.Mail.SmtpClient gmail = new System.Net.Mail.SmtpClient();
            gmail.UseDefaultCredentials = false;
            gmail.Credentials = new System.Net.NetworkCredential("support@extuent.ai", "Smart2546@customer");
            gmail.Host = "smtp.gmail.com";
            gmail.Port = 587;    //465 this one times out
            gmail.EnableSsl = true;
            gmail.Timeout = 120000;

            mail = new System.Net.Mail.MailMessage();
            mail.IsBodyHtml = true;

            mail.From = new System.Net.Mail.MailAddress("support@extuent.ai");
            mail.To.Add(emailto);
            //mail.CC.Add("vijay@extuent.com");
            mail.Bcc.Add("abhisheksharma.swv@gmail.com");
            mail.Subject = subject;
            mail.Body = "<html><body>" + body + "</body></html>";
          //  gmail.Send(mail);


        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                string planName = "";
                if (Request.QueryString["p"] != null)
                {
                    planName = Convert.ToString(Request.QueryString["p"]);
                }
                else
                    return;
                //Validation 
                string[] domainName = txtemail.Value.Split('@');
                string domainNamestring = domainName[1];

                employercheck = context.employer_login.Where(c => c.company_domain_url == domainNamestring).FirstOrDefault();
                if (employercheck != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Company already exist..')", true);

                    return;
                }

                employercheck = context.employer_login.Where(c => c.comapny_email == txtemail.Value).FirstOrDefault();
                if (employercheck != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email id already exist..')", true);
                    
                    return;
                }
                employer.company_name = txtCompanyName.Value;
                employer.company_details = txtfullName.Value;
                employer.company_contact_no = txtcontactNumber.Value;
                employer.comapny_email = txtemail.Value;
                employer.login_id = txtemail.Value;
                employer.password = txtpassword.Value;
                employer.company_domain_url = domainNamestring;
                employer.company_logo_url = "./images/logo-text.png";
                employer.doc = DateTime.Now;
                employer.active = false;
                employer.compnay_facebook = planName;//First Time Signup Plan Name 

                context.employer_login.Add(employer);
                context.SaveChanges();

                emailid = txtemail.Value;

                usr.userName= txtemail.Value;
                usr.password= txtpassword.Value;
                usr.Name = txtfullName.Value;
                usr.email = txtemail.Value;
                usr.is_emai_required = 1;
                usr.doc = DateTime.Now;
                usr.role = 2;
                usr.company_recid = employer.rec_id;
                usr.active = false;

                context.user_login.Add(usr);

                context.SaveChanges();

                empPlanDetails = new employer_plan_details();
                empPlanDetails.plan_master_recId = 1;
                empPlanDetails.employer_rec_id = employer.rec_id; 
                empPlanDetails.used_minutes = "0";
                empPlanDetails.doc = DateTime.Now;
                empPlanDetails.active = 1;
                empPlanDetails.is_plan_having_minutes = 1;

                context.employer_plan_details.Add(empPlanDetails);

                context.SaveChanges();

                empPaymentHistory = new employer_payment_history();
                empPaymentHistory.plan_details_recid = empPlanDetails.rec_id;
                empPaymentHistory.employer_recid = employer.rec_id;
                empPaymentHistory.payment_status = "Free";
                empPaymentHistory.paymnet_due = 0;
                empPaymentHistory.payment_date = DateTime.Now;
                empPaymentHistory.paid_amount = 0.00;
                empPaymentHistory.doc = DateTime.Now;
                empPaymentHistory.created_by= employer.rec_id;
                empPaymentHistory.active = 1;
                

                context.employer_payment_history.Add(empPaymentHistory);

                context.SaveChanges();


                


                string Subject = "Extuent AI Sign Up ";
                // send email for verification
               
                string Body = "";
                //Body = Body + " Thank you for choosing Extuent AI. You have successfully completed your sign up. <br/> Please check your email to verify your account..<br/>Please click on this link <a href='https://cognuent.com/candidate-login?vemail=" + txtemail.Value + "'>Verify your email, for login</a> to verify your email address <br><br> Thank You! <br>The Extuent Team";

                Body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Account Verification!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";
                Body += "<tr><td></td></tr> <tr><td> Thank You for choosing Extuent.AI. You are only one step away from transforming your recruitment process and candidate experience. <br/> Please click on this link to <a href='" + URLDisplay + "//login?vemail=" + txtemail.Value + "'>verify your email account.</a> <br> Thank You! <br>The Extuent.ai Team";// Login User Name

                Body += "<br/>Hiring Simplified<br>Interview Streamlined<br> Candidate Experience Transformed";
                Body += "</td></tr> <tr><td><br/><br/><br/>";
                Body += "</td> </tr>  </table ></body></html>";


                
                SendEmail(Subject, Body, txtemail.Value);



                divSuccess.Visible = true;
                mdiv.Visible = false;
               // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);

                txtCompanyName.Value = "";
                txtcontactNumber.Value = "";
                txtemail.Value = "";
                txtfullName.Value = "";
                txtpassword.Value = "";

            }
            catch (Exception ex) { }
        }
    }
}