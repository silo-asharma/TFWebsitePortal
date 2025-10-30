using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent
{
    public partial class testwebwork : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected add_questions JQuestion = new add_questions();
        protected List<add_questions> QuestionList = new List<add_questions>();
        protected List<job_post> JobpostList = new List<job_post>();
        protected job_post JobPost = new job_post();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected candidate_login canlogincheck = new candidate_login();
        protected string rolelist = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (skills_master role in context.skills_master.ToList())
            {
                rolelist += "<option value = '" + role.skill_name + "'>" + role.skill_name + " </option>";
            }
        }
    }
}