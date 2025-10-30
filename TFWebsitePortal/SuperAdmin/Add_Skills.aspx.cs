using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.SuperAdmin
{
    public partial class Add_Skills : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected skills_master cty = new skills_master();
        public List<skills_master> categoryList = new List<skills_master>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        cty = context.skills_master.Where(c => c.id == ReqId).FirstOrDefault();

                        if (cty != null)
                        {
                            cty.active = 0;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    else if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                        cty = context.skills_master.Where(c => c.id == ReqId).FirstOrDefault();

                        if (cty != null)
                        {


                            txtCat.Text = cty.skill_name;

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
            categoryList = context.skills_master.Where(c => c.active == 1).ToList();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                cty = new skills_master();
                cty.skill_name = txtCat.Text;
                cty.active = 1;

                context.skills_master.Add(cty);
                context.SaveChanges();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();
            }
            catch (Exception ex) { }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                cty = context.skills_master.Where(c => c.id == ReqId).FirstOrDefault();

                if (cty != null)
                {

                    cty.skill_name = txtCat.Text;
                    cty.active = 1;


                    context.SaveChanges();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    getList();

                    btnUpdate.Visible = false;
                    btnAdd.Visible = true;

                    txtCat.Text = "";
                }
            }
            catch (Exception ex) { }
        }
    }
}