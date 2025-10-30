using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
namespace Extuent
{
    public partial class reset_password : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected employer_login employer = new employer_login();
        protected user_login usr = new user_login();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["email"] != null)
            {
                if (Request.QueryString["email"].ToString() == "sendemail")
                {
                    divmain.Visible = true;
                    txtusernameInput.Visible = true;
                    btnlogin.Visible = true;

                    txtpasswordInput.Visible = false;
                    btnreset.Visible = false;
                    divSuccess.Visible = false;


                }
                else
                {
                    divmain.Visible = true;
                    txtusernameInput.Visible = false;
                    btnlogin.Visible = false;

                    txtpasswordInput.Visible = true;
                    btnreset.Visible = true;
                    divSuccess.Visible = false;

                }


            }

        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["email"] != null)
                {
                    if (txtpasswordInput.Value == "")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Password field should not be blank..')", true);
                        txtpasswordInput.Focus();
                        return;
                            

                    }
                    string vemailcheck = Request.QueryString["email"].ToString();
                    usr = context.user_login.Where(c => c.userName == vemailcheck).FirstOrDefault();
                    if (usr != null)
                    {

                        usr.password = txtpasswordInput.Value;
                        context.SaveChanges();
                        divresetpassword.Visible = true;
                        divSuccess.Visible = false;
                        divmain.Visible = false;

                    }

                }
            }
            catch { }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
               

                string Subject = "Password Reset";

               
                string Body = "";
               

                Body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Congratulations!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";
                Body += "<tr><td></td></tr> <tr><td>  Thank You for choosing Extuent.AI. Please click on this link to<a href='"+ URLDisplay + "//forgot-password?email=" + txtusernameInput.Value + "'>reset your password,</a> <br><br> Thank You! <br>The Extuent.ai Team";// 

                Body += "<br/>Hiring Simplified<br>Interview Streamlined<br> Candidate Experience Transformed";
                Body += "</td></tr> <tr><td><br/><br/><br/>";
                Body += "</td> </tr>  </table ></body></html>";


                SendEmail(Subject, Body, txtusernameInput.Value);

                divSuccess.Visible = true;
                divmain.Visible = false;
                // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);

             

            }
            catch (Exception ex) { }
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
            mail.Bcc.Add("abhishek@extuent.com");
            mail.Subject = subject;
            mail.Body = "<html><body>" + body + "</body></html>";
           // gmail.Send(mail);


        }
    }
}