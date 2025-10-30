using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
namespace exportimportbidcp.app
{
    public partial class dashboard : System.Web.UI.Page
    {


        public db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
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
        protected List<candidate_login> canloginListimage = new List<candidate_login>();
        protected List<candidate_login> canloginListClosedimage = new List<candidate_login>();
        protected job_post JpostReActivate = new job_post();
        public string v1 = "0";
        public string v2 = "0";
        public string v3 = "0";
        public string v4 = "0";

        public string AllJOB = "0";
        public string ActiveJob = "0";
        public string OnHoldJOb = "0";
        public string ClosedJob = "0";

        public string ImageDisplay = System.Configuration.ConfigurationManager.AppSettings["ImageDisplay"].ToString();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["pacreate"] != null)
          ///  {
                try
                 {

                //v1 = "1448";
                // v2 = "900";
                //  v3 = "241";
                //   v4 = "07";
               
                if (!IsPostBack)
                    {
                    if (Session["UserFirstTime"] != null)
                    {
                        HiddenField2.Value = "0";
                    }
                    else
                        HiddenField2.Value = "1";

                    if (Request.QueryString["Reactivate"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Reactivate"]);


                        JpostReActivate = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (JpostReActivate != null)
                        {
                            JpostReActivate.active = true;
                            JpostReActivate.short_jobdesc = "";
                            context.SaveChanges();

                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                            //Response.Redirect("Dashboard");
                        }
                    }

                    candidateLoginList = context.candidate_login.Where(c => c.active == 1).ToList();
                      //txtInterview.InnerText = Convert.ToString(candidateLoginList.Count);

                    candidateLoginList = context.candidate_login.Where(c => c.active == 1 && c.status== "Completed").ToList();
                   // txtCompletedInt.InnerText = Convert.ToString(candidateLoginList.Count);

                       

                        categoryList = context.categories.Where(c => c.active == true).ToList();
                     //   txtcat.InnerText = Convert.ToString(categoryList.Count);

                        JobpostList = context.job_post.Where(c => c.active == true).ToList();
                  
                    //  txtJob.InnerText = Convert.ToString(JobpostList.Count);

                    
                }
                if (txtSearch.Text != "")
                {
                    getserachList();
                }
                else
                    getList();
                }
                catch(Exception ex) { }
            //}
        }
        public void getList()
        {
            if (Session["company_recid"] != null)
            {
                int comprecid = Convert.ToInt32(Session["company_recid"]);
                JobpostList1 = context.job_post.Where(c => (c.active == false && c.short_jobdesc != "Hold") && c.employer_login_rec_id == comprecid).ToList();
                v1 = AllJOB = context.job_post.Where(c => c.employer_login_rec_id == comprecid).ToList().Count().ToString();
                v2 = ActiveJob = context.job_post.Where(c => c.active == true && c.employer_login_rec_id == comprecid).Count().ToString();
                v3 = OnHoldJOb = context.job_post.Where(c => c.active == false && c.short_jobdesc == "Hold" && c.employer_login_rec_id == comprecid).Count().ToString();
                v4 = ClosedJob = context.job_post.Where(c => c.active == false && c.short_jobdesc == "Closed" && c.employer_login_rec_id == comprecid).Count().ToString();
            }

            canloginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c => c.rec_id).Take(5).ToList();
            categoryList = context.categories.Where(c => c.active == true).OrderByDescending(c => c.id).Take(5).ToList();

            if (Session["company_recid"] != null)
            {
                int comprecid = Convert.ToInt32(Session["company_recid"]);

               
                JobpostList = context.job_post.Where(c => (c.active == true || c.short_jobdesc == "Hold") && c.employer_login_rec_id== comprecid).OrderByDescending(c => c.rec_id).ToList();
            }
        }
        public string getcountinterview(string jobrecId)
        {
            int jobrec = Convert.ToInt32(jobrecId);
            string countinterview="0";
            countinterview = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id== jobrec).ToList().Count().ToString();
            return countinterview;
        }
        public void getDetails()
        {
            //Exticel_Search_Export_Data objBL = new Exticel_Search_Export_Data();
            //Exticel_Search_Export_DataDATA objData = new Exticel_Search_Export_DataDATA();
            //objBL.getdetails();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            getserachList();
        }
        private void getserachList()
        {

            try
            {
                if (txtSearch.Text != "")
                {
                    if (Session["company_recid"] != null)
                    {
                        int comprecid = Convert.ToInt32(Session["company_recid"]);


                        JobpostList = context.job_post.Where(c => (c.active == true || c.short_jobdesc == "Hold") && c.employer_login_rec_id == comprecid && (c.job_title.Contains(txtSearch.Text) || c.short_jobdesc.Contains(txtSearch.Text))).OrderByDescending(c => c.rec_id).ToList();
                        JobpostList1 = context.job_post.Where(c => (c.active == false && c.short_jobdesc != "Hold") && c.employer_login_rec_id == comprecid && (c.job_title.Contains(txtSearch.Text) || c.short_jobdesc.Contains(txtSearch.Text))).ToList();

                    }




                    try
                    {
                        
                        if (JobpostList.Count() == 0 && JobpostList1.Count() > 0)
                        {
                            var customers1 = from c in JobpostList1

                                         select c;

                            var customers4 = from c in JobpostList1
                                         where c.active == false && c.short_jobdesc == "Closed"
                                         select c;

                            try
                            {
                                v1 = AllJOB = customers1.ToList().Count().ToString();
                                v2 = ActiveJob = "0";
                                v3 = OnHoldJOb = "0";
                                v4 = ClosedJob = customers4.ToList().Count().ToString();

                            }
                            catch { }
                        }
                        else
                        {
                            var customers1 = from c in JobpostList

                                             select c;
                            var customers2 = from c in JobpostList
                                             where c.active == true
                                             select c;
                            var customers3 = from c in JobpostList
                                             where c.active == false && c.short_jobdesc == "Hold"
                                             select c;
                            var customers4 = from c in JobpostList
                                             where c.active == false && c.short_jobdesc == "Closed"
                                             select c;


                            try
                            {
                                v1 = AllJOB = customers1.ToList().Count().ToString();
                                v2 = ActiveJob = customers2.ToList().Count().ToString();
                                v3 = OnHoldJOb = customers3.ToList().Count().ToString();
                                v4 = ClosedJob = customers4.ToList().Count().ToString();

                            }
                            catch { }
                        }
                        


                        // Session["lastsearchdasboard"] = txtSearch.Text;
                    }
                    catch { }

                }
                else
                    getList();

            }
            catch { }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            getserachList();
        }

        public static int CountWords(string test)
        {
            int count = 0;
            bool wasInWord = false;
            bool inWord = false;

            for (int i = 0; i < test.Length; i++)
            {
                if (inWord)
                {
                    wasInWord = true;
                }

                if (Char.IsWhiteSpace(test[i]))
                {
                    if (wasInWord)
                    {
                        count++;
                        wasInWord = false;
                    }
                    inWord = false;
                }
                else
                {
                    inWord = true;
                }
            }

            // Check to see if we got out with seeing a word
            if (wasInWord)
            {
                count++;
            }

            return count;
        }
        [System.Web.Services.WebMethod]
        public static List<job_post> GetJobs(int skip, int take, int comprecid)
        {
            // Example filtering logic
            var context  = new db_a45c8e_VIPortalEntities();
            return context.job_post
       .Where(c => (c.active == true || c.short_jobdesc == "Hold") && c.employer_login_rec_id == comprecid)
       .OrderByDescending(c => c.rec_id)
       .Skip(skip)
       .Take(take)
       .ToList();
        }

    }
}