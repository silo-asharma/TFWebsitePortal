using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.SuperAdmin
{
    public partial class Add_Evaluation : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected evaluation JQuestion = new evaluation();
        protected List<evaluation> QuestionList = new List<evaluation>();

        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    categoryList = context.categories.Where(c => c.active == true).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select");

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        JQuestion = context.evaluations.Where(c => c.id == ReqId).FirstOrDefault();

                        if (JQuestion != null)
                        {
                            JQuestion.active = 0;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                        JQuestion = context.evaluations.Where(c => c.id == ReqId).FirstOrDefault();

                        if (JQuestion != null)
                        {


                           // ddlCategory.SelectedValue = JQuestion.cat_id.ToString();
                          //  ddlCategory_SelectedIndexChanged(sender, e);
                          //  ddlLiveJob.SelectedValue = JQuestion.job_id.ToString();
                            txtquestiondesc.Text = JQuestion.evaluation_name;

                            btnUpdate.Visible = true;
                            btnAdd.Visible = false;

                        }
                    }






                }

                getList();
            }
            catch (Exception ex) { }
        }
        public void getList()
        {
            try
            {
               // int catRec = Convert.ToInt32(ddlCategory.SelectedItem.Value);
              //  int JobRec = Convert.ToInt32(ddlLiveJob.SelectedItem.Value);
                QuestionList = context.evaluations.Where(c => c.active == 1).ToList();
            }
            catch { }
        }
        public void clear()
        {
            txtquestiondesc.Text = "";

        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cat = ddlCategory.SelectedItem.Value;

            JobpostList = context.job_post.Where(c => c.active == true && c.job_category == cat).ToList();

            ddlLiveJob.DataSource = JobpostList;
            ddlLiveJob.DataValueField = "rec_id";
            ddlLiveJob.DataTextField = "job_title";
            ddlLiveJob.DataBind();

            getList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                JQuestion = new evaluation();
                //JQuestion.cat_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                //Jpost. =txtjobdesc.Text;
               // JQuestion.job_id = Convert.ToInt32(ddlLiveJob.SelectedItem.Value); ;
                JQuestion.evaluation_name = txtquestiondesc.Text;

                JQuestion.active = 1;

                context.evaluations.Add(JQuestion);
                context.SaveChanges();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();

                clear();
            }
            catch (Exception ex) { }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                JQuestion = context.evaluations.Where(c => c.id == ReqId).FirstOrDefault();
                if (JQuestion != null)
                {

                    //JQuestion.cat_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                    //Jpost. =txtjobdesc.Text;
                    //JQuestion.job_id = Convert.ToInt32(ddlLiveJob.SelectedItem.Value); ;
                    JQuestion.evaluation_name = txtquestiondesc.Text;

                    JQuestion.active = 1;


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