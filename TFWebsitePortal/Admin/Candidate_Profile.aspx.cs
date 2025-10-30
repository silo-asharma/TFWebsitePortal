using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Reflection;
using System.Web.Services;


namespace Extuent.Admin
{
    public partial class Candidate_Profile : System.Web.UI.Page
    {
       public db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        protected List<video_interview> VideoInterViewList = new List<video_interview>();
        protected video_interview videoInterviewnNow = new video_interview();
        protected add_questions ques = new add_questions();
        protected List<candidate_experience> canExpList = new List<candidate_experience>();
        public string[] evalutions;
        public List<string> evalutiontext = new List<string>();
        public category category = new category();
        public string urlResume = "";
        public string urlImage = "";
        public string vid = "";
        
        public string ImageDisplay = System.Configuration.ConfigurationManager.AppSettings["ImageDisplay"].ToString();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();

        public string videoURL = System.Configuration.ConfigurationManager.AppSettings["videoURL"].ToString();
        public string ImageURL = System.Configuration.ConfigurationManager.AppSettings["ImageURL"].ToString();
        public string DocURL = System.Configuration.ConfigurationManager.AppSettings["DocURL"].ToString();

        public string DocURLfordisplay="";
        public string fileTypefordisplay = "";
        // public string videoURL = "http://44.204.70.197/";
        DataView dv;
        public string currencyloc = "";
        protected candidate_experience canexp = new candidate_experience();
        public List<candidate_login> candidateLoginList = new List<candidate_login>();
        public string lnkpre;
        public string lnknxt;
        public string currentresult = "";
        public string Actualcurrentresult = "";
        public string retQry = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                   
                    Image2.ImageUrl = "assets / images / abhishek.png";
                    img1.ImageUrl = "assets / images / abhishek.png";

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

                    ddlAllJob.Items.Insert(0, "Job Title");


