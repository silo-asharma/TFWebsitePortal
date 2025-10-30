using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.Admin
{
    public partial class Add_Evaluation : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected evaluation JQuestion = new evaluation();
        protected List<evaluation> QuestionList = new List<evaluation>();

        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();

        public List<category> categoryListNew = new List<category>();

        public job_post jp = new job_post();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    int companyRecId = Convert.ToInt32(Session["company_recid"]);
                    categoryList = context.categories.Where(c => c.active == true && c.company_rec_id == companyRecId).ToList();

                   

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select");

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);

                        string vijobskills = Request.QueryString["Del"].ToString();

                        JQuestion = context.evaluations.Where(c => c.id == ReqId).FirstOrDefault();
                        jp = context.job_post.Where(c => c.active == true && c.evalauation.Contains(vijobskills)).FirstOrDefault();

                        if (jp != null)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Alert!', 'This record is in use, you can not delete this record.');", true);
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not delete this record.')", true);


                            ddlCategory.SelectedValue = JQuestion.category_id.ToString();
                            ddlCategory_SelectedIndexChanged(sender, e);
                        }
                        else
                        {

                           

                            if (JQuestion != null)
                            {
                                JQuestion.active = 0;

                                context.SaveChanges();

                                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Deleted!', 'Evaluation Criteria Deleted');", true);
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);


                                ddlCategory.SelectedValue = JQuestion.category_id.ToString();
                                ddlCategory_SelectedIndexChanged(sender, e);
                            }
                        }
                    }
                    if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);

                        string vijobskills = Request.QueryString["Edit"].ToString();

                        JQuestion = context.evaluations.Where(c => c.id == ReqId).FirstOrDefault();
                        jp = context.job_post.Where(c => c.active == true && c.evalauation.Contains(vijobskills)).FirstOrDefault();

                        if (jp != null)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Alert!', 'This record is in use, you can not delete this record.');", true);


                            ddlCategory.SelectedValue = JQuestion.category_id.ToString();
                            ddlCategory_SelectedIndexChanged(sender, e);
                        }
                        else
                        {

                           

                            if (JQuestion != null)
                            {


                                ddlCategory.SelectedValue = JQuestion.category_id.ToString();
                                ddlCategory_SelectedIndexChanged(sender, e);
                                //  ddlLiveJob.SelectedValue = JQuestion.job_id.ToString();
                                txtquestiondesc.Text = JQuestion.evaluation_name;

                                btnUpdate.Visible = true;
                                btnAdd.Visible = false;

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
            catch (Exception ex) { }
        }
        public string isused(string questionid)
        {
            string ret = "0";
            int ReqId = Convert.ToInt32(questionid);
            string vijobskills = questionid;

            JQuestion = context.evaluations.Where(c => c.id == ReqId).FirstOrDefault();
            jp = context.job_post.Where(c => c.active == true && c.evalauation.Contains(vijobskills)).FirstOrDefault();

            if (jp != null)
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not delete this record.')", true);
                //lblerrormsg.Text=
                ret = "1";

            }
            return ret;
        }
        public void getList()
        {
            try
            {
                // int catRec = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                //  int JobRec = Convert.ToInt32(ddlLiveJob.SelectedItem.Value);
                int companyRecId = Convert.ToInt32(Session["company_recid"]);
                categoryListNew = context.categories.Where(c => c.active == true && c.company_rec_id == companyRecId).ToList();
                List<int?> _id = new List<int?>();

                foreach (category k in categoryListNew)
                {
                    _id.Add(k.id);
                       
                };

                QuestionList = context.evaluations.Where(c => c.active == 1 && _id.Contains(c.category_id)).ToList();
                
            }
            catch { }
        }
        public void clear()
        {
            txtquestiondesc.Text = "";

        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int cat = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            QuestionList = context.evaluations.Where(c => c.active == 1 && c.category_id == cat).ToList();


            //JobpostList = context.job_post.Where(c => c.active == true && c.job_category == cat).ToList();

            //ddlLiveJob.DataSource = JobpostList;
            //ddlLiveJob.DataValueField = "rec_id";
            //ddlLiveJob.DataTextField = "job_title";
            //ddlLiveJob.DataBind();

            //getList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtquestiondesc.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Evaluation must be filled out..')", true);
                    return;
                }
                JQuestion = new evaluation();
                JQuestion.category_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                //Jpost. =txtjobdesc.Text;
               // JQuestion.job_id = Convert.ToInt32(ddlLiveJob.SelectedItem.Value); ;
                JQuestion.evaluation_name = txtquestiondesc.Text;

                JQuestion.active = 1;

                context.evaluations.Add(JQuestion);
                context.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Success!', 'New Evaluation Criteria Added to Library.');", true);
                // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                ddlCategory_SelectedIndexChanged(sender, e);

                clear();
            }
            catch (Exception ex) { }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                if (txtquestiondesc.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Evaluation must be filled out..')", true);
                    return;
                }

                JQuestion = context.evaluations.Where(c => c.id == ReqId).FirstOrDefault();
                if (JQuestion != null)
                {

                    JQuestion.category_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                    //Jpost. =txtjobdesc.Text;
                    //JQuestion.job_id = Convert.ToInt32(ddlLiveJob.SelectedItem.Value); ;
                    JQuestion.evaluation_name = txtquestiondesc.Text;

                    JQuestion.active = 1;


                    context.SaveChanges();

                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Updated!', 'Edits to Evaluation Criteria Updated Successfully');", true);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    // getList();


                    ddlCategory_SelectedIndexChanged(sender, e);

                    clear();

                    btnUpdate.Visible = false;
                    btnAdd.Visible = true;
                }
            }
            catch (Exception ex) { }

        }
    }
}