using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.SuperAdmin
{
    public partial class Setting : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected employer_login usr = new employer_login();
        protected user_login usr1 = new user_login();
        protected user_type usrtype = new user_type();
        protected category cty = new category();
        public List<employer_login> usrloginlist = new List<employer_login>();
        public List<user_login> usrloginlist1 = new List<user_login>();
        public List<user_type> usrtypelist = new List<user_type>();
        
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


                        usr = context.employer_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            usr.active = false;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                        usr = context.employer_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            txtname.Value = usr.company_name;
                            txtemail.Value = usr.comapny_email;
                            txtpassword.Value = usr.password;
                            txtuserid.Value = usr.login_id;
                           

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
            usrloginlist = context.employer_login.Where(c => c.active == true).ToList();
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
                //if (ddlRole.SelectedIndex == 0)
                //{
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select Role!')", true);
                //    return;

                //}

                usr1 = new user_login();
                usr = new employer_login();
                usr.company_name = txtname.Value;
                usr.login_id = txtuserid.Value;
                usr.comapny_email = txtemail.Value;
                usr.password = txtpassword.Value;
                //usr.role = Convert.ToInt32(ddlRole.SelectedValue);
                //if (rdoemail.Checked == true)
                //    usr.is_emai_required = 1;
                //else
                //    usr.is_emai_required = 0;

                usr.active = true;

                context.employer_login.Add(usr);
                context.SaveChanges();


                usr1.Name = txtname.Value;
                usr1.userName = txtuserid.Value;
                usr1.email = txtemail.Value;
                usr1.password = txtpassword.Value;
                usr1.role = 2;
                usr1.is_emai_required = 1;
                usr1.active = true;

                context.user_login.Add(usr1);
                context.SaveChanges();


                clear();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();
            }
            catch (Exception ex) { }
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
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                usr = context.employer_login.Where(c => c.rec_id == ReqId).FirstOrDefault();
                if (usr != null)
                {

                    usr.company_name = txtname.Value;
                    usr.login_id = txtuserid.Value;
                    usr.comapny_email = txtemail.Value;
                    usr.password = txtpassword.Value;
                   

                    usr.active = true;

                    usr1 = context.user_login.Where(c => c.company_recid == usr.rec_id).FirstOrDefault();
                    if (usr1 != null)
                    {
                        usr1.Name = txtname.Value;
                        usr1.userName = txtuserid.Value;
                        usr1.email = txtemail.Value;
                        usr1.password = txtpassword.Value;
                    }

                  
                  



                    context.SaveChanges();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
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