                    if (Request.QueryString["vid"] != null)
                    {
                        if (Request.QueryString["edit"] != null)
                        {
                            diveditProfileSummary.Visible = true;
                            divProfileSummary.Visible = false;

                            lblnoticeperiod.Visible = false;
                            ddlNoticeP.Visible = true;
                            btnsavenoticePer.Visible = false;


                            lblskills.Visible = false;
                            txtSkills.Visible = true;
                            btnSaveSkilss.Visible = false;

                        }
                        int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                        vid = ReqId.ToString();

                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (canloginNow != null)
                        {
                            int jobrecid = Convert.ToInt32(context.candidate_job_apply.Where(c => c.candidate_rec_id == canloginNow.rec_id).FirstOrDefault().job_post_rec_id);
                            lblpositionName.Text = context.job_post.Where(c => c.rec_id == jobrecid).FirstOrDefault().job_title;
                            //currencyloc = canloginNow.location;
                            if (canloginNow.location.Contains("India"))
                            {
                                currencyloc = "INR";
                            }
                            else if ((canloginNow.location.Contains("Philippines")))
                            {
                                currencyloc = "PHP";
                            }
                            else if ((canloginNow.location.Contains("USA")))
                            {
                                currencyloc = "USD";
                            }
                                

                            lblName.Text = canloginNow.name+" "+ canloginNow.last_name;
                           
                            lblresume.Text= canloginNow.name;
                            urlResume = canloginNow.candidate_resume_url;
                            lblPhone.Text = canloginNow.mobile_no;
                            Session["Emailsend"]=lblEmail.Text = canloginNow.email;
                            lblLocation.Text = canloginNow.location;

                            lblDegree.Text = canloginNow.hq_degree;
                            lblInst.Text = canloginNow.hq_institute;
                            lblYear.Text = canloginNow.hq_year;

                            lbltotalctc.Text = canloginNow.total_ctc;
                            lblvarctc.Text = canloginNow.variable_ctc;
                            lblfixedctc.Text = canloginNow.fixed_ctc;
                            lblnoticeperiod.Text = canloginNow.notice_period;
                            ddlNoticeP.SelectedValue = canloginNow.notice_period;
                            lblApplicationDate.Text = Convert.ToDateTime(canloginNow.doc).ToString("MMM dd, yyyy");

                            if (canloginNow.rec_id < 1082)
                            {
                                lblskills.InnerText = canloginNow.hq_skill.Replace(",", ", ");
                                txtSkills.InnerHtml = canloginNow.hq_skill.Replace(",", ", ");
                            }
                            else
                            {
                                lblskills.InnerText = canloginNow.hq_skill;
                                txtSkills.InnerHtml = canloginNow.hq_skill;

                            }

                            Image2.ImageUrl = ImageURL + canloginNow.candidate_profile_pic_url;
                            img1.ImageUrl = ImageURL + canloginNow.candidate_profile_pic_url;
                            imgprofile.Src = ImageDisplay + canloginNow.candidate_profile_pic_url;
                            //src = "../images/candidate1.jpg"

                            lnkresume.HRef = DocURL + canloginNow.candidate_resume_url;
                            lnkresume2.HRef = DocURL + canloginNow.candidate_resume_url;
                            DocURLfordisplay= DocURL + canloginNow.candidate_resume_url;

                            try
                            {
                                string[] s3 = canloginNow.candidate_resume_url.Split('.');
                                fileTypefordisplay = s3[1];
                            }
                            catch { }

                            ddlRating.SelectedValue = canloginNow.rating;
                            ddlResult.SelectedValue = canloginNow.result;
                            txtcomment.Text = canloginNow.comment;
                            txtCommentsarea.Value = canloginNow.comment_display;
                            txtSalaryDetailsForCustomer.Value = canloginNow.salary_for_customer;

                            if (canloginNow.result == "" || canloginNow.result == null)
                            {
                                currentresult = "Pending";
                            }
                            else
                                currentresult = canloginNow.result;

                            if (canloginNow.status == "Pending")
                            {
                               
                                currentresult = "In Process";
                            }

                            if (canloginNow.result == "Followup")
                            {
                                Actualcurrentresult = "Followup";
                            }
                            else
                                Actualcurrentresult = currentresult;


                            try
                            {

                                canExpList = context.candidate_experience.Where(c => c.candidate_id == canloginNow.rec_id && c.is_active == true).OrderBy(c => c.id).Take(3).ToList();
                                if (canExpList != null)
                                {
                                    for (int l = 0; l <= canExpList.Count-1; l++)
                                    {
                                        if (l == 0)
                                        {
                                            if (canExpList[l].end_date != null && canExpList[l].end_date != "")
                                            {
                                                exp1.Text = Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + ", " + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString();
                                                from.Text = canExpList[l].start_date;
                                                to.Text = canExpList[l].end_date;
                                                title.Text = canExpList[l].job_title.ToString();
                                                company.Text = canExpList[l].company_name.ToString();

                                            }
                                            else
                                            {
                                                exp1.Text = Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "- Till Now" + ", " + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString();

                                                from.Text = canExpList[l].start_date;
                                                to.Text = canExpList[l].end_date;
                                                title.Text = canExpList[l].job_title.ToString();
                                                company.Text = canExpList[l].company_name.ToString();
                                            }

                                        }
                                        if (l == 1)
                                        {
                                            exp2.Text = Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + ", " + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString();
                                            from1.Text = canExpList[l].start_date;
                                            to1.Text = canExpList[l].end_date;
                                            title1.Text = canExpList[l].job_title.ToString();
                                            company1.Text = canExpList[l].company_name.ToString();
                                        }
                                        if (l == 2)
                                        {
                                            exp3.Text = Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + ", " + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString();
                                            from2.Text = canExpList[l].start_date;
                                            to2.Text = canExpList[l].end_date;
                                            title2.Text = canExpList[l].job_title.ToString();
                                            company2.Text = canExpList[l].company_name.ToString();
                                        }
                                    }

                                }
                            }
                            catch(Exception ex) { }


                            videoInterviewnNow = context.video_interview.Where(c => c.candidate_id == ReqId).FirstOrDefault();
                            if (videoInterviewnNow != null)
                            {
                                VideoPlayer.Src = videoURL + videoInterviewnNow.question_vedio_URL;
                                lblquestion.InnerText = context.add_questions.Where(c => c.id == videoInterviewnNow.question_id).FirstOrDefault().question;


                            }

                            evalutions = context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id).evalauation.Split(',');
                            int EV_ID = 0;
                            int ii = 0;
                            foreach (string ev in evalutions)
                            {
                                EV_ID = Convert.ToInt32(ev);
                                evalutiontext.Add(context.evaluations.FirstOrDefault(el => el.id == EV_ID).evaluation_name);
                                ii++;
                            }

                        }



