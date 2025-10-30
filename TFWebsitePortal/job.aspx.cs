using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent
{
    public partial class job : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected add_questions JQuestion = new add_questions();
        protected List<add_questions> QuestionList = new List<add_questions>();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        public category categoryListName = new category();

        protected job_post JobPost = new job_post();
   
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected candidate_login canlogincheck = new candidate_login();

        protected void Page_Load(object sender, EventArgs e)
        {


            try { 
            if (!IsPostBack)
            {
                   // divdisplay.Visible = false;
                JobpostList = context.job_post.Where(c => c.active == true && c.employer_login_rec_id==3).OrderByDescending(c=>c.rec_id).ToList();
                if (Request.QueryString["id"] != null)
                {
                    int ReqId = Convert.ToInt32(Request.QueryString["id"]);
                    Session["JobID"] = Convert.ToInt32(Request.QueryString["id"]);

                    JobPost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    if (JobPost != null)
                    {
                       // txtjobtitle.InnerText  = JobPost.job_title;
                       //     lblJobType.InnerText = JobPost.job_type;
                         //   jobLocation.InnerText = JobPost.job_locations;
                         //   lblSalary.InnerText = JobPost.job_rate;
                            //lblapplied.InnerText = "Position : " + txtjobtitle.Value;
                          //  txtjobdescription.InnerHtml = JobPost.job_desc;
                        Session["jobcateg"] = JobPost.job_category;
                        Session["ReqId"] = ReqId;
                        int catId = Convert.ToInt32(JobPost.job_category);
                        QuestionList = context.add_questions.Where(c => c.job_id == ReqId && c.cat_id == catId).ToList();

                        string question = "";
                        for (int k = 0; k < QuestionList.Count; k++)
                        {
                            question = question + QuestionList[k].question + ";";

                        }
                           // divdisplay.Visible = true;
                            Session["question"] = question;

                        // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                    }
                }


            }


        }
            catch(Exception ex) { }
}

        protected void applynow_Click(object sender, EventArgs e)
        {
            //Div1.Visible = false;
            // Div2.Visible = false;
            //Div3.Visible = true;
            Response.Redirect("Create_Profile?id=" + Session["JobID"] + "&&page='new'");

        }

        public string getCAtegoryName(string jobTypeN)
        {
            string job_title = "";
            try
            {
                int jobType = Convert.ToInt32(jobTypeN);

                categoryListName = context.categories.Where(c => c.id == jobType).FirstOrDefault();
                if (categoryListName != null)
                {
                    job_title = categoryListName.category_name;
                }
            }
            catch { }
            return job_title;
        }
    }
}