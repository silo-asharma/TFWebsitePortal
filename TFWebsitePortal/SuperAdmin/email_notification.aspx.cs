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
            }
            catch { }
        }
        public void getList()
        {
            // usrloginlist = context.user_login.Where(c => c.active == true).ToList();
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
                //int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                if (EmailSendIn.SelectedValue == "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please Select Email Duration Type')", true);
                    return;
                }
                //if (txtuserid.Value == "")
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('User Id must be filled out')", true);
                //    return;
                //}
                //if (txtemail.Value == "")
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id must be filled out')", true);
                //    return;
                //}
                //if (txtpassword.Value == "")
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Passowrd  must be filled out')", true);
                //    return;
                //}



                int ssel = Convert.ToInt32(ddlEmailType.SelectedValue);
                emailnot = context.email_notification_setting.Where(c => c.rec_id == ssel).FirstOrDefault();
                if (emailnot != null)
                {
                    //usr.Name = txtname.Value;
                    //usr.userName = txtuserid.Value;
                    //usr.email = txtemail.Value;
                    //usr.password = txtpassword.Value;
                    //usr.role = Convert.ToInt32(ddlRole.SelectedValue);
                    //if (rdoemail.Checked == true)
                    //    usr.is_emai_required = 1;
                    //else
                    //    usr.is_emai_required = 0;
                    emailnot.email_duration = EmailSendIn.SelectedValue;
                    emailnot.active = true;

                    context.SaveChanges();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                   // getList();

                    //clear();

                    //btnUpdate.Visible = false;
                    //btnAdd.Visible = true;
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
                EmailSendIn.SelectedValue = emailnot.email_duration;

            }
        }
    }
}