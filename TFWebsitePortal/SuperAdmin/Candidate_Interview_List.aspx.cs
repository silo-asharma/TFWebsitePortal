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
    public partial class Candidate_Interview_List : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected job_post JpbpostName = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        protected List<job_post> JobpostList1 = new List<job_post>();
        protected List<job_post> JobpostListCount = new List<job_post>();
        public List<category> categoryList = new List<category>();
        public List<candidate_login> candidateLoginList = new List<candidate_login>();
        public List<video_interview> video_interviewList = new List<video_interview>();

        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        public category category = new category();
        public string degval = "150";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                //v1 = "1448";
                // v2 = "900";
                //  v3 = "241";
                //   v4 = "07";

                if (!IsPostBack)
                {
                    if (Request.QueryString["del"] != null)
                    {
                       int recidforDel = Convert.ToInt32(Request.QueryString["del"]);
                        canloginNow = context.candidate_login.Where(c => c.active == 1 && c.rec_id == recidforDel).FirstOrDefault();

                        if (canloginNow != null)
                        {

                            canloginNow.active = 0;

                            context.SaveChanges();
                           
                        }


                    }


                    if (Request.QueryString["type"]!=null)
                    {


                        int jobtypeval;

                        if (Request.QueryString["type"] == "All")
                        {
                            candidateLoginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c => c.rec_id).Take(8).ToList();
                        }
                        else
                        {
                            jobtypeval= Convert.ToInt32(Request.QueryString["type"]);
                            candidateLoginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id== jobtypeval).OrderByDescending(c => c.rec_id).Take(8).ToList();
                        }


                       // candidateLoginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c=>c.rec_id).Take(4).ToList();
                        //candidateLoginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c => c.rec_id).Take(4).ToList();
                        string All = "";
                        string hired = "";
                        string onhold = "";
                        string rejected = "";
                        string shortlisted = "";
                        try
                        {
                            All = context.candidate_login.Where(c => c.active == 1).ToList().Count().ToString();
                            hired = context.candidate_login.Where(c => c.active == 1 && c.status == "Hired").ToList().Count().ToString();
                            onhold = context.candidate_login.Where(c => c.active == 1 && c.status == "OnHold").ToList().Count().ToString();
                            rejected = context.candidate_login.Where(c => c.active == 1 && c.status == "Rejected").ToList().Count().ToString();
                            shortlisted = context.candidate_login.Where(c => c.active == 1 && c.status == "Shortlisted").ToList().Count().ToString();
                        }
                        catch { }
                        string vall = All + " All " + hired + " Hired " + onhold + " On Hold  " + rejected + " Rejected " + shortlisted + " Shortlisted";
                        headdisplay.Value = vall;

                    }



                   // candidateLoginList = context.candidate_login.Where(c => c.active == 1).ToList();
                    //txtInterview.InnerText = Convert.ToString(candidateLoginList.Count);

                    //candidateLoginList = context.candidate_login.Where(c => c.active == 1 && c.status == "Completed").ToList();
                    // txtCompletedInt.InnerText = Convert.ToString(candidateLoginList.Count);



                    categoryList = context.categories.Where(c => c.active == true).ToList();
                    //   txtcat.InnerText = Convert.ToString(categoryList.Count);

                    JobpostList = context.job_post.Where(c => c.active == true).ToList();
                    JobpostList1 = context.job_post.Where(c => c.active == false).Take(4).ToList();
                    //  txtJob.InnerText = Convert.ToString(JobpostList.Count);


                    categoryList = context.categories.Where(c => c.active == true).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Filter By Category");

                    JobpostList = context.job_post.Where(c => c.active == true).ToList();

                    ddlAllJob.DataSource = JobpostList;
                    ddlAllJob.DataValueField = "rec_id";
                    ddlAllJob.DataTextField = "job_title";
                    ddlAllJob.DataBind();

                    ddlAllJob.Items.Insert(0, "Filter By Job Title");


                   

                }


            }
            catch { }
            //}
        }

        protected void btnSendProfile_Click(object sender, EventArgs e)
        {
            // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id is not configured!..')", true);
            if (hdnCheckRecId.Value != "")
            {

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('"+ hdnCheckRecId.Value + "')", true);

                Response.Redirect("Email-Send?emailhidden=" + hdnCheckRecId.Value + "", true);
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (hdnCheckRecId.Value != "")
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + hdnCheckRecId.Value + "')", true);

                //  Response.Redirect("Email-Send?emailhidden="+ hdnCheckRecId.Value + "", true);
            }
        }
        public void searchCandidate()
        {
            try
            {
                string categoryvalue = ddlCategory.SelectedValue.ToString();

                // string dateFrom = date1.Value;
                // string dateTo = date2.Value;
                //string jobvalue = ddljobType.SelectedValue.ToString();

                //if (dateFrom != "" && dateTo != "")
                //{

                //    if (Convert.ToDateTime(dateFrom) > Convert.ToDateTime(dateTo))
                //    {
                //        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('To Date Must be greater than from From Date..')", true);
                //        return;
                //    }
                //}
                //else if (dateFrom == "" && dateTo != "")
                //{

                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select From Date first..')", true);
                //    return;
                //}
                //else if (dateFrom != "" && dateTo == "")
                //{

                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select To Date first..')", true);
                //    return;
                //}


                //if (txtName.Text != "")
                //{
                //    var customers = from c in context.candidate_login
                //                    where c.name.Contains(txtName.Text)
                //                    select c;
                //    canloginList = customers.ToList();


                //}
                //else if (txtEmail.Text != "")
                //{
                //    var customers = from c in context.candidate_login
                //                    where c.email.Contains(txtEmail.Text)
                //                    select c;
                //    canloginList = customers.ToList();


                //}
                //else if (txtPhone.Text != "")
                //{
                //    var customers = from c in context.candidate_login
                //                    where c.mobile_no.Contains(txtPhone.Text)
                //                    select c;
                //    canloginList = customers.ToList();


                //}
                // else 
                if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply && c.result == r && c.available_for_job_type == categoryvalue).ToList();
                    candidateLoginList = canloginList;

                }
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply && c.result == r).ToList();
                    candidateLoginList = canloginList;
                }
                else if (ddlAllJob.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {

                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply && c.available_for_job_type == categoryvalue).ToList();
                    candidateLoginList = canloginList;
                }
                else if (ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    //int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Text;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r && c.available_for_job_type == categoryvalue).ToList();
                    candidateLoginList = canloginList;

                }
                else if (ddlAllJob.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobapply).ToList();
                    candidateLoginList = canloginList;

                }
                else if (ddlResult.SelectedIndex != 0)
                {
                    string r = ddlResult.SelectedItem.Text;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r).ToList();
                    candidateLoginList = canloginList;

                }
                else if (ddlCategory.SelectedIndex != 0)
                {
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue).ToList();
                    candidateLoginList = canloginList;
                }
                //else if (dateFrom != "" && dateTo != "")
                //{
                //    DateTime d1 = Convert.ToDateTime(dateFrom);
                //    DateTime d2 = Convert.ToDateTime(dateTo);
                //    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2)).ToList();
                //}
                else
                {
                    canloginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c => c.rec_id).Take(8).ToList();
                    candidateLoginList = canloginList;
                }
               
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

                              select new { a.name, a.email, a.mobile_no, a.location, a.job_apply_id, a.status, a.result }).ToList();

                DataTable dt = ToDataTable(result);
                Session["Report"] = dt;


                if (Session["Report"] != null)
                {
                    Response.Redirect("ExportToExcel.aspx", false);
                }
            }
            catch { }
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (hdnCheckRecId.Value != "")
                {
                    bool isResult = false;
                    String str = Convert.ToString(hdnCheckRecId.Value);
                    int recid;
                    Char delimiter = '-';
                    String[] result = str.Split(delimiter);
                    for (int i = 0; i < result.Length; i++)
                    {
                        if (result[i] != "-" && result[i] != null && result[i] != "")
                        {
                            recid = Convert.ToInt32(result[i]);
                            canloginNow = context.candidate_login.Where(c => c.active == 1 && c.rec_id == recid).FirstOrDefault();

                            if (canloginNow != null)
                            {

                                canloginNow.active = 0;

                                context.SaveChanges();
                                isResult = true;
                            }

                            //canloginList.Add(canloginNow);
                        }
                    }

                    if (isResult == true)
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);









                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('"+ hdnCheckRecId.Value + "')", true);

                    Response.Redirect("candidate-interview-list?type=" + Request.QueryString["type"].ToString() + "", true);
                }
            }
            catch { }
            
        }

        public string getJobName(string jobTypeN)
        {
            string job_title = "";
            try
            {
                int jobType = Convert.ToInt32(jobTypeN);
               
                JpbpostName = context.job_post.Where(c => c.rec_id == jobType).FirstOrDefault();
                if (JpbpostName != null)
                {
                    job_title = JpbpostName.job_title;
                }
            }
            catch { }
            return job_title;
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            searchCandidate();
        }
    }
}