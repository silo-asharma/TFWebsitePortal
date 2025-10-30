using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;


namespace Extuent.Admin
{
    public partial class Video_Interview_List : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        public category category = new category();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (canloginNow != null)
                        {
                            canloginNow.active = 0;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    categoryList = context.categories.Where(c => c.active == true).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select");
                }

                getList();
            }
            catch { }
        }
        public void getList()
        {
            if (Request.QueryString["category"] != null)
            {
                int jobid = Convert.ToInt32(Request.QueryString["category"]);



                canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id== jobid).OrderByDescending(c => c.rec_id).ToList();

                
            }
            else
                canloginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c=>c.rec_id).ToList();

        }
        public string getJobTypeName(string jobTypeN)
        {
            string categoryName = "";
            if (jobTypeN != null && jobTypeN != "")
            {
                int jobType = Convert.ToInt32(jobTypeN);
                
                category = context.categories.Where(c => c.id == jobType).FirstOrDefault();
                if (category != null)
                {
                    categoryName = category.category_name;
                }
            }
            return categoryName;
        }
        public string getJobName(string jobTName)
        {
            string jobnameNew = "";
            if (jobTName != null && jobTName != "")
            {
                int jobType = Convert.ToInt32(jobTName);
                
                Jpost = context.job_post.Where(c => c.rec_id == jobType).FirstOrDefault();
                if (Jpost != null)
                {
                    jobnameNew = Jpost.job_title;
                }
            }
            return jobnameNew;
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string categoryvalue = ddlCategory.SelectedValue.ToString();
                string dateFrom = date1.Value;
                string dateTo = date2.Value;


                if (dateFrom != "" && dateTo != "")
                {

                    if (Convert.ToDateTime(dateFrom) > Convert.ToDateTime(dateTo))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('To Date Must be greater than from From Date..')", true);
                        return;
                    }
                }
                else if (dateFrom == "" && dateTo != "")
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select From Date first..')", true);
                    return;
                }
                else if (dateFrom != "" && dateTo == "")
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select To Date first..')", true);
                    return;
                }
                if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex != 0 && DropDownList1.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    string status = DropDownList1.SelectedValue;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2) && c.available_for_job_type == categoryvalue && c.status== status).ToList();

                    //string jobvalue = ddljobType.SelectedValue.ToString();
                }
                else if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex == 0 && DropDownList1.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    string status = DropDownList1.SelectedValue;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2)  && c.status == status).ToList();

                    //string jobvalue = ddljobType.SelectedValue.ToString();
                }
                else  if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex == 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2)).ToList();
                }
                else if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex != 0)
                {

                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2) && c.available_for_job_type == categoryvalue).ToList();
                }
                else if (ddlCategory.SelectedIndex != 0 && DropDownList1.SelectedIndex != 0)
                {
                    string status = DropDownList1.SelectedValue;
                  //  string category = ddlCategory.SelectedValue;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue && c.status == status).ToList();

                }
                else if (DropDownList1.SelectedIndex != 0)
                {
                    string status = DropDownList1.SelectedValue;
                 

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.status == status).ToList();

                }
                else
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue).ToList();
            }
            catch(Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('"+ex.Message+"')", true);
                return;
            }
        }
    }
}