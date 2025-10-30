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
                    categoryList = context.categories.Where(c => c.active == true).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select Category");

                    JobpostList = context.job_post.Where(c => c.active == true).ToList();

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
            canloginList = context.candidate_login.Where(c => c.active == 1 ).ToList();
          
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
        public void searchCandidate()
        {
            try
            {
                string categoryvalue = ddlCategory.SelectedValue.ToString();

                string dateFrom = date1.Value;
                string dateTo = date2.Value;
                //string jobvalue = ddljobType.SelectedValue.ToString();

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
                    canloginList = customers.ToList();


                }
                else if (txtEmail.Text != "")
                {
                    var customers = from c in context.candidate_login
                                    where c.email.Contains(txtEmail.Text)
                                    select c;
                    canloginList = customers.ToList();


                }
                else if (txtPhone.Text != "")
                {
                    var customers = from c in context.candidate_login
                                    where c.mobile_no.Contains(txtPhone.Text)
                                    select c;
                    canloginList = customers.ToList();


                }
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;
                    
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply && c.result==r && c.available_for_job_type== categoryvalue).ToList();


                }
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 )
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply && c.result == r ).ToList();

                }
                else if (ddlAllJob.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {

                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply &&  c.available_for_job_type == categoryvalue).ToList();

                }
                else if (ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    //int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r && c.available_for_job_type == categoryvalue).ToList();


                }
                else if (ddlAllJob.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply).ToList();


                }
                else if (ddlResult.SelectedIndex != 0)
                {
                    string r = ddlResult.SelectedItem.Text;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r).ToList();


                }
                else if (ddlCategory.SelectedIndex != 0)
                {
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue).ToList();
                }
                else if (dateFrom != "" && dateTo != "")
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2)).ToList();
                }
                else
                    canloginList = context.candidate_login.Where(c => c.active == 1).ToList();
            }
            catch { }
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            Session["Type"] = "Report";

            searchCandidate();

                var result = (from a in canloginList
                              
                              select new { a.name,a.email,a.mobile_no,a.location,a.job_apply_id,a.status,a.result }).ToList();

            DataTable dt = ToDataTable(result);
            Session["Report"] = dt;


            if (Session["Report"] != null)
            {
                Response.Redirect("ExportToExcel.aspx", false);
            }
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