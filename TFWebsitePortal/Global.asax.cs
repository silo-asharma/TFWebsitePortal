using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Extuent
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }
        static void RegisterRoutes(RouteCollection routes)
        {

            //Website link
            //routes.MapPageRoute("home", "login", "~/index.aspx");
            routes.MapPageRoute("index", "index", "~/index.aspx");
            routes.MapPageRoute("pricing", "pricing", "~/Pricing.aspx");
            routes.MapPageRoute("pricingyear", "pricingyear", "~/PricingYear.aspx");
            routes.MapPageRoute("contact", "contact", "~/ContactUs.aspx");
            routes.MapPageRoute("login2", "login2", "~/logintest.aspx");

            routes.MapPageRoute("login", "login", "~/sign-in.aspx");
            routes.MapPageRoute("Create_Profile", "Create_Profile", "~/Create_Profile.aspx");
            routes.MapPageRoute("post-free-job", "post-free-job", "~/post-a-job.aspx");
            routes.MapPageRoute("job-list", "job-list", "~/job-list.aspx");
            routes.MapPageRoute("joblist", "joblist", "~/extuent_job.aspx");
            routes.MapPageRoute("Home", "Home", "~/Default.aspx");
            //routes.MapPageRoute("terms-and-conditions", "terms-and-conditions", "~/terms-and-conditions.aspx");
            routes.MapPageRoute("privacy-policy", "privacy-policy", "~/privacy-policy.aspx");
            routes.MapPageRoute("company-details", "company-details", "~/company-details.aspx");
            routes.MapPageRoute("create-account-For-Job-Post", "create-account-For-Job-Post", "~/employerSignup.aspx");
            routes.MapPageRoute("apply-job", "apply-job", "~/ApplyJob.aspx");
            routes.MapPageRoute("admin/dashboard", "admin/dashboard", "~/admin/dashboard.aspx");
            routes.MapPageRoute("Create_Video_Interview", "Create_Video_Interview", "~/Create_Video_Interview.aspx");
            routes.MapPageRoute("Thank_You", "Thank_You", "~/thank_you.aspx");
            routes.MapPageRoute("Job_List", "Job_List", "~/job.aspx");
            routes.MapPageRoute("Welcome-Video", "Welcome-Video", "~/Welcome_Video.aspx");
            routes.MapPageRoute("create-account", "create-account", "~/Company_signup.aspx");
            routes.MapPageRoute("terms-and-conditions", "terms-and-conditions", "~/termsandconditions.aspx");
            routes.MapPageRoute("forgot-password", "forgot-password", "~/reset-password.aspx");
            routes.MapPageRoute("feedback-or-support", "feedback-or-support", "~/contact_support.aspx");
            routes.MapPageRoute("job-Details", "job-Details", "~/jobDetails.aspx");
            routes.MapPageRoute("ShareProfile", "ShareProfile", "~/Share_Profile.aspx");
            routes.MapPageRoute("JobDetails", "JobDetails", "~/jobDetails.aspx");
            routes.MapPageRoute("CandidateProfile", "CandidateProfile", "~/admin/Multiple_Candidate_List_For_Client.aspx");
            routes.MapPageRoute("profile-for-company", "profile-for-company", "~/admin/Profile_For_Company.aspx");
            routes.MapPageRoute("Multple-Candidate_List", "multple-Candidate_List", "~/admin/Multiple_Candidate_List_For_Client.aspx");

            //Admin dashboard
            routes.MapPageRoute("admin/dashboardlist", "admin/dashboardlist", "~/admin/dashboardList.aspx");
            routes.MapPageRoute("admin/candidate-profile", "admin/candidate-profile", "~/admin/Candidate_Profile.aspx");
            routes.MapPageRoute("admin/profile-for-company", "admin/profile-for-company", "~/admin/Profile_For_Company.aspx");
            routes.MapPageRoute("admin/video-interview-list", "admin/video-interview-list", "~/admin/Video_Interview_List.aspx");


            routes.MapPageRoute("admin/send-profile", "admin/send-profile", "~/admin/Send_Candidate_List_To_Client.aspx");
            routes.MapPageRoute("admin/notification-list", "admin/notification-list", "~/admin/Notification_List.aspx");
            routes.MapPageRoute("admin/add-job", "admin/add-job", "~/admin/Add_Job.aspx");
            routes.MapPageRoute("admin/add-question", "admin/add-question", "~/admin/Add_Question.aspx");
            routes.MapPageRoute("admin/add-category", "admin/add-category", "~/admin/Add_Category.aspx");
            routes.MapPageRoute("admin/Search-Report", "admin/Search-Report", "~/admin/Search_Report.aspx");
            routes.MapPageRoute("admin/User-Setting", "admin/User-Setting", "~/admin/Setting.aspx");
            routes.MapPageRoute("admin/Email-Send", "admin/Email-Send", "~/admin/EmailSendToClient.aspx");
            routes.MapPageRoute("admin/Multple-Candidate_List", "admin/Multple-Candidate_List", "~/admin/Multiple_Candidate_List_For_Client.aspx");

            routes.MapPageRoute("admin/add-skills", "admin/add-skills", "~/admin/Add_Skills.aspx");
            routes.MapPageRoute("admin/add-evaluation", "admin/add-evaluation", "~/admin/Add_Evaluation.aspx");
            routes.MapPageRoute("admin/candidate-interview-list", "admin/candidate-interview-list", "~/admin/Candidate_Interview_List.aspx");
            routes.MapPageRoute("admin/User-Profile", "admin/User-Profile", "~/admin/userprofile.aspx");
            routes.MapPageRoute("admin/Email-Setting", "admin/Email-Setting", "~/admin/email_notification.aspx");
            routes.MapPageRoute("admin/faq", "admin/faq", "~/admin/faq.aspx");
          
            routes.MapPageRoute("admin/Branding", "admin/Branding", "~/admin/branding.aspx");
            routes.MapPageRoute("admin/Billing", "admin/Billing", "~/admin/billing.aspx");
            

            //super Admin
            routes.MapPageRoute("superadmin/dashboard", "superadmin/dashboard", "~/SuperAdmin/dashboard.aspx");
            routes.MapPageRoute("superadmin/candidate-profile", "superadmin/candidate-profile", "~/SuperAdmin/Candidate_Profile.aspx");
            routes.MapPageRoute("superadmin/profile-for-company", "superadmin/profile-for-company", "~/SuperAdmin/Profile_For_Company.aspx");
            routes.MapPageRoute("superadmin/video-interview-list", "superadmin/video-interview-list", "~/SuperAdmin/Video_Interview_List.aspx");


            routes.MapPageRoute("superadmin/send-profile", "superadmin/send-profile", "~/SuperAdmin/Send_Candidate_List_To_Client.aspx");
            routes.MapPageRoute("superadmin/notification-list", "superadmin/notification-list", "~/SuperAdmin/Notification_List.aspx");
            routes.MapPageRoute("superadmin/add-job", "superadmin/add-job", "~/SuperAdmin/Add_Job.aspx");
            routes.MapPageRoute("superadmin/add-question", "superadmin/add-question", "~/SuperAdmin/Add_Question.aspx");
            routes.MapPageRoute("superadmin/add-category", "superadmin/add-category", "~/SuperAdmin/Add_Category.aspx");
            routes.MapPageRoute("superadmin/Search-Report", "superadmin/Search-Report", "~/SuperAdmin/Search_Report.aspx");
            routes.MapPageRoute("superadmin/User-Setting", "superadmin/User-Setting", "~/SuperAdmin/Setting.aspx");
            routes.MapPageRoute("superadmin/Email-Send", "superadmin/Email-Send", "~/SuperAdmin/EmailSendToClient.aspx");
            routes.MapPageRoute("superadmin/Multple-Candidate_List", "superadmin/Multple-Candidate_List", "~/SuperAdmin/Multiple_Candidate_List_For_Client.aspx");

            routes.MapPageRoute("superadmin/add-skills", "superadmin/add-skills", "~/SuperAdmin/Add_Skills.aspx");
            routes.MapPageRoute("superadmin/add-evaluation", "superadmin/add-evaluation", "~/SuperAdmin/Add_Evaluation.aspx");
            routes.MapPageRoute("superadmin/candidate-interview-list", "superadmin/candidate-interview-list", "~/SuperAdmin/Candidate_Interview_List.aspx");
            routes.MapPageRoute("superadmin/User-Profile", "superadmin/User-Profile", "~/SuperAdmin/userprofile.aspx");
            routes.MapPageRoute("superadmin/Email-Setting", "superadmin/Email-Setting", "~/SuperAdmin/email_notification.aspx");
            routes.MapPageRoute("superadmin/Company-Details", "superadmin/Company-Details", "~/SuperAdmin/company-details.aspx");



        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}