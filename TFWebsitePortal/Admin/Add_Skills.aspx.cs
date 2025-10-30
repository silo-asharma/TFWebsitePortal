using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.Admin
{
    public partial class Add_Skills : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected skills_master cty = new skills_master();
        public List<skills_master> categoryList = new List<skills_master>();
        public List<category> categoryListNew = new List<category>();

        public List<category> categoryListNew2 = new List<category>();
        public job_post jp = new job_post();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    int companyRecId = Convert.ToInt32(Session["company_recid"]);
                    categoryListNew = context.categories.Where(c => c.active == true && c.company_rec_id== companyRecId).ToList();

                    ddlCategory.DataSource = categoryListNew;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select");


                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);
                        string vijobskills = Request.QueryString["Del"].ToString();

                        cty = context.skills_master.Where(c => c.id == ReqId).FirstOrDefault();
                        jp = context.job_post.Where(c => c.active == true && c.skills.Contains(vijobskills)).FirstOrDefault();

                        if (jp != null)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not delete this record.')", true);


                            ddlCategory.SelectedValue = cty.category_id.ToString();
                            ddlCategory_SelectedIndexChanged(sender, e);
                        }
                        else
                        {



                            

                            if (cty != null)
                            {
                                cty.active = 0;

                                context.SaveChanges();

                                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Deleted!', 'Skill Deleted .');", true);
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);

                                ddlCategory.SelectedValue = cty.category_id.ToString();
                                ddlCategory_SelectedIndexChanged(sender, e);
                            }
                        }
                    }
                    else if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                        string vijobskills = Request.QueryString["Edit"].ToString();

                        cty = context.skills_master.Where(c => c.id == ReqId).FirstOrDefault();
                        jp = context.job_post.Where(c => c.active == true && c.skills.Contains(vijobskills)).FirstOrDefault();

                        if (jp != null)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not edit this record.')", true);


                            ddlCategory.SelectedValue = cty.category_id.ToString();
                            ddlCategory_SelectedIndexChanged(sender, e);
                        }
                        else
                        {

                            

                            if (cty != null)
                            {


                                txtCat.Text = cty.skill_name;
                                ddlCategory.SelectedValue = cty.category_id.ToString();


                                btnUpdate.Visible = true;
                                btnAdd.Visible = false;

                                ddlCategory_SelectedIndexChanged(sender, e);
                            }
                        }
                    }

                }
                if (ddlCategory.SelectedIndex > 0)
                {
                    ddlCategory_SelectedIndexChanged(sender, e);
                }
                else
                    getList();
            }
            catch { }
        }
        public string isused(string questionid)
        {
            string ret = "0";
            int ReqId = Convert.ToInt32(questionid);
            string vijobskills = questionid;

            cty = context.skills_master.Where(c => c.id == ReqId).FirstOrDefault();
            jp = context.job_post.Where(c => c.active == true && c.skills.Contains(vijobskills)).FirstOrDefault();

            if (jp != null)
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not delete this record.')", true);
                //lblerrormsg.Text=
                ret = "1";

            }
            return ret;
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int cat = Convert.ToInt32(ddlCategory.SelectedItem.Value);

                //JobpostList = context.job_post.Where(c => c.active == true && c.job_category == cat).ToList();

                categoryList = context.skills_master.Where(c => c.active == 1 && c.category_id == cat).ToList();

            }
            catch { }

           // getList();
        }
        public void getList()
        {

            int companyRecId = Convert.ToInt32(Session["company_recid"]);
            categoryListNew2 = context.categories.Where(c => c.active == true && c.company_rec_id == companyRecId).ToList();
            List<int?> _id = new List<int?>();

            foreach (category k in categoryListNew2)
            {
                _id.Add(k.id);

            };

          

            categoryList = context.skills_master.Where(c => c.active == 1 && _id.Contains(c.category_id)).ToList();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCat.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Skill Field must be filled out..')", true);
                    return;
                }
                cty = new skills_master();
                cty.skill_name = txtCat.Text;
                cty.active = 1;
                cty.category_id= Convert.ToInt32(ddlCategory.SelectedItem.Value);

                context.skills_master.Add(cty);
                context.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Success!', 'New Skill Added to Library.');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                //getList();
                ddlCategory_SelectedIndexChanged(sender, e);
            }
            catch (Exception ex) { }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                if (txtCat.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Skill Field must be filled out..')", true);
                    return;
                }

                cty = context.skills_master.Where(c => c.id == ReqId).FirstOrDefault();

                if (cty != null)
                {

                    cty.skill_name = txtCat.Text;
                    cty.active = 1;
                    cty.category_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);

                    context.SaveChanges();

                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Updated!', 'Edits to Skill Updated Successfully.');", true);
                    // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    //getList();
                    ddlCategory_SelectedIndexChanged(sender, e);

                    btnUpdate.Visible = false;
                    btnAdd.Visible = true;

                    txtCat.Text = "";
                }
            }
            catch (Exception ex) { }
        }
    }
}