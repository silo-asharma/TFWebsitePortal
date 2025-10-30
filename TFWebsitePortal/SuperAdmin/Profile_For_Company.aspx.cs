using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Reflection;
using System.Web.Services;

namespace Extuent.Admin
{
    public partial class Profile_For_Company : System.Web.UI.Page
    {
        public db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        protected List<video_interview> VideoInterViewList = new List<video_interview>();
        protected video_interview videoInterviewnNow = new video_interview();
        protected add_questions ques = new add_questions();
        protected List<candidate_experience> canExpList = new List<candidate_experience>();
        public string[] evalutions;
        public List<string> evalutiontext = new List<string>();
        public category category = new category();
        public string urlResume = "";
        public string urlImage = "";
        public string vid = "";
        public string videoURL = "https://extuent.ai/admin/Upload_video/EXTUENT/PortalUploads/";
        public string ImageURL = "https://extuent.ai/admin/Upload/PortalProfile/";
        public string DocURL = "https://extuent.ai/admin/Upload/PortalDocument/";
        // public string videoURL = "http://44.204.70.197/";
        DataView dv;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Image2.ImageUrl = "assets / images / abhishek.png";
                    img1.ImageUrl = "assets / images / abhishek.png";


                    if (Request.QueryString["vid"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                        vid = ReqId.ToString();

                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (canloginNow != null)
                        {
                            int jobrecid = Convert.ToInt32(context.candidate_job_apply.Where(c => c.candidate_rec_id == canloginNow.rec_id).FirstOrDefault().job_post_rec_id);
                            lblPost.Text = context.job_post.Where(c => c.rec_id == jobrecid).FirstOrDefault().job_title;

                            lblName.Text = canloginNow.name;
                            lblresume.Text = canloginNow.name;
                            urlResume = canloginNow.candidate_resume_url;
                            lblPhone.Text = canloginNow.mobile_no;
                            Session["Emailsend"] = lblEmail.Text = canloginNow.email;
                            lblLocation.Text = canloginNow.location;

                            lblDegree.Text = canloginNow.hq_degree;
                            lblInst.Text = canloginNow.hq_institute;
                            lblYear.Text = canloginNow.hq_year;

                            lbltotalctc.Text = canloginNow.total_ctc;
                            lblvarctc.Text = canloginNow.variable_ctc;
                            lblfixedctc.Text = canloginNow.fixed_ctc;
                            lblnoticeperiod.Text = canloginNow.notice_period;

                            lblskills.InnerText = canloginNow.hq_skill;

                            Image2.ImageUrl = ImageURL + canloginNow.candidate_profile_pic_url;
                            img1.ImageUrl = ImageURL + canloginNow.candidate_profile_pic_url;
                            lnkresume.HRef = DocURL + canloginNow.candidate_resume_url;
                            lnkresume2.HRef = DocURL + canloginNow.candidate_resume_url;



                            ddlRating.SelectedValue = canloginNow.rating;
                            ddlResult.SelectedValue = canloginNow.result;
                            txtcomment.Text = canloginNow.comment;

                            try
                            {

                                canExpList = context.candidate_experience.Where(c => c.candidate_id == canloginNow.rec_id && c.is_active == true).OrderByDescending(c => c.id).Take(3).ToList();
                                if (canExpList != null)
                                {
                                    for (int l = 1; l <= canExpList.Count; l++)
                                    {
                                        if (l == 1)
                                        {
                                            exp1.Text = Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + ", " + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString();
                                        }
                                        if (l == 2)
                                        {
                                            exp2.Text = Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + ", " + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString();
                                        }
                                        if (l == 3)
                                        {
                                            exp3.Text = Convert.ToDateTime(canExpList[l].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[l].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[l].end_date).Year.ToString() + ", " + canExpList[l].job_title.ToString() + ", " + canExpList[l].company_name.ToString();
                                        }
                                    }

                                }
                            }
                            catch { }


                            videoInterviewnNow = context.video_interview.Where(c => c.candidate_id == ReqId).FirstOrDefault();
                            if (videoInterviewnNow != null)
                            {
                                VideoPlayer.Src = videoURL + videoInterviewnNow.question_vedio_URL;
                                lblquestion.InnerText = context.add_questions.Where(c => c.id == videoInterviewnNow.question_id).FirstOrDefault().question;


                            }

                            evalutions = context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id).evalauation.Split(',');
                            int EV_ID = 0;
                            int ii = 0;
                            foreach (string ev in evalutions)
                            {
                                EV_ID = Convert.ToInt32(ev);
                                evalutiontext.Add(context.evaluations.FirstOrDefault(el => el.id == EV_ID).evaluation_name);
                                ii++;
                            }

                        }



                        VideoInterViewList = context.video_interview.Where(c => c.candidate_id == ReqId).ToList();
                        try
                        {

                            Session["Next"] = "1";
                            Session["Back"] = "0";
                            var result = (from a in VideoInterViewList

                                          select new { a.id, a.question_vedio_URL, a.question_id }).ToList();

                            DataTable dt = ToDataTable(result);

                            DataTable dt1 = new DataTable();
                            dt1.Clear();

                            dt1.Columns.Add("SNO");
                            dt1.Columns.Add("Id");
                            dt1.Columns.Add("QId");
                            dt1.Columns.Add("URL");
                            int j = 1;

                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                DataRow _row = dt1.NewRow();
                                _row["SNO"] = j;
                                _row["Id"] = dt.Rows[i]["id"];
                                _row["QId"] = dt.Rows[i]["question_id"];
                                _row["URL"] = dt.Rows[i]["question_vedio_URL"];

                                dt1.Rows.Add(_row);


                                j++;

                            }

                            Session["dt1"] = dt1;


                        }
                        catch (Exception ex) { }

