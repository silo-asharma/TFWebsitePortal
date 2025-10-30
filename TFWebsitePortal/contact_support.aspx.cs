using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent
{
    public partial class contact_support : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected employer_login employer = new employer_login();
        protected employer_login employercheck = new employer_login();
        protected user_login usr = new user_login();
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
            mail.To.Add("support@extuent.com");
            //mail.CC.Add("vijay@extuent.com");
            //mail.Bcc.Add("abhisheksharma.swv@gmail.com");
            mail.Subject = subject;
            mail.Body = "<html><body>" + body + "</body></html>";
           // gmail.Send(mail);


        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {


                //employercheck = context.employer_login.Where(c => c.comapny_email == txtemail.Value).FirstOrDefault();
                //if (employercheck != null)
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email id already exist..')", true);

                //    return;
                //}
              

               

              

                string Subject = "Extuent AI Feedback";
                string Body = "Dear Extuent HR Team," + "<br/><br/>";
                Body += "We have received Feedback" + "<br/><br/>";
                Body += "<b>Full Name:</b> " + txtfullName.Value + "<br/>";
                Body += "<b>Contact Number:</b> " + txtcontactNumber.Value + "<br/>";
                Body += "<b>Email:</b> " + txtemail.Value + "<br/>";
                Body += "<b>Details:</b> " + details.Value + "<br/><br/>";
                Body = Body + " Thank you for choosing Extuent AI. <br/><br/>   Thank You! <br>The Extuent Team";

                SendEmail(Subject, Body, txtemail.Value);

                divSuccess.Visible = true;
                mdiv.Visible = false;
                // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);

                
                txtcontactNumber.Value = "";
                txtemail.Value = "";
                txtfullName.Value = "";
                

            }
            catch (Exception ex) { }
        }
    }
}