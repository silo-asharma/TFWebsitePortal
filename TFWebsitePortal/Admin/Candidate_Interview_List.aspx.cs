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
        protected job_post JobPost1 = new job_post();
        
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
        public email_notification_setting emailnoti = new email_notification_setting();
        public string degval = "150";
        protected List<candidate_experience> canExpList = new List<candidate_experience>();

        public string ImageDisplay = System.Configuration.ConfigurationManager.AppSettings["ImageDisplay"].ToString();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        public string sval = "";
        public string All = "";
        public string hired = "";
        public string onhold = "";
        public string rejected = "";
        public string pass = "";
        public string In_ProcessAll = "";
        public string PendingAll = "";
        protected candidate_login canloginforemail = new candidate_login();
        video_interview vi = new video_interview();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                //v1 = "1448";
                // v2 = "900";
                //  v3 = "241";
                //   v4 = "07";
                lblalertMessage.Text = "";
                lblalertMessage.ForeColor = System.Drawing.Color.Red;
                if (!IsPostBack)
                {

                    // candidateLoginList = context.candidate_login.Where(c => c.active == 1).ToList();
                    //txtInterview.InnerText = Convert.ToString(candidateLoginList.Count);

                    //candidateLoginList = context.candidate_login.Where(c => c.active == 1 && c.status == "Completed").ToList();
                    // txtCompletedInt.InnerText = Convert.ToString(candidateLoginList.Count);

                    int employer_login_id_now = Convert.ToInt32(Session["company_recid"]);


                    categoryList = context.categories.Where(c => c.active == true && c.company_rec_id== employer_login_id_now).ToList();
                    //   txtcat.InnerText = Convert.ToString(categoryList.Count);

                    JobpostList = context.job_post.Where(c => c.active == true).ToList();
                    JobpostList1 = context.job_post.Where(c => c.active == false).Take(4).ToList();
                    //  txtJob.InnerText = Convert.ToString(JobpostList.Count);


                    categoryList = context.categories.Where(c => c.active == true && c.company_rec_id == employer_login_id_now).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Filter By Category");

                    JobpostList = context.job_post.Where(c => c.active == true && c.employer_login_rec_id== employer_login_id_now).ToList();

                    ddlAllJob.DataSource = JobpostList;
                    ddlAllJob.DataValueField = "rec_id";
                    ddlAllJob.DataTextField = "job_title";
                    ddlAllJob.DataBind();

                    ddlAllJob.Items.Insert(0, "Job Title");





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


                    if (Request.QueryString["type"] != null)
                    {


                        int jobtypeval;
                        string employer_login_id = Convert.ToString(Session["company_recid"]);

                        if (Request.QueryString["type"] == "All")
                        {
                            Session["Backqrystring"] = null;
                            candidateLoginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == employer_login_id).OrderByDescending(c => c.rec_id).ToList();

                          
                        }
                        else if (Request.QueryString["type"] == "Back")
                        {
                            if (Session["lastsearch"] != null)
                            {
                                txtSearch.Text = Session["lastsearch"].ToString();

                                txtSearch_TextChanged(sender, e);

                                if (Request.QueryString["category"] != null)
                                {
                                    ddlCategory.SelectedValue = Convert.ToString(Request.QueryString["category"]);
                                    //ddlCategory_SelectedIndexChanged(sender, e);
                                }
                                if (Request.QueryString["job"] != null)
                                {
                                    ddlAllJob.SelectedValue = Convert.ToString(Request.QueryString["job"]);

                                }
                                if (Request.QueryString["application"] != null)
                                {
                                    ddlResult.SelectedValue = Convert.ToString(Request.QueryString["application"]);

                                }
                                if (Request.QueryString["desc"] != null)
                                {
                                    ddlDescStatus.SelectedValue = Convert.ToString(Request.QueryString["desc"]);

                                }
                                if (Request.QueryString["country"] != null)
                                {
                                    ddlCountry.SelectedValue = Convert.ToString(Request.QueryString["country"]);

                                }
                              

                            }
                            else if (Request.QueryString["Closed"] != null && (Request.QueryString["category"] == null && Request.QueryString["job"] == null && Request.QueryString["application"] == null && Request.QueryString["desc"] == null))
                            {
                                searchCandidate();

                            }
                            else
                            {
                                if (Request.QueryString["category"] != null)
                                {
                                    ddlCategory.SelectedValue = Convert.ToString(Request.QueryString["category"]);
                                    ddlCategory_SelectedIndexChanged(sender, e);
                                }
                                if (Request.QueryString["job"] != null)
                                {
                                    ddlAllJob.SelectedValue = Convert.ToString(Request.QueryString["job"]);

                                }
                                if (Request.QueryString["application"] != null)
                                {
                                    ddlResult.SelectedValue = Convert.ToString(Request.QueryString["application"]);

                                }
                                if (Request.QueryString["desc"] != null)
                                {
                                    ddlDescStatus.SelectedValue = Convert.ToString(Request.QueryString["desc"]);

                                }
                                if (Request.QueryString["country"] != null)
                                {
                                    ddlCountry.SelectedValue = Convert.ToString(Request.QueryString["country"]);

                                }
                                searchCandidate();

                            }

                        }
                        else
                        {
                            jobtypeval = Convert.ToInt32(Request.QueryString["type"]);
                            ddlAllJob.SelectedValue = jobtypeval.ToString();
                            candidateLoginList = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == jobtypeval).OrderByDescending(c => c.rec_id).ToList();
                            //backqueryString();

                            //if (Session["lastsearch"] != null)
                            //{
                            //    txtSearch.Text = Session["lastsearch"].ToString();

                            //    txtSearch_TextChanged(sender, e);



                            //}
                        }


                        // candidateLoginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c=>c.rec_id).Take(4).ToList();
                        //candidateLoginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c => c.rec_id).Take(4).ToList();
                        try
                        {
                            if (Request.QueryString["type"] != "Back")
                            {
                                var customers1 = from c in candidateLoginList
                                                 where c.active == 1
                                                 select c;
                                var customers2 = from c in candidateLoginList
                                                 where c.active == 1 && c.status == "Completed" && c.result == "Hired"
                                                 select c;
                                var customers3 = from c in candidateLoginList
                                                 where c.active == 1 && c.status == "Completed" && c.result == "Hold"
                                                 select c;
                                var customers4 = from c in candidateLoginList
                                                 where c.active == 1 && c.status == "Completed" && c.result == "Reject"
                                                 select c;
                                var customers5 = from c in candidateLoginList
                                                 where c.active == 1 && c.status == "Completed" && c.result == "Pass"
                                                 select c;
                                var customers6 = from c in candidateLoginList
                                                 where c.active == 1 && (c.status == "Pending")
                                                 select c;
                                var customers7 = from c in candidateLoginList
                                                 where c.active == 1 && (c.status == "Completed") && (c.result == "" || c.result == null)
                                                 select c;

                                All = customers1.ToList().Count().ToString();
                                hired = customers2.ToList().Count().ToString();
                                onhold = customers3.ToList().Count().ToString();
                                rejected = customers4.ToList().Count().ToString();
                                pass = customers5.ToList().Count().ToString();
                                In_ProcessAll = customers6.ToList().Count().ToString();
                                PendingAll = customers7.ToList().Count().ToString();
                            }
                        }
                        catch { }
                        //try
                        //{
                        //    All = context.candidate_login.Where(c => c.active == 1).ToList().Count().ToString();
                        //    hired = context.candidate_login.Where(c => c.active == 1 && c.result == "Hired").ToList().Count().ToString();
                        //    onhold = context.candidate_login.Where(c => c.active == 1 && c.result == "Hold").ToList().Count().ToString();
                        //    rejected = context.candidate_login.Where(c => c.active == 1 && c.result == "Reject").ToList().Count().ToString();
                        //    pass = context.candidate_login.Where(c => c.active == 1 && c.result == "Pass").ToList().Count().ToString();
                        //}
                        //catch { }
                        //string vall = All + " All, " + hired + " Hired, " + onhold + " On Hold,  " + rejected + " Rejected, " + shortlisted + " Shortlisted";
                        //sval = vall;

                    }






                    if (Request.QueryString["type"] != "Back")
                        getFinalListAfter();
                }
                else
                {
                    if (txtSearch.Text != "")
                    {
                        spanPage.InnerText = "1";
                        txtSearch_TextChanged(sender, e);
                    }
                    else
                    {
                        Session["lastsearch"] = null;
                        
                        searchCandidate();
                    }
                }

                //Session["lastsearch"] = null;
               
            }
            catch { }
            //}
        }

        protected void btnSendProfile_Click(object sender, EventArgs e)
        {
            // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id is not configured!..')", true);
            if (hdnCheckRecId.Value != "")
            {

                //
                
                    string[] Multiple = hdnCheckRecId.Value.Split('-');
                    int countVideo = 0;
                    string cName = "";
                    foreach (string multiple_email in Multiple)
                    {
                        if (multiple_email != "" && multiple_email != "on")
                        {
                            int ReqId = Convert.ToInt32(multiple_email);
                            bool returnval=getVideoConverstion(ReqId);
                            if (returnval == false)
                            {
                            var CandidateName = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();
                            if (CandidateName != null)
                            {
                                 cName = cName+CandidateName.name + " " + CandidateName.last_name + ", ";
                               
                                countVideo = countVideo + 1;
                                //return;
                            }
                           }
                        }
                    }
                if (countVideo == 0)
                {
                    string returnquery = backqueryString();
                    Response.Redirect("Email-Send?emailhidden=" + hdnCheckRecId.Value + "" + returnquery + "", true);
                }
                else
                    lblalertMessage.Text = "Some recordings are not available for sharing. Kindly check the share indicator.";
                //lblalertMessage.Text = "You can't share the video of " + cName + ", Please uncheck first.";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "')", true);
       
            }
            else
            {
                lblalertMessage.Text = "Please Select Interview First..";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please Select Interview First..')", true);
                Button2_Click(sender, e);
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
                string company_recid = "0";
                if (Session["company_recid"] != null)
                {
                    company_recid = Convert.ToString(Session["company_recid"]);

                }
                string comprecid = Convert.ToString(Session["company_recid"]);
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

                //All without Date 
                //if (ddlAllJob.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0 && ddlCountry.SelectedIndex != 0)
                //{
                //    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Value;
                //    string countryName = ddlCountry.SelectedItem.Value;
                //    string r1 = ddlDescStatus.SelectedItem.Value;


                //    if (r1 == "Pending")
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == "Completed" && c.result == null && (c.location.Contains(countryName)) && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                //    }
                //    else
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == r1 && (c.location.Contains(countryName)) && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                //    }
                //    candidateLoginList = canloginList;


                //}
                //else 
                if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;



                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == null && c.status == "Completed" && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.result == r1 && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    }

                    candidateLoginList = canloginList;

                }
                //else if (ddlAllJob.SelectedIndex != 0  && ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0 && ddlCountry.SelectedIndex != 0)
                //{
                //    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Value;
                //    string countryName = ddlCountry.SelectedItem.Value;
                //    string r1 = ddlDescStatus.SelectedItem.Value;


                //    if (r1 == "Pending")
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == "Completed" && c.result == null && (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                //    }
                //    else
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply &&  c.status == r && c.result == r1 && (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                //    }
                //    candidateLoginList = canloginList;


                //}
                //All 
                else if (ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == "Completed" && c.result == null && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == r1 && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    }
                    candidateLoginList = canloginList;


                }
                //All 
                else if (ddlAllJob.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    // string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.result == null && c.status == "Completed" && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.result == r1 && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    }
                    candidateLoginList = canloginList;


                }
                //new update
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;


                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.result == null && c.status == "Completed").OrderByDescending(c => c.rec_id).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.result == r1 && c.status == r).OrderByDescending(c => c.rec_id).ToList();
                    }
                    candidateLoginList = canloginList;


                }

                //All 
                //else if (ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0 && ddlCountry.SelectedIndex != 0)
                //{
                //    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Value;
                //    string countryName = ddlCountry.SelectedItem.Value;
                //    string r1 = ddlDescStatus.SelectedItem.Value;


                //    if (r1 == "Pending")
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == "Completed" && c.result == null && (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                //    }
                //    else
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == r1 && (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                //    }
                //    candidateLoginList = canloginList;


                //}
                //Application Result,job,category
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;

                }
                else if (ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;



                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == "Completed" && c.result == null).OrderByDescending(c => c.rec_id).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == r1).OrderByDescending(c => c.rec_id).ToList();
                    }

                    candidateLoginList = canloginList;

                }
                //job,Application result
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;
                }
                //Category, job
                else if (ddlAllJob.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {

                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;
                }
                //Application Result, category
                else if (ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    //int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;

                }



                //date, Decision status

                //category, Decision status 
                else if (ddlCategory.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {

                    string r = ddlDescStatus.SelectedItem.Value;



                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == null && c.status == "Completed" && c.candidate_login_id == company_recid && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();

                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r && c.candidate_login_id == company_recid && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();

                    }
                    candidateLoginList = canloginList;
                }
                //Job, desion status
                else if (ddlAllJob.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {

                    string r = ddlDescStatus.SelectedItem.Value;
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);


                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == null && c.status == "Completed" && c.candidate_login_id == company_recid && c.job_apply_id == jobapply).OrderByDescending(c => c.rec_id).ToList();

                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.result == r && c.candidate_login_id == company_recid && c.job_apply_id == jobapply).OrderByDescending(c => c.rec_id).ToList();

                    }
                    candidateLoginList = canloginList;
                }
                else if (ddlResult.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                {
                    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    string r1 = ddlDescStatus.SelectedItem.Value;



                    if (r1 == "Pending")
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == "Completed" && c.result == null).OrderByDescending(c => c.rec_id).ToList();
                    }
                    else
                    {

                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && c.result == r1).OrderByDescending(c => c.rec_id).ToList();
                    }

                    candidateLoginList = canloginList;

                }
                // With Country
                //else if (ddlResult.SelectedIndex != 0 && ddlCountry.SelectedIndex != 0)
                //{
                //    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Value;

                //    string countryName = ddlCountry.SelectedItem.Value; ;


                //    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == r && (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                    

                //    candidateLoginList = canloginList;

                //}
                //else if (ddlCountry.SelectedIndex != 0 && ddlDescStatus.SelectedIndex != 0)
                //{
                //    //  int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string countryName = ddlCountry.SelectedItem.Value; ;

                //    string r1 = ddlDescStatus.SelectedItem.Value;



                //    if (r1 == "Pending")
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.status == "Completed" && c.result == null && (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                //    }
                //    else
                //    {

                //        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && (c.location.Contains(countryName)) && c.result == r1).OrderByDescending(c => c.rec_id).ToList();
                //    }

                //    candidateLoginList = canloginList;

                //}
                //job
                else if (ddlAllJob.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;

                }
                //Application Result
                else if (ddlResult.SelectedIndex != 0)
                {
                    string r = ddlResult.SelectedItem.Value;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.status == r && c.candidate_login_id == company_recid).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;

                }
                //Category
                else if (ddlCategory.SelectedIndex != 0)
                {
                    if (ddlCategory.SelectedValue == "45")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.is_approved == 1).OrderByDescending(c => c.rec_id).ToList();
                        candidateLoginList = canloginList;
                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue && c.candidate_login_id == company_recid).OrderByDescending(c => c.rec_id).ToList();
                        candidateLoginList = canloginList;
                    }
                   
                }
                //decision Status
                else if (ddlDescStatus.SelectedIndex != 0)
                {
                    string r = ddlDescStatus.SelectedItem.Value;
                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.result == null && c.status == "Completed").OrderByDescending(c => c.rec_id).ToList();
                        candidateLoginList = canloginList;
                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.result == r).OrderByDescending(c => c.rec_id).ToList();
                        candidateLoginList = canloginList;
                    }
                    //candidateLoginList = canloginList;
                    candidateLoginList = canloginList;
                }






                //if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                //{
                //    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Text;

                //    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id== comprecid && c.job_apply_id == jobapply && c.result == r && c.available_for_job_type == categoryvalue).ToList();
                //    candidateLoginList = canloginList;

                //}
                //else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0)
                //{
                //    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Text;

                //    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.job_apply_id == jobapply && c.result == r).ToList();
                //    candidateLoginList = canloginList;
                //}
                //else if (ddlAllJob.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                //{

                //    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Text;

                //    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.job_apply_id == jobapply && c.available_for_job_type == categoryvalue).ToList();
                //    candidateLoginList = canloginList;
                //}
                //else if (ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                //{
                //    //int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                //    string r = ddlResult.SelectedItem.Text;

                //    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.result == r && c.available_for_job_type == categoryvalue).ToList();
                //    candidateLoginList = canloginList;

                //}
                else if (ddlAllJob.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.job_apply_id == jobapply).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;

                }
                else if (ddlResult.SelectedIndex != 0)
                {
                    string r = ddlResult.SelectedItem.Value;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.status == r).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;

                }
                else if (ddlCategory.SelectedIndex != 0)
                {
                    
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
                        candidateLoginList = canloginList;
                    
                }
                else if (ddlDescStatus.SelectedIndex != 0)
                {
                    string r = ddlDescStatus.SelectedItem.Value;
                    if (r == "Pending")
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.result == null && c.status == "Completed").OrderByDescending(c => c.rec_id).ToList();
                    }
                    else
                    {
                        canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.result == r).OrderByDescending(c => c.rec_id).ToList();
                    }
                    candidateLoginList = canloginList;

                }
                //else if (ddlCountry.SelectedIndex != 0)
                //{
                //    string countryName = ddlCountry.SelectedItem.Value;
                //    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                //    candidateLoginList = canloginList;
                //}
                //else if (dateFrom != "" && dateTo != "")
                //{
                //    DateTime d1 = Convert.ToDateTime(dateFrom);
                //    DateTime d2 = Convert.ToDateTime(dateTo);
                //    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2)).ToList();
                //}
                else if (Request.QueryString["Closed"] != null)//closed Job
                {
                    int closedRecId = Convert.ToInt32(Request.QueryString["Closed"]);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid && c.job_apply_id == closedRecId).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;
                }

                else
                {
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == comprecid).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;
                }

                if (ddlCountry.SelectedIndex != 0)
                {
                    string countryName = ddlCountry.SelectedItem.Value;
                    canloginList = canloginList.Where(c =>(c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;
                }

                try
                {
                    var customers1 = from c in candidateLoginList
                                     where c.active==1
                                    select c;
                    var customers2 = from c in candidateLoginList
                                     where c.active == 1 && c.status == "Completed" && c.result == "Hired"
                                     select c;
                    var customers3 = from c in candidateLoginList
                                     where c.active == 1 && c.status == "Completed" && c.result == "Hold"
                                     select c;
                    var customers4 = from c in candidateLoginList
                                     where c.active == 1 && c.status == "Completed" && c.result == "Reject"
                                     select c;
                    var customers5 = from c in candidateLoginList
                                     where c.active == 1 && c.status == "Completed" && c.result == "Pass"
                                     select c;
                    var customers6 = from c in candidateLoginList
                                     where c.active == 1 && (c.status == "Pending")
                                     select c;
                    var customers7 = from c in candidateLoginList
                                     where c.active == 1 && (c.status == "Completed") && (c.result == "" || c.result == null)
                                     select c;

                    All = customers1.ToList().Count().ToString();
                    hired = customers2.ToList().Count().ToString();
                    onhold = customers3.ToList().Count().ToString();
                    rejected = customers4.ToList().Count().ToString();
                    pass = customers5.ToList().Count().ToString();
                    In_ProcessAll = customers6.ToList().Count().ToString();
                    PendingAll = customers7.ToList().Count().ToString();

                    getFinalListAfter();
                    //candidateLoginList
                    

                }
                catch { }


               // backqueryString();

            }
            catch { }
        }
        public string backqueryString()
        {
            string retQry = "";
            try
            {


                string qrystring = "";
                if (ddlCategory.SelectedIndex != 0)
                {
                    qrystring = "&&category=" + ddlCategory.SelectedValue;
                }
                if (ddlAllJob.SelectedIndex != 0)
                {
                    qrystring += "&&job=" + ddlAllJob.SelectedValue;
                }
                if (ddlResult.SelectedIndex != 0)
                {
                    qrystring += "&&application=" + ddlResult.SelectedValue;
                }
                if (ddlDescStatus.SelectedIndex != 0)
                {
                    qrystring += "&&desc=" + ddlDescStatus.SelectedValue;
                }
                if (ddlCountry.SelectedIndex != 0)
                {
                    qrystring += "&&country=" + ddlCountry.SelectedValue;
                }
                if (txtSearch.Text != "")
                {
                    qrystring += "&&textSearch=" + txtSearch.Text;
                }

                if (Request.QueryString["Closed"] != null)
                {
                    qrystring += "&&Closed=" + Request.QueryString["Closed"].ToString();
                }

                Session["Backqrystring"] = qrystring;
                retQry = qrystring;
            }
            catch { }

            return retQry;
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
        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                Session["Type"] = "Report";

                searchCandidate();

                var result = (from a in canloginList

                              select new
                              {
                                  Name = a.name + " " + a.last_name,
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
                        if (result[i] != "-" && result[i] != null && result[i] != "" && result[i] != "on")
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
                   string returnquery = backqueryString();
                    Response.Redirect("candidate-interview-list?type=Back" + returnquery + "", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please Select Interview First..')", true);
                    Button2_Click(sender, e);
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
                    if (str != null)
                    {
                        String[] result = str.Split(delimiter);
                        for (int i = 0; i < result.Length; i++)
                        {
                            recid1 = Convert.ToInt32(result[i]);
                            calval = calval + recid1;
                        }

                        calval = calval / 5;
                    }
                    returnrating = calval.ToString();

                }
            }
            catch { }

            return returnrating;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["lastsearch"] = null;
            txtSearch.Text = "";

            spanPage.InnerText = "1";
            searchCandidate();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text != "")
                {
                    string employer_login_id = Convert.ToString(Session["company_recid"]);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == employer_login_id && (c.name.Contains(txtSearch.Text) || c.mobile_no.Contains(txtSearch.Text) || c.result.Contains(txtSearch.Text) || c.email.Contains(txtSearch.Text) || c.last_name.Contains(txtSearch.Text))).OrderByDescending(c => c.rec_id).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;
                    try
                    {
                        var customers1 = from c in candidateLoginList
                                         where c.active == 1
                                         select c;
                        var customers2 = from c in candidateLoginList
                                         where c.active == 1 && c.status == "Completed" && c.result == "Hired"
                                         select c;
                        var customers3 = from c in candidateLoginList
                                         where c.active == 1 && c.status == "Completed" && c.result == "Hold"
                                         select c;
                        var customers4 = from c in candidateLoginList
                                         where c.active == 1 && c.status == "Completed" && c.result == "Reject"
                                         select c;
                        var customers5 = from c in candidateLoginList
                                         where c.active == 1 && c.status == "Completed" && c.result == "Pass"
                                         select c;
                        var customers6 = from c in candidateLoginList
                                         where c.active == 1 && (c.status == "Pending")
                                         select c;
                        var customers7 = from c in candidateLoginList
                                         where c.active == 1 && (c.status == "Completed") && (c.result == "" || c.result == null)
                                         select c;


                        All = customers1.ToList().Count().ToString();
                        hired = customers2.ToList().Count().ToString();
                        onhold = customers3.ToList().Count().ToString();
                        rejected = customers4.ToList().Count().ToString();
                        pass = customers5.ToList().Count().ToString();
                        In_ProcessAll = customers6.ToList().Count().ToString();
                        PendingAll = customers7.ToList().Count().ToString();

                        Session["lastsearch"] = txtSearch.Text;

                        spanPage.InnerText = "1";

                        getFinalListAfter();

                    }
                    catch { }
                }
            }
            catch { }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["lastsearch"] = null;
                txtSearch.Text = "";

                if (ddlCategory.SelectedIndex == 0)
                {
                    JobpostList = context.job_post.Where(c => c.active == true).ToList();

                    if (JobpostList != null)
                    {
                        ddlAllJob.DataSource = JobpostList;
                        ddlAllJob.DataValueField = "rec_id";
                        ddlAllJob.DataTextField = "job_title";
                        ddlAllJob.DataBind();

                        ddlAllJob.Items.Insert(0, "Job Title");
                    }

                }

                else
                {
                    string ddlcatrec = ddlCategory.SelectedValue;

                    JobpostList = context.job_post.Where(c => c.active == true && c.job_category == ddlcatrec).ToList();

                    if (JobpostList != null)
                    {
                        ddlAllJob.DataSource = JobpostList;
                        ddlAllJob.DataValueField = "rec_id";
                        ddlAllJob.DataTextField = "job_title";
                        ddlAllJob.DataBind();

                        ddlAllJob.Items.Insert(0, "Job Title");
                    }
                    else
                    {
                        ddlAllJob.DataSource = null;
                        ddlAllJob.DataBind();

                        ddlAllJob.Items.Insert(0, "Job Title");
                    }
                }
                searchCandidate();
            }
            catch { }
        }
        private void SendEmailnew(string subject, string body, string emailto)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            System.Net.Mail.SmtpClient gmail = new System.Net.Mail.SmtpClient();
            gmail.UseDefaultCredentials = false;
            gmail.Credentials = new System.Net.NetworkCredential("jobs@extuent.ai", "Smart3022@Interview");
            gmail.Host = "smtp.gmail.com";
            gmail.Port = 587;    //465 this one times out
            gmail.EnableSsl = true;
            gmail.Timeout = 120000;

            mail = new System.Net.Mail.MailMessage();
            mail.IsBodyHtml = true;

            mail.From = new System.Net.Mail.MailAddress("jobs@extuent.ai");
            mail.To.Add(emailto);
            //mail.CC.Add("vijay@extuent.com");
            //mail.Bcc.Add("abhisheksharma.swv@gmail.com");
            mail.Subject = subject;
            mail.Body = "<html><body>" + body + "</body></html>";
            //gmail.Send(mail);


        }
        protected void Button2_Click1(object sender, EventArgs e)
        {
            
            // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id is not configured!..')", true);
            if (hdnCheckRecId.Value != "")
            {

                string[] Multiple = hdnCheckRecId.Value.Split('-');
                foreach (string multiple_email in Multiple)
                {
                    if (multiple_email != "" && multiple_email != "on")
                    {
                        int ReqId = Convert.ToInt32(multiple_email);

                        canloginforemail = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();
                        if (canloginforemail != null)
                        {
                            JobPost1 = context.job_post.Where(c => c.rec_id == canloginforemail.job_apply_id).FirstOrDefault();
                            //Profile completion Email
                            emailnoti = context.email_notification_setting.Where(c => c.email_name == "Interview completion Reminder Email").FirstOrDefault();

                            string Subject = emailnoti.email_subject;
                            string Body = "Congratulations!,<br/><br/>Thank You for submitting your profile for the " + JobPost1.job_title + " position <br/>";
                            Body += emailnoti.email_details;
                            Body += "<br/><a href='"+URLDisplay+"/Create_Video_Interview?jobid=" + canloginforemail.job_apply_id + "&&CandidateId=" + canloginforemail.rec_id + "'>Click Here for Video Interview</a> to complete recording your one-way interview for the " + JobPost1.job_title + " position. <br/> Once your one-way interview is completed, our HR team will get in touch with you regarding the next steps.";
                            Body += "<br/><br/>";
                            Body += emailnoti.email_signature;


                            SendEmailnew(Subject, Body, canloginforemail.email);

                            lblalertMessage.ForeColor = System.Drawing.Color.Green;
                            lblalertMessage.Text = "Email sent successfully";
                        }
                    }
                }
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('"+ hdnCheckRecId.Value + "')", true);

               // Response.Redirect("Email-Send?emailhiddenForCandidate=" + hdnCheckRecId.Value + "", true);
            }
            else
            {
                lblalertMessage.Text = "Please Select Interview First..";
                //  Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please Select Candidate First..')", true);
                Button2_Click(sender, e);
            }
        }
        public bool getVideoConverstion(int candidateRecId)
        {
            bool isVideoConverted = false;
            try {
                var count = context.video_interview.Where(c => c.candidate_id == candidateRecId && c.is_email_send == 1).ToList().Count();
                if (count > 0)
                    isVideoConverted = true;
            }
            catch { }
            return isVideoConverted;
        }
        public void getFinalListAfter()
        {
            try
            {
               
                SpanTotalPage.InnerText = All;

                int page = Convert.ToInt32(spanPage.InnerText);
                int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["pageView"].ToString());
                int skipRows = (page - 1) * pageSize;

                candidateLoginList = candidateLoginList.Skip(skipRows).Take(pageSize).ToList();

                spanpageSize.InnerText = Convert.ToString(candidateLoginList.Count());

                spanStartVal.InnerText = Convert.ToString(skipRows + 1);
                spanLastVal.InnerText = Convert.ToString(skipRows  + candidateLoginList.Count());

                spanbottomFirstval.InnerText = spanStartVal.InnerText;
                spanbottomLastval.InnerText = spanLastVal.InnerText;

                spanbottomTotalval.InnerText = SpanTotalPage.InnerText;

            }
            catch { }
        }
        protected void btnlinkFirst_Click(object sender, EventArgs e)
        {
            string valkl=hdnCheckRecId.Value;
            if (Convert.ToInt32(spanPage.InnerText) > 1)
                spanPage.InnerText = "1";

            searchCandidate();
        }

        protected void btnlinkPrev_Click(object sender, EventArgs e)
        {
            string valkl = hdnCheckRecId.Value;
            if (Convert.ToInt32(spanPage.InnerText) > 1)
                spanPage.InnerText = Convert.ToString(Convert.ToInt32(spanPage.InnerText) - 1);

            searchCandidate();

        }

        protected void btnlinkNext_Click(object sender, EventArgs e)
        {
            string valkl = hdnCheckRecId.Value;
            int lastpageno = Convert.ToInt32(All) / Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["pageView"].ToString());
            lastpageno = lastpageno + 1;

            if (Convert.ToInt32(spanPage.InnerText) < Convert.ToInt32(lastpageno))
                spanPage.InnerText = Convert.ToString(Convert.ToInt32(spanPage.InnerText) + 1);

            searchCandidate();


        }

        protected void btnlinkLast_Click(object sender, EventArgs e)
        {
            string valkl = hdnCheckRecId.Value;
            int lastpageno = Convert.ToInt32(All) / Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["pageView"].ToString());
            lastpageno = lastpageno + 1;

            if (Convert.ToInt32(spanPage.InnerText) < Convert.ToInt32(lastpageno))
                spanPage.InnerText = Convert.ToString(lastpageno);

            searchCandidate();
        }
    }
}