                        VideoInterViewList = context.video_interview.Where(c => c.candidate_id == ReqId).ToList();

                        int jobcount = 0;
                        int candidateid = Convert.ToInt32(vid);
                        int jobrecidnew = Convert.ToInt32(context.candidate_job_apply.Where(c => c.candidate_rec_id == candidateid).FirstOrDefault().job_post_rec_id);
                        jobcount = Convert.ToInt32(context.add_questions.Where(c => c.job_id == jobrecidnew).ToList().Count());

                        VideoInterViewList = VideoInterViewList.OrderByDescending(c => c.id).ToList().Take(jobcount).ToList();
                        VideoInterViewList = VideoInterViewList.OrderBy(c => c.id).ToList();



                        try
                        {

                            Session["Next"] = "1";
                            Session["Back"] = "0";
                            var result = (from a in VideoInterViewList

                                          select new { a.id, a.question_vedio_URL, a.question_id }).ToList();

                            DataTable dt = ToDataTable(result);

                            DataTable dt1 = new DataTable();
                            dt1.Clear();

                            dt1.Columns.Add("SNO");
                            dt1.Columns.Add("Id");
                            dt1.Columns.Add("QId");
                            dt1.Columns.Add("URL");
                            int j = 1;

                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                DataRow _row = dt1.NewRow();
                                _row["SNO"] = j;
                                _row["Id"] = dt.Rows[i]["id"];
                                _row["QId"] = dt.Rows[i]["question_id"];
                                _row["URL"] = dt.Rows[i]["question_vedio_URL"];

                                dt1.Rows.Add(_row);


                                j++;

                            }

                            Session["dt1"] = dt1;


                        }
                        catch (Exception ex) { }

