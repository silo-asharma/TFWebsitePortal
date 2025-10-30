using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.Admin
{
    public partial class Add_Category : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected category cty = new category();
        public List<category> categoryList = new List<category>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try {

                if (!IsPostBack)
                {

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        cty = context.categories.Where(c => c.id == ReqId).FirstOrDefault();

                        if (cty != null)
                        {
                            cty.active = false;

                            context.SaveChanges();

                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Deleted!', 'Category Deleted.');", true);
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    else if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                        cty = context.categories.Where(c => c.id == ReqId).FirstOrDefault();

                        if (cty != null)
                        {


                            txtCat.Text = cty.category_name;

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
            int companyRecId = Convert.ToInt32(Session["company_recid"]);
            categoryList = context.categories.Where(c => c.active == true && c.company_rec_id== companyRecId).ToList();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int companyRecId = Convert.ToInt32(Session["company_recid"]);
                if (txtCat.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Category Field must be filled out..')", true);
                    return;
                }
                cty = new category();
                cty.category_name = txtCat.Text;
                cty.active = true;
                cty.company_rec_id = companyRecId;

                context.categories.Add(cty);
                context.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Success!', 'New Category Added to Library.');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();
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
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Category Field must be filled out..')", true);
                    return;
                }

                cty = context.categories.Where(c => c.id == ReqId).FirstOrDefault();

                if (cty != null)
                {
          
                    cty.category_name = txtCat.Text;
                    cty.active = true;

                  
                    context.SaveChanges();

                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Updated!', 'Edit to Category Updated Successfully.');", true);
                    // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
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