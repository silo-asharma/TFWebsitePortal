using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.SuperAdmin
{
    public partial class userprofile : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected user_type usrtype = new user_type();
        protected category cty = new category();
        public List<user_login> usrloginlist = new List<user_login>();
        public List<user_type> usrtypelist = new List<user_type>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    usrtypelist = context.user_type.Where(c => c.active == true).ToList();

                    //ddlRole.DataSource = usrtypelist;
                    //ddlRole.DataValueField = "id";
                    //ddlRole.DataTextField = "user_type_name";
                    //ddlRole.DataBind();

                    //ddlRole.Items.Insert(0, "Select");


                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            usr.active = false;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    if (Session["user-recid"] != null)
                    {
                        int ReqId = Convert.ToInt32(Session["user-recid"]);


                        usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            txtname.Value = usr.Name;
                            txtemail.Value = usr.email;
                            txtpassword.Value = usr.password;
                            txtuserid.Value = usr.userName;
                            if (usr.role != null)
                               txtrole.Value = usr.role.ToString();
                           

                           // btnUpdate.Visible = true;
                            //btnAdd.Visible = false;


                        }
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
            txtemail.Value = "";
            txtname.Value = "";
            txtpassword.Value = "";
            txtuserid.Value = "";


        }



        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Session["user-recid"]);
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
               


                usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();
                if (usr != null)
                {

                    usr.Name = txtname.Value;
                    usr.userName = txtuserid.Value;
                    usr.email = txtemail.Value;
                    usr.password = txtpassword.Value;
                    //usr.role = Convert.ToInt32(ddlRole.SelectedValue);
                    //if (rdoemail.Checked == true)
                    //    usr.is_emai_required = 1;
                    //else
                    //    usr.is_emai_required = 0;

                    usr.active = true;

                    context.SaveChanges();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    getList();

                    clear();

                   // btnUpdate.Visible = false;
                  //  btnAdd.Visible = true;
                }
            }
            catch (Exception ex) { }
        }
    }
}