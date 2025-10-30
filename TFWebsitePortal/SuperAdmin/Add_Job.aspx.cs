using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.Admin
{
    public partial class Add_Job : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        protected List<job_post> JobpostList1 = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected List<Add_Job> add_job = new List<Add_Job>();
        protected List<add_questions> Questions_Category = new List<add_questions>();
        public List<skills_master> sklmaster = new List<skills_master>();
        protected List<evaluation> evaluation = new List<evaluation>();
        protected add_questions JQuestion = new add_questions();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                if (!IsPostBack)
                {
                  

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (Jpost != null)
                        {
                            Jpost.active = false;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    if (Request.QueryString["Activate"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Activate"]);


                        Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (Jpost != null)
                        {
                            Jpost.active = true;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Activated')", true);
                        }
                    }
                    if (Request.QueryString["DeActivate"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["DeActivate"]);


                        Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (Jpost != null)
                        {
                            Jpost.active = false;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deactivated')", true);
                        }
                    }
                    if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);


                        Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (Jpost != null)
                        {
                            txtjob_title.Value = Jpost.job_title;
                            txtcompany_name.Value = Jpost.company;
                            txtlocation.Value = Jpost.job_locations;
                            txtsalary.Value = Jpost.job_rate;
                            txtexperience.Value = Jpost.exprience;
                            ddljobType.SelectedValue = Jpost.job_type;
                            ddlCategory.SelectedValue = Jpost.job_category;
                            txtjobdesc.InnerHtml = Jpost.job_desc;

                            btnUpdate.Visible = true;
                            btnAdd.Visible = false;
                        }
                    }

                    categoryList = context.categories.Where(c => c.active == true).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select Category");



                    sklmaster = context.skills_master.ToList();

                    ddlskills.DataSource = sklmaster;
                    ddlskills.DataValueField = "id";
                    ddlskills.DataTextField = "skill_name";
                    ddlskills.DataBind();

                    ddlskills.Items.Insert(0, "Select");
                }

                getList();
            }
            catch { }
        }
        public void getList()
        {
            JobpostList = context.job_post.Where(c => c.active == true).ToList();
            JobpostList1 = context.job_post.Where(c => c.active == false).ToList();
        }
        public void Evalutions()
        {
            evaluation = context.evaluations.Where(c => c.active == 1).ToList();
          
        }
        public void clear()
        {
            txtjob_title.Value = "";
            txtlocation.Value="";
            txtsalary.Value="";
            txtexperience.Value="";
            txtjobdesc.InnerHtml="";
      
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            add_questions addquestion = new add_questions(); 
            string[] Question_ids = hidQuestion_ID.Value.TrimEnd(',').Split(',');
            string Evalution_ids = hidEvaluation_ID.Value.TrimEnd(',');
            try
            {
                Jpost = new job_post();
                Jpost.job_title = txtjob_title.Value;
                //Jpost.c =txtjobdesc.Text;
                Jpost.job_locations = txtlocation.Value;
                Jpost.job_rate = txtsalary.Value;
                Jpost.exprience = txtexperience.Value;
                Jpost.job_type = ddljobType.SelectedItem.Text;
                Jpost.job_category = ddlCategory.SelectedItem.Value;
                Jpost.job_desc = txtjobdesc.InnerHtml;
                Jpost.active = true;
                Jpost.evalauation = Evalution_ids;
                context.job_post.Add(Jpost);
                context.SaveChanges();
                int jobID = Jpost.rec_id;
                int rec_quest_id = 0;
                string quetion = "";
                foreach (string s in Question_ids)
                {

                    rec_quest_id = Convert.ToInt32(s);
                    addquestion.cat_id = context.add_questions.FirstOrDefault(p => p.id == rec_quest_id).cat_id;
                    addquestion.question = context.add_questions.FirstOrDefault(p => p.id == rec_quest_id).question;
                    addquestion.job_id = jobID;
                    addquestion.active = true;
                    //addquestion.timer = 5;
                    if (context.add_questions.Where(p => p.cat_id == addquestion.cat_id && p.job_id == jobID && p.question== addquestion.question).ToList().Count() == 0)
                    {
                        context.add_questions.Add(addquestion);
                        context.SaveChanges();
                    }
                }
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();
               
                clear();
            }
            catch (Exception ex) { }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                string[] Question_ids = hidQuestion_ID.Value.Split(',');
                string[] Evalution_ids = hidEvaluation_ID.Value.Split(',');
                foreach (string s in Question_ids)
                {

                }
                foreach (string s in Evalution_ids)
                { }
                Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                if (Jpost != null)
                {

                   
                    Jpost.job_title = txtjob_title.Value;
                    //Jpost.c =txtjobdesc.Text;
                    Jpost.job_locations = txtlocation.Value;
                    Jpost.job_rate = txtsalary.Value;
                    Jpost.exprience = txtexperience.Value;
                    Jpost.job_type = ddljobType.SelectedItem.Text;
                    Jpost.job_category = ddlCategory.SelectedItem.Value;
                    Jpost.job_desc = txtjobdesc.InnerHtml;
                    Jpost.active = true;

           
                    context.SaveChanges();
                    int jobid = Jpost.rec_id;
                    foreach(string s in Question_ids)
                    {

                    }
                    foreach (string s in Evalution_ids)
                    { }
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    getList();

                    clear();

                    btnUpdate.Visible = false;
                    btnAdd.Visible = true;
                }
            }
            catch (Exception ex) { }
        }

        protected void addquestion_Click(object sender, EventArgs e)
        {
            add_Questions_Evaluations();
            divquestion.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                JQuestion = new add_questions();
                JQuestion.cat_id = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                //Jpost. =txtjobdesc.Text;
                JQuestion.job_id = 0;
                JQuestion.question = txtquestion.Text;

                JQuestion.active = true;

                context.add_questions.Add(JQuestion);
                context.SaveChanges();
                add_Questions_Evaluations();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();
                add_Questions_Evaluations();
                clear();
            }
            catch (Exception ex) { }
            divquestion.Visible = false;
        }
        public void add_Questions_Evaluations()
        {
            List<add_questions> lst = new List<add_questions>();
            int cat_id = 0;
            if (hidcategoryID.Value != "")
            {
                cat_id = Convert.ToInt32(hidcategoryID.Value);
            }
            if (cat_id > 0)
                lst = context.add_questions.Where(q => q.cat_id == cat_id).Distinct().ToList();
            foreach (add_questions q in lst)
            {
                if (!Questions_Category.Exists(p => p.question == q.question))
                {
                    Questions_Category.Add(q);
                }
            }
            Evalutions();
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            add_Questions_Evaluations();
        }
    }
}