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
        public List<string> Questionslist = new List<string>();
        public List<string> evaluitions_id = new List<string>();
        public List<skills_master> sklList = new List<skills_master>();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
              


                if (!IsPostBack)
                {
                    ListBox1.Items.Insert(0, "Select Skills");

                    ListBox1.SelectedIndex = 0;


                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (Jpost != null)
                        {
                            Jpost.active = false;
                            Jpost.short_jobdesc = "Closed";
                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                            Response.Redirect("Dashboard");
                        }
                    }

                    if (Request.QueryString["Hold"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Hold"]);


                        Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (Jpost != null)
                        {
                            Jpost.active = false;
                            Jpost.short_jobdesc = "Hold";
                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                            Response.Redirect("Dashboard");
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

                    int companyRecId = Convert.ToInt32(Session["company_recid"]);
                    categoryList = context.categories.Where(c => c.active == true && c.company_rec_id== companyRecId).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select Category");



                    sklmaster = context.skills_master.ToList();

                    //ddlskills.DataSource = sklmaster;
                    //ddlskills.DataValueField = "id";
                    //ddlskills.DataTextField = "skill_name";
                    //ddlskills.DataBind();

                    //ddlskills.Items.Insert(0, "Select Skills");

                    if (Request.QueryString["Edit"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                        string fulldesc = "";

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
                            // CKEditor.Text= Jpost.job_desc.Trim();
                            if (Jpost.job_desc != null)
                            {
                                fulldesc = Jpost.job_desc;
                            
                                fulldesc = fulldesc.Replace("list-style-type: none;", "");
                                fulldesc = fulldesc.Replace("list-style-type: none", "");
                                fulldesc = fulldesc.Replace("list-style-type:none;", "");
                                fulldesc = fulldesc.Replace("list-style-type:none", "");
                                fulldesc = fulldesc.Replace("list-style:none;", "");
                                fulldesc = fulldesc.Replace("list-style:none", "");
                                fulldesc = fulldesc.Replace("list-style: none;", "");
                                fulldesc = fulldesc.Replace("list-style: none", "");

                                text.Text = fulldesc;
                                ASPxHtmlEditor1.Html = fulldesc;
                                hidJobDescriptions.Value = fulldesc;

                            }


                            selectskills();

                            if (Jpost.skills != null)
                            {
                                string[] roles = Jpost.skills.Split(',');
                                foreach (var li in roles)
                                {
                                    if (li != "")
                                    {
                                        if(ListBox1.Items.FindByValue(li)!=null)
                                            ListBox1.Items.FindByValue(li).Selected = true;
                                    }//ListBox1.se = li;

                                }
                           }
                           // ddlskills.SelectedItem.Text= Jpost.skills;
                            txtDedlines.Value = Jpost.job_deadline_date;
                            txtShortDesc.Value = Jpost.job_desc_short;

                            btnUpdate.Visible = true;
                            btnAdd.Visible = false;
                            evaluitions_id = Jpost.evalauation.Split(',').ToList();
                        }
                        int job_category_id = Convert.ToInt32(Jpost.job_category);
                        getQuestions(job_category_id);
                       Questionslist = context.add_questions.Where(a => a.job_id == ReqId && a.cat_id == job_category_id).Select(p=>p.question).ToList();
                       
                    }
                }

                getList();
            }
            catch(Exception ex) { }
        }

        public void getQuestions(int cat_id)
        {

            List<add_questions> lst = new List<add_questions>();
           
            if (cat_id > 0)
                lst = context.add_questions.Where(q => q.cat_id == cat_id && q.active == true).Distinct().ToList();
            foreach (add_questions q in lst)
            {
                if (!Questions_Category.Exists(p => p.question == q.question))
                {
                    Questions_Category.Add(q);
                }
            }
            Evalutions();
        }
        public void getList()
        {
            JobpostList = context.job_post.Where(c => c.active == true).ToList();
            JobpostList1 = context.job_post.Where(c => c.active == false).ToList();
        }
        public void Evalutions()
        {
            int cat_id = 0;
            if (hidcategoryID.Value != "")
            {
                cat_id = Convert.ToInt32(hidcategoryID.Value);
            }
            else
                cat_id = Convert.ToInt32(ddlCategory.SelectedValue);

            if (cat_id > 0)
                evaluation = context.evaluations.Where(c => c.active == 1 && c.category_id == cat_id).Distinct().ToList();
            //int ddlrec = Convert.ToInt32(ddlCategory.SelectedValue);



            // lst = context.add_questions.Where(q =>   q.active == true).Distinct().ToList();



        }
        public void clear()
        {
            txtjob_title.Value = "";
            txtlocation.Value="";
            txtsalary.Value="";
            txtexperience.Value="";
          //  txtjobdesc.InnerHtml="";
      
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select Category First!..')", true);
                return;
            }

            //string kl=  ListBox1.SelectedItem.Text;
            hidUsersRoles.Value = "";
            foreach (ListItem li in ListBox1.Items)
            {
                if (li.Text!= "Select Skills")
                {
                    if (li.Selected == true)
                    {
                        hidUsersRoles.Value += li.Value + ",";
                    }
                }
            }


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
                Jpost.company = txtcompany_name.Value;
                Jpost.job_desc = text.Text;
                Jpost.active = true;
                Jpost.evalauation = Evalution_ids;
                Jpost.skills = hidUsersRoles.Value;
                Jpost.job_deadline_date = txtDedlines.Value;
                Jpost.job_desc_short = txtShortDesc.Value;
                Jpost.doc = DateTime.Now;
                if (Session["company_recid"] != null)
                {
                    int comprecid = Convert.ToInt32(Session["company_recid"]);
                    Jpost.employer_login_rec_id = comprecid;
                }

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

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Success!', 'New Job Added to Dashboard.');", true);
               // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Success')", true);
                getList();
               
                clear();

                //Response.Redirect("dashboard");
            }
            catch (Exception ex) { }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                add_questions addquestion = new add_questions();
                add_questions addquestion1 = new add_questions();
                List<add_questions> addquestion12 = new List<add_questions>();
                int ReqId = Convert.ToInt32(Request.QueryString["Edit"]);
                string[] Question_ids = hidQuestion_ID.Value.TrimEnd(',').Split(',');
                string Evalution_ids = hidEvaluation_ID.Value.TrimEnd(',');
               
                int rec_quest_id = 0;
                int rec_quest_id1 = 0;
                string quetion = "";

                hidUsersRoles.Value = "";
                foreach (ListItem li in ListBox1.Items)
                {
                    if (li.Text != "Select Skills")
                    {
                        if (li.Selected == true)
                        {
                            hidUsersRoles.Value += li.Value + ",";
                        }
                    }
                }

                Jpost = context.job_post.Where(c => c.rec_id == ReqId).FirstOrDefault();

                if (Jpost != null)
                {
                    //if (context.add_questions.Where(p =>  p.job_id == ReqId).ToList().Count() > 0)
                    //{
                    //    addquestion12 = context.add_questions.Where(p => p.job_id == ReqId).ToList();
                    //    if (addquestion12 != null)
                    //    {
                    //        foreach (add_questions t in addquestion12)
                    //        {

                    //            t.active = false;
                    //            context.SaveChanges();

                    //        }
                          
                    //    }
                    //}

                    Jpost.job_title = txtjob_title.Value;
                    //Jpost.c =txtjobdesc.Text;
                  //      Jpost.job_locations = txtlocation.Value;
                    Jpost.job_rate = txtsalary.Value;
                    Jpost.exprience = txtexperience.Value;
                    Jpost.job_type = ddljobType.SelectedItem.Text;
                    //  Jpost.job_category = ddlCategory.SelectedItem.Value;
                    // Jpost.job_desc = CKEditor.Text.Trim();
                    Jpost.company = txtcompany_name.Value;
                    Jpost.job_desc = text.Text;
                    Jpost.active = true;
                    Jpost.evalauation = Evalution_ids;
                    if(hidUsersRoles.Value!="")
                        Jpost.skills = hidUsersRoles.Value; 

                    Jpost.job_deadline_date = txtDedlines.Value;
                    Jpost.job_desc_short = txtShortDesc.Value;


                    context.SaveChanges();
                    //int jobid = Jpost.rec_id;
                    foreach (string s in Question_ids)
                    {

                      
                       

                        rec_quest_id = Convert.ToInt32(s);
                        addquestion.cat_id = context.add_questions.FirstOrDefault(p => p.id == rec_quest_id).cat_id;
                        addquestion.question = context.add_questions.FirstOrDefault(p => p.id == rec_quest_id).question;
                        addquestion.job_id = ReqId;
                        addquestion.active = true;
                        //addquestion.timer = 5;
                        if (context.add_questions.Where(p => p.cat_id == addquestion.cat_id && p.job_id == ReqId && p.question == addquestion.question).ToList().Count() == 0)
                        {
                            context.add_questions.Add(addquestion);
                            context.SaveChanges();
                        }
                        //else
                        //{
                        //    addquestion1 = context.add_questions.Where(p => p.id== rec_quest_id).FirstOrDefault();
                        //    addquestion1.active = true;
                        //    context.SaveChanges();
                        //}

                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Updated!', 'Edits to Job Updated Successfully.');", true);
                   // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);
                    getList();

                    clear();

                    btnUpdate.Visible = false;
                    btnAdd.Visible = true;

                    Response.Redirect("dashboard");
                }
            }
            catch (Exception ex) { Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert(ex.Message)", true);  }
        }

        protected void addquestion_Click(object sender, EventArgs e)
        {
            add_Questions_Evaluations();
            divquestion.Visible = true;
        }
        // Add question 
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
               // getList();
                add_Questions_Evaluations();
                //clear();
                //txtjobdesc.InnerHtml=hidJobDescriptions.Value; 

                getQuestions(Convert.ToInt32(ddlCategory.SelectedItem.Value));

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
            {
                lst = context.add_questions.Where(q => q.cat_id == cat_id && q.active == true).Distinct().ToList();
               

            }
            foreach (add_questions q in lst)
            {
                if (!Questions_Category.Exists(p => p.question == q.question))
                {
                    Questions_Category.Add(q);
                }
            }
            Evalutions();

            
        }
        private void selectskills()
        {
            try
            {
            
                int ddlrec = Convert.ToInt32(ddlCategory.SelectedValue);
                sklList = context.skills_master.Where(q => q.category_id == ddlrec && q.active == 1).ToList();
                if (sklList != null)
                {
                    ListBox1.DataSource = sklList;
                    ListBox1.DataValueField = "id";
                    ListBox1.DataTextField = "skill_name";
                    ListBox1.DataBind();

                    ListBox1.Items.Insert(0, "Select Skills");

                    ListBox1.SelectedIndex = 0;

                }
                else
                {
                    ListBox1.DataSource = null;
                    ListBox1.DataBind();
                }
                //sklmaster = context.skills_master.Where(q => q.category_id == ddlrec && q.active == 1).ToList();
            }
            catch
            {

                ListBox1.DataSource = null;
                ListBox1.DataBind();
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                add_Questions_Evaluations();
                int ddlrec = Convert.ToInt32(ddlCategory.SelectedValue);
                sklList = context.skills_master.Where(q => q.category_id == ddlrec && q.active == 1).ToList();
                if (sklList != null)
                {
                    ListBox1.DataSource = sklList;
                    ListBox1.DataValueField = "id";
                    ListBox1.DataTextField = "skill_name";
                    ListBox1.DataBind();

                    ListBox1.Items.Insert(0, "Select Skills");

                    ListBox1.SelectedIndex = 0;
                }
                else
                {
                    ListBox1.DataSource = null;
                    ListBox1.DataBind();
                }
                //sklmaster = context.skills_master.Where(q => q.category_id == ddlrec && q.active == 1).ToList();
            }
            catch
            {

                ListBox1.DataSource = null;
                ListBox1.DataBind();
            }
        }

        protected void btnalertCheck_Click(object sender, EventArgs e)
        {
           
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Success', 'Success');", true);
        }

    }
}