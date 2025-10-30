using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using Microsoft.WindowsAPICodePack.Shell;
using Microsoft.WindowsAPICodePack.Shell.PropertySystem;

namespace Extuent.Admin
{
    public partial class billing : System.Web.UI.Page
    {
        public db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        public List<employer_plan_details> usrloginlist = new List<employer_plan_details>();
        public List<candidate_login> canlogin = new List<candidate_login>();
        public List<video_interview> videoList = new List<video_interview>();
        public website_plan_master websitePlans = new website_plan_master();
        public employer_payment_history paymenthistory = new employer_payment_history();
        public string VideoURL = System.Configuration.ConfigurationManager.AppSettings["VideoURLMP4ForSize"].ToString();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            getList();
        }
        public void getList()
        {
            if (Session["company_recid"] != null)
            {
                int comprecid = Convert.ToInt32(Session["company_recid"]);
                usrloginlist = context.employer_plan_details.Where(c => c.active == 1 && c.employer_rec_id == comprecid).ToList();
            }

        }
        public string getMonthName(string tdate)
        {
            string month_name = "July";
            try
            {
                 month_name = Convert.ToDateTime(tdate).ToString("MMM");
            }
            catch { }
            return month_name;

        }
        public string getTotalUsedMinjtes(string employerid)
        {


            string getMinutes = "";
            double totalVideominute = 0.00;
            string valarrayvalues = "";
            try {

                canlogin = context.candidate_login.Where(c=> c.candidate_login_id== employerid).ToList();

                if (canlogin != null)
                {

                    foreach (candidate_login canlog in canlogin)
                    {

                        videoList = context.video_interview.Where(c => c.candidate_id == canlog.rec_id).ToList();
                        if (videoList != null)
                        {
                            foreach (video_interview videoInter in videoList)
                            {
                                string[] valarray = videoInter.question_vedio_URL.Split('.');
                                 valarrayvalues = valarray[0]+".mp4";

                                totalVideominute += getvideoMinutes(VideoURL + valarrayvalues);

                            }


                            }


                        }

                    }

                
            }
            catch(Exception ex) { }

            getMinutes = Convert.ToString(Math.Round(totalVideominute,2));

            return getMinutes;

        }
        public double getvideoMinutes(string vPath)
        {
            double returnval = 0.00;
            var nanoseconds=0.00;
            ShellFile so = ShellFile.FromFilePath(vPath);
            double.TryParse(so.Properties.System.Media.Duration.Value.ToString(), out nanoseconds);

            if (nanoseconds > 0)
            {
                double seconds = Convert100NanosecondsToMilliseconds(nanoseconds) / 1000;
                int ttl_seconds = Convert.ToInt32(seconds);
                TimeSpan time = TimeSpan.FromSeconds(ttl_seconds);
                returnval += time.TotalMinutes;
            }


            

            return returnval*2;
        }
        public static double Convert100NanosecondsToMilliseconds(double nanoseconds)
        {
            return nanoseconds * 0.0001;
        }
    }
}