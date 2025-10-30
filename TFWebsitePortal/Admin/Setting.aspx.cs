using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.Admin
{
    public partial class Setting : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected user_type usrtype = new user_type();
        protected category cty = new category();
        public List<user_login> usrloginlist = new List<user_login>();
        public List<user_type> usrtypelist = new List<user_type>();
        protected employer_login emplogin = new employer_login();
        public email_notification_setting emailnoti = new email_notification_setting();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    usrtypelist = context.user_type.Where(c => c.active == true).ToList();

                    ddlRole.DataSource = usrtypelist;
                    ddlRole.DataValueField = "id";
                    ddlRole.DataTextField = "user_type_name";
                    ddlRole.DataBind();

                    ddlRole.Items.Insert(0, "Select");


                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            usr.active = false;

                            context.SaveChanges();

                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Deleted!', 'User Deleted .');", true);
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                        usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            txtname.Value = usr.Name;
                            txtemail.Value = usr.email;
                            txtpassword.Value = usr.password;
                            txtuserid.Value = usr.userName;
                            txtDesignation.Value = usr.designation;
                            if (usr.role!=null)
                            ddlRole.SelectedValue = Convert.ToString(usr.role);
                            if (usr.is_emai_required == 1)
                                rdoemail.Checked = true;
                            else
                                rdoemail.Checked = false;


                            emplogin = context.employer_login.Where(c => c.rec_id == usr.company_recid).FirstOrDefault();
                            if (emplogin != null)
                            {
                                txtLocation.Value = emplogin.company_location;
                            
                            }


                            btnUpdate.Visible = true;
                            btnAdd.Visible = false;


                        }
                    }

                }

                getList();
            }
            catch { }
        }
        public void getList()
        {
            if (Session["company_recid"] != null)
            {
                int comprecid = Convert.ToInt32(Session["company_recid"]);
                usrloginlist = context.user_login.Where(c => c.active == true && c.company_recid== comprecid).ToList();
            }
            
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtname.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Name must be filled out')", true);
                    return;
                }
                if (txtuserid.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('User Id must be filled out')", true);
                    return;
                }
                if (txtemail.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id must be filled out')", true);
                    return;
                }
                if (txtpassword.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Passowrd  must be filled out')", true);
                    return;
                }
                if (ddlRole.SelectedIndex == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select Role!')", true);
                    return;

                }


                usr = new user_login();
                usr.Name = txtname.Value;
                usr.userName = txtuserid.Value;
                usr.email = txtemail.Value;
                usr.password = txtpassword.Value;
                usr.role = Convert.ToInt32(ddlRole.SelectedValue);
                usr.designation = txtDesignation.Value;
                if (rdoemail.Checked == true)
                    usr.is_emai_required = 1;
                else
                    usr.is_emai_required = 0;

                usr.company_recid = Convert.ToInt32(Session["company_recid"]);

                usr.active = true;

                context.user_login.Add(usr);
                context.SaveChanges();

                emplogin = context.employer_login.Where(c => c.rec_id == usr.company_recid).FirstOrDefault();
                if (emplogin != null)
                {
                    emplogin.company_location = txtLocation.Value;
                    context.SaveChanges();
                }
                //Email send

                emailnoti = context.email_notification_setting.Where(c => c.email_name == "New User").FirstOrDefault();

                string Subject = emailnoti.email_subject;
                string Body = "<html><head></head><body><table style = 'height:auto;width:600px;'> <tr> <td><img src='https://extuent.ai/images/email_logo.png' style ='height:20px;' alt ='Extuent'><span style ='font-family:Calibri;font-size:16px;margin-left:10px;margin-bottom:15px;'> Welcome!, Welcome to Extuent AI !<br></td></tr><tr><td style ='background-color:#fb6502;width:100%;height:2px;'></td></tr>";

                Body += "<tr><td></td></tr> <tr><td> User Name: " + txtuserid.Value + "  <br/> Password: " + txtpassword.Value + " <br/> <br/>";// Login User Name
                Body += "  <br/> <br/><a href='" + URLDisplay + "login'>Click Here</a>  to login. Please reset your password. ";

           
        
                Body += "<br/><a href='"+URLDisplay+"login'>Click Here</a>  to login. Please reset your password. ";

               // Body += emailnoti.email_details;
                Body += "<br/><br/>";
                Body += "</td></tr> <tr><td>";

              
                Body += emailnoti.email_signature;

                Body += "</td> </tr>  </table ></body></html>";

                SendEmailnew(Subject, Body, txtemail.Value);

                //end email send

                clear();
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Success!', 'New User Added.');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();


            }
            catch (Exception ex) { }
        }
        private void SendEmailnew(string subject, string body, string emailto)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            System.Net.Mail.SmtpClient gmail = new System.Net.Mail.SmtpClient();
            gmail.UseDefaultCredentials = false;
            gmail.Credentials = new System.Net.NetworkCredential("Support@extuent.ai", "Smart2546@customer");
            gmail.Host = "smtp.gmail.com";
            gmail.Port = 587;    //465 this one times out
            gmail.EnableSsl = true;
            gmail.Timeout = 120000;

            mail = new System.Net.Mail.MailMessage();
            mail.IsBodyHtml = true;

            mail.From = new System.Net.Mail.MailAddress("support@extuent.ai");
            mail.To.Add(emailto);
            //mail.CC.Add("vijay@extuent.com");
            //mail.Bcc.Add("abhisheksharma.swv@gmail.com");
            mail.Subject = subject;
            mail.Body = "<html><body>" + body + "</body></html>";
           // gmail.Send(mail);


        }

        public void clear()
        {
            txtemail.Value = "";
            txtname.Value = "";
            txtpassword.Value = "";
            txtuserid.Value = "";
            txtLocation.Value = "";

        }

        

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();
                if (usr != null)
                {

                    usr.Name = txtname.Value;
                    usr.userName = txtuserid.Value;
                    usr.email = txtemail.Value;
                    usr.password = txtpassword.Value;
                    usr.role = Convert.ToInt32(ddlRole.SelectedValue);
                    if (rdoemail.Checked == true)
                        usr.is_emai_required = 1;
                    else
                        usr.is_emai_required = 0;

                    usr.active = true;

                    context.SaveChanges();

                    emplogin = context.employer_login.Where(c => c.rec_id == usr.company_recid).FirstOrDefault();
                    if (emplogin != null)
                    {
                        emplogin.company_location = txtLocation.Value;
                        context.SaveChanges();
                    }


                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Updated!', 'Edit to User Profile Updated Successfully.');", true);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    getList();

                    clear();

                    btnUpdate.Visible = false;
                    btnAdd.Visible = true;
                }
            }
            catch (Exception ex) { }
        }
    }
}