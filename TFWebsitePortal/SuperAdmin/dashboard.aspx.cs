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
namespace Extuent.SuperAdmin
{
    public partial class dashboard : System.Web.UI.Page
    {


        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected employer_login Jpost = new employer_login();
        protected List<employer_login> JobpostList = new List<employer_login>();
        protected List<employer_login> JobpostList1 = new List<employer_login>();
        protected List<employer_login> JobpostListCount = new List<employer_login>();
        public List<category> categoryList = new List<category>();
        public List<employer_login> candidateLoginList = new List<employer_login>();
        public List<video_interview> video_interviewList = new List<video_interview>();
    
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        public category category = new category();
        public string v1 = "0";
        public string v2 = "0";
        public string v3 = "0";
        public string v4 = "0";

        public string AllJOB = "0";
        public string ActiveJob = "0";
        public string OnHoldJOb = "0";
        public string ClosedJob = "0";
        public List<employer_login> usrloginlist = new List<employer_login>();
        public List<user_login> usrloginlist1 = new List<user_login>();
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

                 

                    candidateLoginList = context.employer_login.Where(c => c.active == true).ToList();
                      //txtInterview.InnerText = Convert.ToString(candidateLoginList.Count);

                 //   candidateLoginList = context.employer_login.Where(c => c.active == 1).ToList();
                   // txtCompletedInt.InnerText = Convert.ToString(candidateLoginList.Count);

                       

                        categoryList = context.categories.Where(c => c.active == true).ToList();
                     //   txtcat.InnerText = Convert.ToString(categoryList.Count);

                        JobpostList = context.employer_login.Where(c => c.active == true).ToList();
                    JobpostList1= context.employer_login.Where(c => c.active == false).Take(5).ToList();
                    //  txtJob.InnerText = Convert.ToString(JobpostList.Count);


                  v1=  AllJOB = context.employer_login.ToList().Count().ToString();
                  v2=  ActiveJob = context.employer_login.Where(c => c.active == true).Count().ToString();
                    v3 = OnHoldJOb = "0";//context.job_post.Where(c => c.active == false).Count().ToString();
                  v4=  ClosedJob = context.employer_login.Where(c => c.active == false).Count().ToString();
                }

                    getList();
                }
                catch(Exception ex) { }
            //}
        }
        public void getList()
        {
            usrloginlist = context.employer_login.Where(c => c.active == true).ToList();
            canloginList = context.candidate_login.Where(c => c.active == 1).OrderByDescending(c => c.rec_id).Take(5).ToList();
            categoryList = context.categories.Where(c => c.active == true).OrderByDescending(c => c.id).Take(5).ToList();
            JobpostList = context.employer_login.Where(c => c.active == true).OrderByDescending(c => c.rec_id).Take(6).ToList();
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





    }
}