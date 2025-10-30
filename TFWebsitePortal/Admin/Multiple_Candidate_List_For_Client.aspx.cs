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
        public string ImageDisplay = System.Configuration.ConfigurationManager.AppSettings["ImageDisplay"].ToString();
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        protected job_post JpbpostName = new job_post();
        public string urlthis = "";
        public string Acualurlthis = "";
        public admincommon objadmin = new admincommon();
        public List<share_link_history> sharelinkhistory = new List<share_link_history>();
        protected share_link_history sharelink = new share_link_history();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                if (!IsPostBack)
                {
                    String str = "";
                    
                    if (Request.QueryString["vid"] != null || Request.QueryString["Ex"] != null || Request.QueryString["Pr"] != null)
                    {
                        if (Request.QueryString["Pr"] != null)
                        {

                            string recidshareLink = Convert.ToString(admincommon.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Pr"])));
                            //redirext to extuent.net
                            string actualURL = getactualURL(recidshareLink);
                            if (actualURL != "")
                            {
                                //urlthis = Convert.ToString(Request.QueryString["vid"]);
                                str = Convert.ToString(actualURL);
                                urlthis = admincommon.Encrypt(str);


                            }
                        }

                       else if (Request.QueryString["newupdate"] != null)
                        {

                            urlthis = Convert.ToString(Request.QueryString["vid"]);
                            Acualurlthis = HttpUtility.UrlDecode(Request.QueryString["vid"]);
                            str = Convert.ToString(admincommon.Decrypt(HttpUtility.UrlDecode(Request.QueryString["vid"])));
                        }
                        else if (Request.QueryString["Ex"] != null)
                        {

                            urlthis = Convert.ToString(Request.QueryString["Ex"]);
                            Acualurlthis = HttpUtility.UrlDecode(Request.QueryString["Ex"]);
                            str = Convert.ToString(admincommon.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Ex"])));

                        }
                    
                        else
                        {

                            str = Convert.ToString(Request.QueryString["vid"]);
                          
                            urlthis = admincommon.Encrypt(str);
                           // Acualurlthis = HttpUtility.UrlDecode(Request.QueryString["vid"]);
                        }

                        // redirext to extuent.net
                        //string actualURL=getactualURL(str);
                        //if (actualURL != "")
                        //{

                        //    Response.Redirect(actualURL,false);
                        //    return;

                        //}

                        int recid;
                        Char delimiter = '-';
                        String[] result = str.Split(delimiter);
                        for (int i = 0; i < result.Length; i++)
                        {
                            if (result[i] != "-" && result[i] != null && result[i] != "" && result[i] != "on")
                            {
                                recid = Convert.ToInt32(result[i]);
                                canloginNow = context.candidate_login.Where(c => c.active == 1 && c.rec_id == recid).FirstOrDefault();
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
        public string getactualURL(string recidNEw)
        {
            string newActualURL = "";
            try
            {
                String[] result;
                String[] result1;
                string finalValu;
                int newId = Convert.ToInt32(recidNEw);

                sharelink = context.share_link_history.Where(c => c.rec_id == newId).FirstOrDefault();
                if (sharelink != null)
                {
                    
                        string sharelinknew = "";
                        sharelinknew = sharelink.actual_url;


                        result = sharelinknew.Split('?');
                        result1 = result[1].Split('&');
                        finalValu = result1[0].Substring(4);
                        finalValu=Convert.ToString(admincommon.Decrypt(HttpUtility.UrlDecode(finalValu)));
                    newActualURL = finalValu;


                }
            }
            catch { }
            return newActualURL;
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
    }
}