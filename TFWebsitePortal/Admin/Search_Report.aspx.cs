using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using System.Data;
using System.Reflection;

namespace Extuent.Admin
{
    public partial class Search_Report : System.Web.UI.Page
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
        protected List<candidate_experience> canExpList = new List<candidate_experience>();
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
                    if (Request.QueryString["email"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["email"]);


                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (canloginNow != null)
                        {



                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }

                    int employer_login_id_now = Convert.ToInt32(Session["company_recid"]);

                    categoryList = context.categories.Where(c => c.active == true && c.company_rec_id == employer_login_id_now).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select Category");

                    JobpostList = context.job_post.Where(c => c.active == true && c.employer_login_rec_id == employer_login_id_now).ToList();

                    ddlAllJob.DataSource = JobpostList;
                    ddlAllJob.DataValueField = "rec_id";
                    ddlAllJob.DataTextField = "job_title";
                    ddlAllJob.DataBind();

                    ddlAllJob.Items.Insert(0, "Select Job Title");
                }

                getList();
            }
            catch { }

        }
        public void getList()
        {
            string company_recid = "0";
            if (Session["company_recid"] != null)
            {
                company_recid = Convert.ToString(Session["company_recid"]);


                canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id== company_recid).OrderByDescending(c=>c.rec_id).Take(10).ToList();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            searchCandidate();
        }
        public string getJobTypeName(string jobTypeN)
        {
            string categoryName = "";
            try
            {
                int jobType = Convert.ToInt32(jobTypeN);
               
                category = context.categories.Where(c => c.id == jobType).FirstOrDefault();
                if (category != null)
                {
                    categoryName = category.category_name;
                }
            }
            catch { }
            return categoryName;
        }
        public string getJobName(string jobTypeN)
        {
            string categoryName = "";
            try
            {
                int jobName = Convert.ToInt32(jobTypeN);

                categoryName = context.job_post.Where(c => c.rec_id == jobName).FirstOrDefault().job_title.ToString();
              
            }
            catch { }
            return categoryName;
        }
        public void searchCandidate()
        {
            try
            {
                string   company_recid="0";
                if (Session["company_recid"]!=null)
                {
                    company_recid = Convert.ToString(Session["company_recid"]);

                }
                string categoryvalue = ddlCategory.SelectedValue.ToString();

                string dateFrom = date1.Value;
                string dateTo = date2.Value;
                //string jobvalue = ddljobType.SelectedValue.ToString();

                if (dateFrom == "" && dateTo == "" && ddlAllJob.SelectedIndex == 0 && ddlResult.SelectedIndex == 0 && ddlCategory.SelectedIndex == 0 && ddlDescStatus.SelectedIndex == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select atleast one filter for searching records..')", true);
                    return;
                }

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


                if (txtName.Text != "")
                {
                    var customers = from c in context.candidate_login
                                    where c.name.Contains(txtName.Text)
                                    select c;
                    canloginList = customers.Where(c => c.candidate_login_id == company_recid).ToList();


                }
                else if (txtEmail.Text != "")
                {
                    var customers = from c in context.candidate_login
                                    where c.email.Contains(txtEmail.Text)
                                    select c;
                    canloginList = customers.Where(c => c.candidate_login_id == company_recid).ToList();


                }
                else if (txtPhone.Text != "")
                {
                    var customers = from c in context.candidate_login
                                    where c.mobile_no.Contains(txtPhone.Text)
                                    select c;
                    canloginList = customers.Where(c => c.candidate_login_id == company_recid).ToList();


                }
                //All 
                else if (dateFrom != "" && dateTo != "" && ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);

                  
                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == null && c.available_for_job_type == categoryvalue && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == r1 && c.available_for_job_type == categoryvalue && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }



                }
                //All without Date 
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;



                    if (r1 == "Pending")
                    {
                        
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r &&  c.result == null && c.available_for_job_type == categoryvalue).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == r1 && c.available_for_job_type == categoryvalue).ToList();
                    }
                        


                }
                //All 
                else if (dateFrom != "" && dateTo != "" && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                  //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid  && c.status == r && c.result == null && c.available_for_job_type == categoryvalue && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid  && c.status == r && c.result == r1 && c.available_for_job_type == categoryvalue && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }



                }
                //All 
                else if (dateFrom != "" && dateTo != "" && ddlAllJob.SelectedIndex != 0  && ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                   // string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply  && c.result == null && c.available_for_job_type == categoryvalue && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply  && c.result == r1 && c.available_for_job_type == categoryvalue && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }



                }
                //All 
                else if (dateFrom != "" && dateTo != "" && ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0  && ddlDescStatus.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == null  && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == r1  && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }



                }
                //All 
                else if (dateFrom != "" && dateTo != "" && ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == null && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == r1  && (c.doc >= d1 && c.doc <= d2)).ToList();
                    }



                }
                //Application Result,job,category
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.available_for_job_type == categoryvalue).ToList();


                }
                //job,Application result
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r).ToList();

                }
                //Category, job
                else if (ddlAllJob.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {

                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.available_for_job_type == categoryvalue).ToList();

                }
                //Application Result, category
                else if (ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    //int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.available_for_job_type == categoryvalue).ToList();


                }
                //Date, category
                else if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                   

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid  && c.available_for_job_type == categoryvalue && (c.doc >= d1 && c.doc <= d2)).ToList();

                }
                //job, date
                else if (dateFrom != "" && dateTo != "" && ddlAllJob.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid &&  c.job_apply_id == jobapply && (c.doc >= d1 && c.doc <= d2)).ToList();

                }
                //date, Application Result
                else if (dateFrom != "" && dateTo != "" && ddlResult.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.status == r && c.candidate_login_id == company_recid && (c.doc >= d1 && c.doc <= d2)).ToList();
                }
                //date, Decision status
                else if (dateFrom != "" && dateTo != "" && ddlDescStatus.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    string r = ddlDescStatus.SelectedItem.Value;

                    

                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1  && c.result == null && c.candidate_login_id == company_recid && (c.doc >= d1 && c.doc <= d2)).ToList();
                        
                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r && c.candidate_login_id == company_recid && (c.doc >= d1 && c.doc <= d2)).ToList();
                      
                    }
                }
                //category, Decision status 
                else if (ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    
                    string r = ddlDescStatus.SelectedItem.Value;

                    

                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == null && c.candidate_login_id == company_recid && c.available_for_job_type == categoryvalue ).ToList();

                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r && c.candidate_login_id == company_recid && c.available_for_job_type == categoryvalue).ToList();

                    }
                }
                //Job, desion status
                else if (ddlAllJob.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                
                    string r = ddlDescStatus.SelectedItem.Value;
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);

                    
                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == null && c.candidate_login_id == company_recid && c.job_apply_id == jobapply).ToList();

                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r && c.candidate_login_id == company_recid && c.job_apply_id == jobapply).ToList();

                    }
                }
                else if (ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;
                    


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == null).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == r1).ToList();
                    }



                }
                //job
                else if (ddlAllJob.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply).ToList();


                }
                //Application Result
                else if (ddlResult.SelectedIndex != 0)
                {
                    string r = ddlResult.SelectedItem.Value;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.status == r && c.candidate_login_id == company_recid).ToList();


                }
                //Category
                else if (ddlCategory.SelectedIndex != 0)
                {
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue && c.candidate_login_id == company_recid).ToList();
                }
                //decision Status
                else if (ddlDescStatus.SelectedIndex != 0)
                {
                    string r = ddlDescStatus.SelectedItem.Value;
                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.result == null).ToList();
                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.result == r).ToList();
                    }
                    //candidateLoginList = canloginList;

                }
                //date 
                else if (dateFrom != "" && dateTo != "")
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && (c.doc >= d1 && c.doc <= d2)).ToList();
                }
                else
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid).ToList();




                canloginList = canloginList.OrderByDescending(c => c.rec_id).ToList();

            }
            catch { }
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                Session["Type"] = "Report";

                searchCandidate();

                var result = (from a in canloginList

                              select new { Name = a.name + " " + a.last_name,
                                  Email = a.email,
                                  Phone_No = a.mobile_no,
                                  Location = a.location.Replace(',', ' '),

                                  Date = Convert.ToDateTime(a.doc).ToString("dd/MM/yyyy"),
                                  Category = getJobTypeName(a.available_for_job_type),
                                  Applied_Job = a.job_apply_id,
                                  Status_Of_Application = (a.status == "Pending") ? "In Process" : a.status,
                                  Status_Of_Decision = (a.result == null) ? "Pending" : a.result,
                                  Skills = a.hq_skill.Replace(',', ' ').Replace("\n", "").Replace("\r", ""),

                                  Current_Salary = a.total_ctc,
                                  Expected_Salary = a.fixed_ctc,
                                  Availability = a.notice_period,
                                  Pricing = a.salary_for_customer,
                                  Rating = calculaterating(a.rec_id.ToString()),
                                  Comments = a.comment_display,
                                  Profile_Summary = getProfileSummary(a.rec_id.ToString()).Replace(',', '-')

                              }).ToList();

                DataTable dt = ToDataTable(result);
                Session["Report"] = dt;


                if (Session["Report"] != null)
                {
                    Response.Redirect("ExportToExcel.aspx", false);
                }
            }
            catch(Exception ex) { }
        }
        public string getProfileSummary(string rec_id)
        {
            string returnProfileSummary = "";
            int recidforDel = Convert.ToInt32(rec_id);
            canExpList = context.candidate_experience.Where(c => c.candidate_id == recidforDel && c.is_active == true).OrderBy(c => c.id).Take(3).ToList();
            if (canExpList != null)
            {
                for (int l = 0; l <= canExpList.Count - 1; l++)
                {
                    if (canExpList[l].start_date != null && canExpList[l].start_date != "")
                    {
                        if (l == 0)
                        {

                            if (canExpList[l].end_date != null && canExpList[l].end_date != "")
                            {
                                returnProfileSummary += "(" + Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + "-" + canExpList[l].job_title.ToString() + "-" + canExpList[l].company_name.ToString() + ")";


                            }
                            else
                            {
                                returnProfileSummary += "(" + Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "- Till Now" + "-" + canExpList[l].job_title.ToString() + "-" + canExpList[l].company_name.ToString() + ")";



                            }


                        }
                     
                        if (l == 1)
                        {
                            if (canExpList[l].end_date != null && canExpList[l].end_date != "")
                            {
                                returnProfileSummary += "(" + Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + "-" + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString() + ")";
                            }
                        }
                        if (l == 2)
                        {
                            if (canExpList[l].end_date != null && canExpList[l].end_date != "")
                            {
                                returnProfileSummary += "(" + Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + "-" + canExpList[l].job_title.ToString() + "-" + canExpList[l].company_name.ToString() + ")";
                            }
                        }
                    }
                }
            }
            return returnProfileSummary;
        }
        public string calculaterating(string recid)
        {
            string returnrating = "0";
            try
            {


                int recidforDel = Convert.ToInt32(recid);
                canloginNow = context.candidate_login.Where(c => c.active == 1 && c.rec_id == recidforDel).FirstOrDefault();

                if (canloginNow != null)
                {
                    String str = Convert.ToString(canloginNow.rating);
                    int recid1;
                    double calval = 0;
                    Char delimiter = ',';
                    String[] result = str.Split(delimiter);
                    for (int i = 0; i < result.Length; i++)
                    {
                        recid1 = Convert.ToInt32(result[i]);
                        calval = calval + recid1;
                    }

                    calval = calval / 5;

                    returnrating = calval.ToString();

                }
            }
            catch { }

            return returnrating;

        }
        public DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }
    }
}