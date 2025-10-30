using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
namespace Extuent.SuperAdmin
{
    public partial class company_details : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        public List<user_login> usrloginlist = new List<user_login>();
        public employer_login emplogin = new employer_login();
        protected employer_plan_details emPlanDetails = new employer_plan_details();
        protected List<job_post> jobpostList = new List<job_post>();
        protected List<employer_payment_history> emppaymentList = new List<employer_payment_history>();
        protected employer_plan_details plandetails = new employer_plan_details();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
           



                    getList();


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
        public void getList()
        {
            try
            {
                if (Request.QueryString["Edit"] != null)
                {
                    int comprecid = Convert.ToInt32(Request.QueryString["Edit"]);

                    emplogin = context.employer_login.Where(c => c.rec_id == comprecid && c.active == true).FirstOrDefault();
                    if (emplogin != null)
                    {
                        txtCompanyName.Value = emplogin.company_name;
                        txtDomain.Value = emplogin.company_domain_url;
                        txtLastACtivity.Value = "";
                        txtMinutes.Value = "500";
                        txtPlan.Value = "Basic";
                        txtStartDate.Value = Convert.ToDateTime(emplogin.doc).ToString("dd/MM/yyyy");

                    }

                    usrloginlist = context.user_login.Where(c => c.active == true && c.company_recid == comprecid).ToList();
                    jobpostList = context.job_post.Where(c => c.active == true && c.employer_login_rec_id == comprecid).ToList();
                    emppaymentList = context.employer_payment_history.Where(c => c.active == 1 && c.employer_recid == comprecid).ToList();

                }
            }
            catch { }
        }
    }
}