                        if (Request.QueryString["VideoId"] != null)
                        {
                            int VReqId = Convert.ToInt32(Request.QueryString["VideoId"]);
                            videoInterviewnNow = context.video_interview.Where(c => c.id == VReqId).FirstOrDefault();
                            if (videoInterviewnNow != null)
                            {
                                VideoPlayer.Src = videoURL + videoInterviewnNow.question_vedio_URL;
                                lblquestion.InnerText = context.add_questions.Where(c => c.id == videoInterviewnNow.question_id).FirstOrDefault().question;
                            }

                        }
                        else
                        {

                        }
                    }





                }
                else
                {
                    if (Request.QueryString["vid"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                        vid = ReqId.ToString();

                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (canloginNow != null)
                        {
                            VideoInterViewList = context.video_interview.Where(c => c.candidate_id == ReqId).ToList();


                        }
                    }
                }
                getList();

                //VideoPlayer.Src = videoURL+"LiveVideo/test112334.webm";
            }
            catch (Exception ex) { }

        }

        public DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }
        public void getList()
        {
            canloginList = context.candidate_login.Where(c => c.active == 1 && c.status == "Complete").ToList();

        }

        protected void sendnotification_Click(object sender, EventArgs e)
        {

            if (Request.QueryString["vid"] != null)
            {
                int ReqId = Convert.ToInt32(Request.QueryString["vid"]);


                bool isemail = isWelcomeMailsent(Session["Emailsend"].ToString(), ReqId);
                if (isemail == true)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email sent successfully!..')", true);
                }
            }
        }
        public bool isWelcomeMailsent(string RecieverEmail, int recid)
        {

            // Welcome Email
            bool result = false;
            try
            {
                var mailaddress = System.Configuration.ConfigurationManager.AppSettings["EmailId"].ToString();
                var smtpHost = System.Configuration.ConfigurationManager.AppSettings["smtp"].ToString();
                var smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"].ToString());
                var mailpassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

                string body = "";


                body += "<html><head></head><body><center><table style='height:auto;width:600px;'><tr><td><span style='font-family:arial;font-size:14px;'><b>Dear Hello</b></span><br><br>";
                body += "</td><td>Please upload your video again, Click on this link <a href=https://hiretickle.com/Create_Video_Interview?CandidateId" + recid + ">Click Here</a>";
                body += "</td></tr></table></center></body></html>";






                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                var fromAddress = new MailAddress(mailaddress);
                var toAddress = new MailAddress(RecieverEmail);
                const string subject = "Welcome Mail From Extuent INC";
                var smtp = new SmtpClient
                {
                    Host = smtpHost,
                    Port = smtpPort,
                    EnableSsl = true, //chk_usessl
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, mailpassword)
                };

                ///  Attachment attach = new Attachment(file path);
                MailMessage mail = new MailMessage(fromAddress, toAddress);


                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.Body = body;
                mail.Subject = subject;
                smtp.Send(mail);
                result = true;

            }
            catch (Exception ex)
            { }

            return result;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtcomment.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Comment must be filled out')", true);
                    return;
                }
                if (Request.QueryString["vid"] != null)
                {
                    int ReqId = Convert.ToInt32(Request.QueryString["vid"]);
                    vid = ReqId.ToString();

                    canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                    if (canloginNow != null)
                    {

                        canloginNow.result = ddlResult.SelectedValue;
                        canloginNow.rating = ddlRating.SelectedValue;
                        canloginNow.comment = txtcomment.Text;

                        context.SaveChanges();

                        txtcomment.Text = "";
                        ddlResult.SelectedIndex = 0;
                        ddlRating.SelectedIndex = 0;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Result Saved!!')", true);

                    }
                }



            }
            catch (Exception ex) { }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            try
            {
                //string ab = ;
                int va;
                dv = new DataView((DataTable)Session["dt1"]);

                if (dv.Count > 0)
                {
                    if (Session["Back"].ToString() != "0")
                    {


                        string btNext = Session["Next"].ToString();
                        string btBack = Session["Back"].ToString();


                        dv.Sort = "SNO";
                        int index = dv.Find(btBack);
                        if (index > -1)
                        {
                            va = Convert.ToInt32(dv[index]["QId"]);
                            VideoPlayer.Src = videoURL + dv[index]["URL"];
                            lblquestion.InnerText = context.add_questions.Where(c => c.id == va).FirstOrDefault().question;
                        }



                        //--------------
                        Session["Next"] = btBack;
                        Session["Back"] = Convert.ToInt32(btBack) - 1;
                    }
                }
            }
            catch (Exception ex) { }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int va;
            dv = new DataView((DataTable)Session["dt1"]);
            if (dv.Count > 0)
            {
                if (Session["Next"].ToString() != dv.Count.ToString())
                {
                    string btNext = Session["Next"].ToString();
                    string btBack = Session["Back"].ToString();



                    //string ab = ;

                    dv.Sort = "SNO";
                    int index = dv.Find(btNext);
                    if (index > -1)
                    {
                        va = Convert.ToInt32(dv[index]["QId"]);
                        VideoPlayer.Src = videoURL + dv[index]["URL"];
                        lblquestion.InnerText = context.add_questions.Where(c => c.id == va).FirstOrDefault().question;

                    }



                    //--------------
                    Session["Back"] = btNext;
                    Session["Next"] = Convert.ToInt32(btNext) + 1;

                }
            }
        }

        public string getQuestionName(string jobTypeN)
        {
            string categoryName = "";
            if (jobTypeN != null && jobTypeN != "")
            {
                int jobType = Convert.ToInt32(jobTypeN);

                ques = context.add_questions.Where(c => c.id == jobType).FirstOrDefault();
                if (ques != null)
                {
                    categoryName = ques.question;
                }
            }
            return categoryName;
        }
        [WebMethod]
        public static string assignUrl(string QID, int CandidateID)
        {
            string videoURL = "http://localhost:60242/admin/Upload/";
            string url = "";
            db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
            video_interview videoInterviewnNow = new video_interview();
            int qid = Convert.ToInt32(QID);
            videoInterviewnNow = context.video_interview.Where(c => c.question_id == qid && c.candidate_id == CandidateID).FirstOrDefault();
            if (videoInterviewnNow != null)
                url = videoURL + videoInterviewnNow.question_vedio_URL;


            return url;
        }
        [WebMethod]
        public static string SaveRatings(string rating_string, string rating_Questions, string Comments, string Status, int Candidate_ID)
        {
            string str = "";
            db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
            candidate_login canloginNow = new candidate_login();
            canloginNow = context.candidate_login.Where(c => c.rec_id == Candidate_ID).FirstOrDefault();

            if (canloginNow != null)
            {

                canloginNow.result = Status;
                canloginNow.rating = rating_string;
                canloginNow.comment = rating_Questions;
                canloginNow.comment_display = Comments;
                context.SaveChanges();
                str = "Pass";



            }
            return str;
        }
    }
}