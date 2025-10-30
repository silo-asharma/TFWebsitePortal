using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Extuent
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                lblmessage.InnerText = "";
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmailAddress.Value != "")
                {
                    lblmessage.InnerText = "";
                    var URLaddress = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
                    URLaddress = URLaddress + "pricing";

                    string Subject = "Extuent AI – Simplify, Streamline and Transform";

                    string Body = "";

                    Body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Thank You!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";
                    Body += "<tr><td></td></tr> <tr><td> You are one step closer to transforming your recruitment process!  <br/> Our sales representative will get in touch with you soon. <br/>";// 

                    //Body += emailnoti.email_details;

                    Body += "<br/>Not need to give any credit card information, just choose the  <a href='" + URLaddress + "'>plan</a> that works best for you and get started with a 3 Month Free Trial.";

                    Body += "<br/><br/>";
                    Body += "</td></tr> <tr><td><br/>Extuent AI<br/>Hiring Simplified<br/>Interview Streamlined<br/>Candidate Experience Transformed<br/> ";
                    Body += "</td> </tr>  </table ></body></html>";

                    SendEmail(Subject, Body,txtEmailAddress.Value);


                    //------------------Email Send 
                     Subject = "Extuent AI – New Signup";
                    Body = "";

                    Body += "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> New Signup!<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;'></td></tr>";
                    Body += "<tr><td></td></tr> <tr><td> <br/>";// 

                    //Body += emailnoti.email_details;

                    Body += "First Name: "+txtFirstName.Value+" <br/>";
                    Body += "Last Name: " + txtLastName.Value + " <br/>";
                    Body += "Email Address: " + txtEmailAddress.Value + " <br/>";
                    Body += "Company Name: " + txtCompanyName.Value + " <br/>";
                    Body += "Number of Recruiters: " + txtNoofReq.Value + " <br/>";
                    Body += "Average Hiring Requirement Per Month: " + txtAvgHire.Value + " <br/>";
                    Body += "Comments / Questions: " + txtComments.Value + " <br/>";

                    Body += "<br/><br/>";
                    Body += "</td></tr> <tr><td><br/>Extuent AI<br/> ";
                    Body += "</td> </tr>  </table ></body></html>";


                    SendEmail(Subject, Body, "support@extuent.ai");

                    lblmessage.InnerText = "We have recieved your request, Our sales representative will get in touch with you soon.";

                    txtFirstName.Value = "";
                    txtLastName.Value = "";
                    txtEmailAddress.Value="";
                    txtCompanyName.Value = "";
                    txtNoofReq.Value = "";
                    txtAvgHire.Value = "";
                    txtComments.Value = "";
                }
            }
            catch { }

        }
        private void SendEmail(string subject, string body,string toemail)
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
            mail.To.Add(toemail);
            // mail.CC.Add("vijay@extuent.com");
              mail.Bcc.Add("abhishek@extuent.com");
            mail.Subject = subject;
            mail.Body = "<html><body>" + body + "</body></html>";
            gmail.Send(mail);


        }
    }
}