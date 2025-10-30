using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.Admin
{
    public partial class Multiple_Candidate_List_For_Client : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected List<candidate_login> canloginList1 = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        public category category = new category();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {

                    if (Request.QueryString["vid"] != null)
                    {
                        String str = Convert.ToString(Request.QueryString["vid"]);
                        int recid;
                        Char delimiter = '-';
                        String[] result = str.Split(delimiter);
                        for (int i = 0; i < result.Length; i++)
                        {
                            if (result[i] != "-" && result[i] != null && result[i] != "")
                            {
                                recid = Convert.ToInt32(result[i]);
                                canloginNow = context.candidate_login.Where(c=>c.active==1 && c.rec_id== recid).FirstOrDefault();
                                canloginList.Add(canloginNow);
                            }
                        }

                   





                    }
                   
                   // categoryList = context.categories.Where(c => c.active == true).ToList();

                   

                  //  JobpostList = context.job_post.Where(c => c.active == true).ToList();

                    //ddlAllJob.DataSource = JobpostList;
                    //ddlAllJob.DataValueField = "rec_id";
                    //ddlAllJob.DataTextField = "job_title";
                    //ddlAllJob.DataBind();
                }

                //getList();
            }
            catch { }
        }
        public void getList()
        {
          //  canloginList = context.candidate_login.Where(c => c.active == 1).ToList();

        }
        public string getJobTypeName(string jobTypeN)
        {
            int jobType = Convert.ToInt32(jobTypeN);
            string categoryName = "";
            category = context.categories.Where(c => c.id == jobType).FirstOrDefault();
            if (category != null)
            {
                categoryName = category.category_name;
            }

            return categoryName;
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
               // string categoryvalue = ddlCategory.SelectedValue.ToString();
                //string jobvalue = ddljobType.SelectedValue.ToString();
                //if (jobvalue != "Job Status")
                //{
                //    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue && c.status == jobvalue).ToList();
                //}
                //else
                //canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue).ToList();
            }
            catch { }
        }
    }
}