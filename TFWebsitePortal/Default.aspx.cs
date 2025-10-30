using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent
{
    public partial class Default : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected add_questions JQuestion = new add_questions();
        protected List<add_questions> QuestionList = new List<add_questions>();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {



                    JobpostList = context.job_post.Where(c => c.active == true).ToList();



                }

               
            }
            catch { }
        }
    }
}