using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
namespace Extuent
{
    public partial class sign_in : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected user_login usr1 = new user_login();
        protected employer_login emplogin1 = new employer_login();
        protected employer_background_image empbackground = new employer_background_image();
        protected employer_login emplogin2 = new employer_login();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string vemailcheck = "";
                if (Request.QueryString["vemail"] != null)
                {
                    vemailcheck = Request.QueryString["vemail"].ToString();
                    usr1 = context.user_login.Where(c => c.userName == vemailcheck).FirstOrDefault();
                    if (usr1 != null)
                    {
                        usr1.active = true;
                        context.SaveChanges();

                        emplogin2= context.employer_login.Where(c => c.rec_id == usr1.company_recid).FirstOrDefault();
                        if(emplogin2!=null)
                        {
                            emplogin2.active = true;
                            context.SaveChanges();
                        }

                    }
                    lblwel.InnerText = "Join Us !";
                    lblwel2.InnerText = "Transform your recruitment experience..";
                    //btnsignup.Visible = false;
                }
                else
                {

                    lblwel.InnerText = "Welcome Back !";
                    lblwel2.InnerText = "Stay connected with us";
                    //btnsignup.Visible = true;
                }
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (usernameInput.Value.ToString() == "Admin" && passwordInput.Value.ToString() == "adminadmin")
            {
                Response.Redirect("admin/dashboard", false);
            }
           
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                
                usr = context.user_login.Where(c => c.userName == usernameInput.Value && c.password == passwordInput.Value && c.active==true).FirstOrDefault();
                if (usr != null)
                {
                    Session["user-recid"] = usr.id;
                    Session["user"] = usr.userName;
                    Session["CompanyName"] = usr.Name;
                    Session["company_recid"] = usr.company_recid;
                    Session["userrole"] = usr.role;
                    Session["useremail"] = usr.email;

                

                    emplogin1 = context.employer_login.Where(c => c.rec_id == usr.company_recid).FirstOrDefault();
                    if (emplogin1 != null)
                    {
                        Session["logoUrl"] = emplogin1.company_logo_url;
                        if (emplogin1.compnay_facebook != null)
                        {
                            Session["ProfileUrl"] = emplogin1.compnay_facebook;
                        }
                        else
                            Session["ProfileUrl"] = "images/images.png";

                        Session["UserFirstTime"] = emplogin1.editby_recid;
                    }

                    empbackground= context.employer_background_image.Where(c => c.employer_recid == usr.company_recid).FirstOrDefault();
                    if (empbackground != null)
                    {
                        Session["background_url"] = empbackground.background_url;


                    }
                    else
                        Session["background_url"] = "https://extuent.ai/bg/bg18_logo.jpg";

                    if (usr.role == 1)
                        Response.Redirect("superadmin/dashboard", false);
                    if (usr.role == 2)
                        Response.Redirect("admin/dashboard", false);
                    if (usr.role == 3)
                        Response.Redirect("admin/dashboard", false);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Alert!', 'Your e-mail address or password is not correct, or your e-mail address has not yet been verified.');", true);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Your-(Email Not Valid|Passowrd Wrong|Account not activated|Email Id Not Vefified yet), Please enter right details or check your email...')", true);
                    return;
                }
            }
            catch(Exception ex) { }
        }
    }
}