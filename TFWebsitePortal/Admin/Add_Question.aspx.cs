using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.Admin
{
    public partial class Add_Question : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected add_questions JQuestion = new add_questions();
        protected List<add_questions> QuestionList = new List<add_questions>();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        public List<add_questions> QuestionNew= new List<add_questions>();
        protected List<add_questions> Questions_Category = new List<add_questions>();

        protected video_interview vi = new video_interview();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    int companyRecId = Convert.ToInt32(Session["company_recid"]);
                    categoryList = context.categories.Where(c => c.active == true && c.company_rec_id== companyRecId).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select");

                    

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);
                        JQuestion = context.add_questions.Where(c => c.id == ReqId).FirstOrDefault();
                        vi = context.video_interview.Where(c => c.question_id == ReqId).FirstOrDefault();

                        if (vi != null)
                        {
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not delete this record.')", true);
                            //lblerrormsg.Text=

                            ddlCategory.SelectedValue = JQuestion.cat_id.ToString();
                            ddlCategory_SelectedIndexChanged(sender, e);
                        }
                        else
                        {
                            

                            if (JQuestion != null)
                            {
                                JQuestion.active = false;

                                context.SaveChanges();

                                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Deleted!', 'Question Deleted.');", true);
                                //  Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);


                                ddlCategory.SelectedValue = JQuestion.cat_id.ToString();
                                ddlCategory_SelectedIndexChanged(sender, e);
                            }
                        }
                    }
                    if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                        JQuestion = context.add_questions.Where(c => c.id == ReqId).FirstOrDefault();
                        vi = context.video_interview.Where(c => c.question_id == ReqId).FirstOrDefault();

                        if (vi != null)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Alert!', 'This record is in use, you can not edit this record.');", true);
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not edit this record.')", true);


                            ddlCategory.SelectedValue = JQuestion.cat_id.ToString();
                            ddlCategory_SelectedIndexChanged(sender, e);
                        }
                        else
                        {

                       

                            if (JQuestion != null)
                            {


                                ddlCategory.SelectedValue = JQuestion.cat_id.ToString();

                                // ddlLiveJob.SelectedValue = JQuestion.job_id.ToString();
                                txtquestiondesc.Text = JQuestion.question;

                                btnUpdate.Visible = true;
                                btnAdd.Visible = false;


                                ddlCategory_SelectedIndexChanged(sender, e);
                            }
                        }
                    }

                  




                }

                getList();
            }
            catch(Exception ex) { }
        }
        public string isused(string questionid)
        {
            string ret = "0";
            int ReqId = Convert.ToInt32(questionid);
            JQuestion = context.add_questions.Where(c => c.id == ReqId).FirstOrDefault();
            vi = context.video_interview.Where(c => c.question_id == ReqId).FirstOrDefault();

            if (vi != null)
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('This record is in use, you can not delete this record.')", true);
                //lblerrormsg.Text=
                ret = "1";

            }
            return ret;
        }
        public void getList()
        {
            try {
                int catRec = Convert.ToInt32(ddlCategory.SelectedItem.Value);


                if (ddlLiveJob.SelectedIndex == 0)
                {
                    QuestionList = new List<add_questions>();
                    List<add_questions> lst = new List<add_questions>();

                    
                    lst = context.add_questions.Where(c => c.active == true && c.cat_id == catRec).ToList();
                    foreach (add_questions q in lst)
                    {
                        if (!QuestionList.Exists(p => p.question == q.question))
                        {
                            QuestionList.Add(q);
                        }
                    }
                 


                }
                else
                {
                    int JobRec = Convert.ToInt32(ddlLiveJob.SelectedItem.Value);
                    QuestionList = context.add_questions.Where(c => c.active == true && c.cat_id == catRec && c.job_id == JobRec).ToList();
                }
            }
            catch { }
        }
      
        public void clear()
        {
            txtquestiondesc.Text = "";
          
        }
       

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cat =ddlCategory.SelectedItem.Value;

            JobpostList = context.job_post.Where(c => c.active == true && c.job_category== cat).ToList();

            ddlLiveJob.DataSource = JobpostList;
            ddlLiveJob.DataValueField = "rec_id";
            ddlLiveJob.DataTextField = "job_title";
            ddlLiveJob.DataBind();

            ddlLiveJob.Items.Insert(0, "Select Job Title");

            getList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtquestiondesc.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Question Field must be filled out..')", true);
                    return;
                }
                JQuestion = new add_questions();
                JQuestion.cat_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                //Jpost. =txtjobdesc.Text;
                if (ddlLiveJob.SelectedIndex > 0)
                {
                    JQuestion.job_id = Convert.ToInt32(ddlLiveJob.SelectedItem.Value); 
                }
                JQuestion.question = txtquestiondesc.Text;

                JQuestion.active = true;

                context.add_questions.Add(JQuestion);
                context.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Success!', 'New Question Added to Library.');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Saved')", true);
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
                if (txtquestiondesc.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Question Field must be filled out..')", true);
                    return;
                }

                JQuestion = context.add_questions.Where(c => c.id == ReqId).FirstOrDefault();
                if (JQuestion != null)
                {

                    JQuestion.cat_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                    //Jpost. =txtjobdesc.Text;
                 //   JQuestion.job_id = Convert.ToInt32(ddlLiveJob.SelectedItem.Value); ;
                    JQuestion.question = txtquestiondesc.Text;

                    JQuestion.active = true;


                    context.SaveChanges();


                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Updated!', 'Edits to Question Updated Successfully.');", true);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    getList();

                    clear();

                    btnUpdate.Visible = false;
                    btnAdd.Visible = true;
                }
            }
            catch (Exception ex) { }

        }

        protected void ddlLiveJob_SelectedIndexChanged(object sender, EventArgs e)
        {
            getList();
        }
    }
}