                        if (Request.QueryString["VideoId"] != null)
                        {
                            int VReqId = Convert.ToInt32(Request.QueryString["VideoId"]);
                            videoInterviewnNow = context.video_interview.Where(c => c.id == VReqId).FirstOrDefault();
                            if (videoInterviewnNow != null)
                            {
                                VideoPlayer.Src = videoURL + videoInterviewnNow.question_vedio_URL;
                                lblquestion.InnerText = context.add_questions.Where(c => c.id == videoInterviewnNow.question_id).FirstOrDefault().question;
                            }
                      
                        }
                        else
                        { }
                    }
                    
  }
                else
                {
                    if (Request.QueryString["vid"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                        vid = ReqId.ToString();

                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();
                       
                        if (canloginNow != null)
                        {
                            // VideoInterViewList = context.video_interview.Where(c => c.candidate_id == ReqId).ToList();

                            VideoInterViewList = context.video_interview.Where(c => c.candidate_id == ReqId).ToList();

                            int jobcount = 0;
                            int candidateid = Convert.ToInt32(vid);
                            int jobrecidnew = Convert.ToInt32(context.candidate_job_apply.Where(c => c.candidate_rec_id == candidateid).FirstOrDefault().job_post_rec_id);
                            jobcount = Convert.ToInt32(context.add_questions.Where(c => c.job_id == jobrecidnew).ToList().Count());

                            VideoInterViewList = VideoInterViewList.OrderByDescending(c => c.id).ToList().Take(jobcount).ToList();
                            VideoInterViewList = VideoInterViewList.OrderBy(c => c.id).ToList();


                        }
                    }
                }
                //getList();
                //if (IsPostBack)
                //{
                if (Request.QueryString["prevnext"] != null)
                {
                    lnkprenew.Visible = false;
                    lnkNextnew.Visible = false;
                }
                else
                {
                    
                        getdet(sender, e);

                        if (Request.QueryString["vid"] != null)
                        {
                            int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                            int index = candidateLoginList.FindIndex(nd => nd.rec_id == ReqId);

                            if (index == candidateLoginList.Count() - 1)
                            {
                                lnkNextnew.Visible = false;
                            }
                            else
                            {
                                var NextCandidate = candidateLoginList.ElementAtOrDefault(index + 1).rec_id;
                                lnknxt = NextCandidate.ToString();
                            if (!IsPostBack)
                               hdnNext.Value = lnknxt;
                            }
                            if (index == 0)
                            {
                                lnkprenew.Visible = false;
                            }
                            else
                            {
                                var PreviousCandidate = candidateLoginList.ElementAtOrDefault(index - 1).rec_id;
                                lnkpre = PreviousCandidate.ToString();
                            }

                        }
                    }
                
                 //}
                //lnkprenew.PostBackUrl = "candidate-profile?vid=231#";
                // lnkNextnew.PostBackUrl = "candidate-profile?vid=231#";
                //VideoPlayer.Src = videoURL+"LiveVideo/test112334.webm";
            }
            catch (Exception ex) { }

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
                //Application Result,job,category
                else if (ddlAllJob.SelectedIndex != 0 && ddlResult.SelectedIndex != 0 && ddlCategory.SelectedIndex != 0)
                {
                    int jobapply = Convert.ToInt32(ddlAllJob.SelectedValue);
                    string r = ddlResult.SelectedItem.Value;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == company_recid && c.job_apply_id == jobapply && c.status == r && c.available_for_job_type == categoryvalue).OrderByDescending(c => c.rec_id).ToList();
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
                    canloginList = canloginList.Where(c => (c.location.Contains(countryName))).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;
                }

                try
                {

                   


                    //var customers1 = from c in canloginList
                    //                 where c.active == 1
                    //                 select c;
                    //var customers2 = from c in canloginList
                    //                 where c.active == 1 && c.result == "Hired"
                    //                 select c;
                    //var customers3 = from c in canloginList
                    //                 where c.active == 1 && c.result == "Hold"
                    //                 select c;
                    //var customers4 = from c in canloginList
                    //                 where c.active == 1 && c.result == "Reject"
                    //                 select c;
                    //var customers5 = from c in canloginList
                    //                 where c.active == 1 && c.result == "Pass"
                    //                 select c;

                    //All = customers1.ToList().Count().ToString();
                    //hired = customers2.ToList().Count().ToString();
                    //onhold = customers3.ToList().Count().ToString();
                    //rejected = customers4.ToList().Count().ToString();
                    //pass = customers5.ToList().Count().ToString();
                }
                catch { }


                backqueryString();

            }
            catch { }
        }
        public string backqueryString()
        {
            retQry = "";
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
                if (Request.QueryString["textSearch"] != null)
                {
                    qrystring += "&&textSearch=" + Request.QueryString["textSearch"].ToString();
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
        //public void backqueryString()
        //{
        //    try
        //    {


        //        string qrystring = "";
        //        if (ddlCategory.SelectedIndex != 0)
        //        {
        //            qrystring = "category=" + ddlCategory.SelectedValue;
        //        }
        //        if (ddlAllJob.SelectedIndex != 0)
        //        {
        //            qrystring += "&&job=" + ddlAllJob.SelectedValue;
        //        }
        //        if (ddlResult.SelectedIndex != 0)
        //        {
        //            qrystring += "&&application=" + ddlResult.SelectedValue;
        //        }
        //        if (ddlDescStatus.SelectedIndex != 0)
        //        {
        //            qrystring += "&&desc=" + ddlDescStatus.SelectedValue;
        //        }
        //        if(qrystring!="")
        //        Session["Backqrystring"] = qrystring;
        //    }
        //    catch { }
        //}
        public void getdet(object sender, EventArgs e)
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

            if (Request.QueryString["textSearch"] != null)
            {
                    string txtse = Convert.ToString(Request.QueryString["textSearch"]);
                    string employer_login_id = Convert.ToString(Session["company_recid"]);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.candidate_login_id == employer_login_id && (c.name.Contains(txtse) || c.mobile_no.Contains(txtse) || c.result.Contains(txtse) || c.email.Contains(txtse))).OrderByDescending(c => c.rec_id).OrderByDescending(c => c.rec_id).ToList();
                    candidateLoginList = canloginList;

                   backqueryString();
            }
             else
                searchCandidate();


            //if (Session["Backqrystring"] != null)
            //{
            //    string[] vl1 = Convert.ToString(Session["Backqrystring"]).Split('&');


            //    if (vl1[0] != "")
            //    {
            //        string[] v1 = vl1[0].Split('=');

            //        ddlCategory.SelectedValue = Convert.ToString(v1[1]);
            //        ddlCategory_SelectedIndexChanged(sender, e);
            //    }
            //    if (vl1.Count() > 1)
            //    {
            //        if (vl1[2] != "")
            //        {
            //            string[] v2 = vl1[2].Split('=');
            //            ddlAllJob.SelectedValue = Convert.ToString(v2[1]);

            //        }
            //    }
            //    if (vl1.Count() > 3)
            //    {
            //        if (vl1[4] != "")
            //        {
            //            string[] v3 = vl1[4].Split('=');
            //            ddlResult.SelectedValue = Convert.ToString(v3[1]);

            //        }
            //    }
            //    if (vl1.Count() > 5)
            //    {
            //        if (vl1[6] != "")
            //        {
            //            string[] v4 = vl1[6].Split('=');
            //            ddlDescStatus.SelectedValue = Convert.ToString(v4[1]);

            //        }
            //    }

            //}

        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
               // Session["lastsearch"] = null;
                

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
        public void getList()
        {
            canloginList = context.candidate_login.Where(c => c.active == 1 && c.status == "Complete").ToList();
         
        }

        protected void sendnotification_Click(object sender, EventArgs e)
        {

            if (Request.QueryString["vid"] != null)
            {
                int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
               
                
                bool isemail = isWelcomeMailsent(Session["Emailsend"].ToString(), ReqId);
                if (isemail == true)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email sent successfully!..')", true);
                }
            }
        }
        public bool isWelcomeMailsent(string RecieverEmail,int recid)
        {

            // Welcome Email
            bool result = false;
            try
            {
                var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
                var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
                var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
                var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

                string body = "";


                body += "<html><head></head><body><center><table style='height:auto;width:600px;'><tr><td><span style='font-family:arial;font-size:14px;'><b>Dear Hello</b></span><br><br>";
                body += "</td><td>Please upload your video again, Click on this link <a href="+ URLDisplay + "/Create_Video_Interview?CandidateId"+ recid + ">Click Here</a>";
                body += "</td></tr></table></center></body></html>";






                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                var fromAddress = new MailAddress(mailaddress);
                var toAddress = new MailAddress(RecieverEmail);
                const string subject = "Welcome Mail From Extuent INC";
                var smtp = new SmtpClient
                {
                    Host = smtpHost,
                    Port = smtpPort,
                    EnableSsl = true, //chk_usessl
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, mailpassword)
                };

                ///  Attachment attach = new Attachment(file path);
                MailMessage mail = new MailMessage(fromAddress, toAddress);

               
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.Body = body;
                mail.Subject = subject;
                //smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            { }

            return result;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtcomment.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Comment must be filled out')", true);
                    return;
                }
                if (Request.QueryString["vid"] != null)
                {
                    int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                    vid = ReqId.ToString().Substring(0,10);

                    canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    if (canloginNow != null)
                    {

                        canloginNow.result = ddlResult.SelectedValue;
                        canloginNow.rating = ddlRating.SelectedValue;
                        canloginNow.comment = txtcomment.Text;

                        context.SaveChanges();

                        txtcomment.Text = "";
                        ddlResult.SelectedIndex = 0;
                        ddlRating.SelectedIndex = 0;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Result Saved!!')", true);

                    }
                }



         }
            catch(Exception ex) { }

            }
       
        protected void btnBack_Click(object sender, EventArgs e)
        {
            try {
                //string ab = ;
                int va;
                dv = new DataView((DataTable)Session["dt1"]);

                if (dv.Count > 0)
                {
                    if (Session["Back"].ToString() != "0")
                    {


                        string btNext = Session["Next"].ToString();
                        string btBack = Session["Back"].ToString();


                        dv.Sort = "SNO";
                        int index = dv.Find(btBack);
                        if (index > -1)
                        {
                            va = Convert.ToInt32(dv[index]["QId"]);
                            VideoPlayer.Src = videoURL + dv[index]["URL"];
                            lblquestion.InnerText = context.add_questions.Where(c => c.id == va).FirstOrDefault().question;
                        }



                        //--------------
                        Session["Next"] = btBack;
                        Session["Back"] = Convert.ToInt32(btBack) - 1;
                    }
                }
            }
            catch (Exception ex) { }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int va;
            dv = new DataView((DataTable)Session["dt1"]);
            if (dv.Count > 0)
            {
                if (Session["Next"].ToString() != dv.Count.ToString())
            {
                string btNext = Session["Next"].ToString();
                string btBack = Session["Back"].ToString();



                    //string ab = ;

                    dv.Sort = "SNO";
                    int index = dv.Find(btNext);
                    if (index > -1)
                    {
                        va = Convert.ToInt32(dv[index]["QId"]);
                        VideoPlayer.Src = videoURL + dv[index]["URL"];
                        lblquestion.InnerText = context.add_questions.Where(c => c.id == va).FirstOrDefault().question;

                    }

               

                //--------------
                Session["Back"] = btNext;
                Session["Next"] = Convert.ToInt32(btNext)+1;
                
            }
            }
        }

        public string getQuestionName(string jobTypeN)
        {
            string categoryName = "";
            if (jobTypeN != null && jobTypeN != "")
            {
                int jobType = Convert.ToInt32(jobTypeN);

                ques = context.add_questions.Where(c => c.id == jobType).FirstOrDefault();
                if (ques != null)
                {
                    categoryName = ques.question;
                }
            }
            return categoryName;
        }
        [WebMethod]
        public static string assignUrl(string QID,int CandidateID)
        {
            string videoURL = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString()+"/admin/Upload/";
            string url = "";
            db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
            video_interview videoInterviewnNow = new video_interview();
            int qid = Convert.ToInt32(QID);
            videoInterviewnNow = context.video_interview.Where(c => c.question_id == qid &&  c.candidate_id== CandidateID).FirstOrDefault();
            if(videoInterviewnNow!=null)
           url = videoURL + videoInterviewnNow.question_vedio_URL;


            return url;
        }
        [WebMethod]
        public static string SaveRatings(string rating_string, string rating_Questions,string Comments,string Status,int Candidate_ID)
        {
            string str = "";
            db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
            candidate_login canloginNow = new candidate_login();
            canloginNow = context.candidate_login.Where(c => c.rec_id == Candidate_ID).FirstOrDefault();

            if (canloginNow != null)
            {

                canloginNow.result = Status;
                canloginNow.rating = rating_string;
                canloginNow.comment = rating_Questions;
                canloginNow.comment_display = Comments;
                context.SaveChanges();
                str = "Pass";



            }
            return str;
        }

        protected void btnsaveedit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["vid"] != null)
                {
                    int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                    //vid = ReqId.ToString().Substring(0, 10);

                    canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    canExpList = context.candidate_experience.Where(c => c.candidate_id == canloginNow.rec_id && c.is_active == true).OrderBy(c => c.id).Take(3).ToList();
                    if (canExpList != null)
                    {
                        int balcal = 3 - canExpList.Count;
                        int candexpid;
                        for (int l = 0; l <= canExpList.Count - 1; l++)
                        {
                            candexpid = Convert.ToInt32(canExpList[l].id);
                            canexp = context.candidate_experience.Where(c => c.id == candexpid).FirstOrDefault();
                            if (canexp != null)
                            {
                                if (l == 0)
                                {
                                    if (canExpList[l].end_date != null && canExpList[l].end_date != "")
                                    {

                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company.Text;
                                        canexp.job_title = title.Text;
                                        canexp.start_date = from.Text;
                                        canexp.end_date = to.Text;
                                        canexp.is_active = true;


                                        context.SaveChanges();

                                    }
                                    else
                                    {
                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company.Text;
                                        canexp.job_title = title.Text;
                                        canexp.start_date = from.Text;
                                        // canexp.end_date = to.Text;
                                        canexp.is_active = true;


                                        context.SaveChanges();
                                    }


                                }
                                if (l == 1)
                                {
                                    canexp.candidate_id = canloginNow.rec_id;
                                    canexp.company_name = company1.Text;
                                    canexp.job_title = title1.Text;
                                    canexp.start_date = from1.Text;
                                    canexp.end_date = to1.Text;
                                    canexp.is_active = true;


                                    context.SaveChanges();
                                }
                                if (l == 2)
                                {
                                    canexp.candidate_id = canloginNow.rec_id;
                                    canexp.company_name = company2.Text;
                                    canexp.job_title = title2.Text;
                                    canexp.start_date = from2.Text;
                                    canexp.end_date = to2.Text;
                                    canexp.is_active = true;


                                    context.SaveChanges();
                                }
                            }
                        }
                        #region "********Add New Experience***********"
                        if (balcal == 3)
                        {
                            // For Add 
                            for (int l = 0; l <= balcal - 1; l++)
                            {  //add experience
                                if (l == 0)
                                {
                                    if (company.Text != "")
                                    {
                                        canexp = new candidate_experience();

                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company.Text;
                                        canexp.job_title = title.Text;
                                        canexp.start_date = from.Text;
                                        canexp.end_date = to.Text;
                                        canexp.is_active = true;

                                        context.candidate_experience.Add(canexp);
                                        context.SaveChanges();
                                    }

                                }
                                if (l == 1)
                                {
                                    if (company1.Text != "")
                                    {
                                        canexp = new candidate_experience();

                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company1.Text;
                                        canexp.job_title = title1.Text;
                                        canexp.start_date = from1.Text;
                                        canexp.end_date = to1.Text;
                                        canexp.is_active = true;

                                        context.candidate_experience.Add(canexp);
                                        context.SaveChanges();
                                    }
                                }
                                if (l == 2)
                                {
                                    if (company2.Text != "")
                                    {
                                        canexp = new candidate_experience();

                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company2.Text;
                                        canexp.job_title = title2.Text;
                                        canexp.start_date = from2.Text;
                                        canexp.end_date = to2.Text;
                                        canexp.is_active = true;

                                        context.candidate_experience.Add(canexp);
                                        context.SaveChanges();
                                    }
                                }
                            }
                        }
                        else if (balcal == 2)
                        {
                            // For Add 
                            for (int l = 0; l <= balcal - 1; l++)
                            {  //add experience

                                if (l == 0)
                                {
                                    if (company1.Text != "")
                                    {
                                        canexp = new candidate_experience();

                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company1.Text;
                                        canexp.job_title = title1.Text;
                                        canexp.start_date = from1.Text;
                                        canexp.end_date = to1.Text;
                                        canexp.is_active = true;

                                        context.candidate_experience.Add(canexp);
                                        context.SaveChanges();
                                    }
                                }
                                if (l == 1)
                                {
                                    if (company2.Text != "")
                                    {
                                        canexp = new candidate_experience();

                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company2.Text;
                                        canexp.job_title = title2.Text;
                                        canexp.start_date = from2.Text;
                                        canexp.end_date = to2.Text;
                                        canexp.is_active = true;

                                        context.candidate_experience.Add(canexp);
                                        context.SaveChanges();
                                    }
                                }
                            }

                        }
                        else if (balcal == 1)
                        {
                            // For Add 
                            for (int l = 0; l <= balcal - 1; l++)
                            {  //add experience

                               
                                if (l == 0)
                                {
                                    if (company2.Text != "")
                                    {
                                        canexp = new candidate_experience();

                                        canexp.candidate_id = canloginNow.rec_id;
                                        canexp.company_name = company2.Text;
                                        canexp.job_title = title2.Text;
                                        canexp.start_date = from2.Text;
                                        canexp.end_date = to2.Text;
                                        canexp.is_active = true;

                                        context.candidate_experience.Add(canexp);
                                        context.SaveChanges();
                                    }
                                }
                            }
                        }
                        #endregion"******End Adding******"
                        btnSaveSkilss_Click(sender, e);
                        btnsavenoticePer_Click(sender, e);
                        btnCandidateBackButton_Click(sender, e);

                    }
                }
            }
            catch (Exception ex) { }
        }

        protected void btnCandidateBackButton_Click(object sender, EventArgs e)
        {
            if (Session["Backqrystring"] != null)
            {
                //retQry= backqueryString();
                Response.Redirect("candidate-interview-list?type=Back&&" + retQry + "");
                Session["Backqrystring"] = null;

            }
            else
            {
                Response.Redirect("candidate-interview-list?type=All");
            }
        }

        protected void btnSaveSkilss_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["vid"] != null)
                {
                    int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                    //vid = ReqId.ToString().Substring(0, 10);

                    canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    if (canloginNow != null)
                    {
                        canloginNow.hq_skill = txtSkills.InnerHtml;
                        context.SaveChanges();

                        //btnCandidateBackButton_Click(sender, e);
                    }

                }
            }
            catch (Exception ex) { }
        }

        protected void btnsavenoticePer_Click(object sender, EventArgs e)
        {

            try
            {
                if (Request.QueryString["vid"] != null)
                {
                    int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                    //vid = ReqId.ToString().Substring(0, 10);

                    canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    if (canloginNow != null)
                    {
                         
                        canloginNow.notice_period = ddlNoticeP.SelectedValue;
                        canloginNow.salary_for_customer = txtSalaryDetailsForCustomer.Value;
                        context.SaveChanges();

                       // btnCandidateBackButton_Click(sender, e);
                    }

                }
            }
            catch (Exception ex) { }
        }

        protected void lnkprenew_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("candidate-profile?vid="+ lnkpre + ""+ retQry + "",false);
        }

        protected void lnkNextnew_Click(object sender, EventArgs e)
        {
            if (lnknxt == "")
            {
                btnCandidateBackButton_Click(sender, e);
            }
            else
            {
                if (hdnisAction.Value == "yes")
                Response.Redirect("candidate-profile?vid=" + hdnNext.Value + "" + retQry + "", false);
                else
                Response.Redirect("candidate-profile?vid=" + lnknxt + "" + retQry + "", false);
            }
        }
        public bool getVideoConverstion(int candidateRecId)
        {
            bool isVideoConverted = false;
            try
            {
                var count = context.video_interview.Where(c => c.candidate_id == candidateRecId && c.is_email_send == 1).ToList().Count();
                if (count > 0)
                    isVideoConverted = true;
            }
            catch { }
            return isVideoConverted;
        }
    }
}