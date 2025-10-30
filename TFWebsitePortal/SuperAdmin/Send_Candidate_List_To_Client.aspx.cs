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


namespace Extuent.Admin
{
    public partial class Send_Candidate_List_To_Client : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected job_post Jpost = new job_post();
        protected List<job_post> JobpostList = new List<job_post>();
        public List<category> categoryList = new List<category>();
        protected candidate_job_apply CandidateJobapply = new candidate_job_apply();
        protected candidate_login canlogin = new candidate_login();
        protected List<candidate_login> canloginList = new List<candidate_login>();
        protected candidate_login canloginNow = new candidate_login();
        public category category = new category();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {

                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        canloginNow = context.candidate_login.Where(c => c.rec_id == ReqId).FirstOrDefault();

                        if (canloginNow != null)
                        {
                            canloginNow.active = 0;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    if (Request.QueryString["email"] != null)
                    {
                        
                    }
                    categoryList = context.categories.Where(c => c.active == true).ToList();

                    ddlCategory.DataSource = categoryList;
                    ddlCategory.DataValueField = "id";
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, "Select");


                    JobpostList = context.job_post.Where(c => c.active == true).ToList();

                    //ddlAllJob.DataSource = JobpostList;
                    //ddlAllJob.DataValueField = "rec_id";
                    //ddlAllJob.DataTextField = "job_title";
                    //ddlAllJob.DataBind();
                }

                getList();
            }
            catch { }
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
                body += "</td><td>Please upload your video again, Click on this link <a href=https://hiretickle.com/admin/profile-for-company?vid" + recid + ">Click Here</a>";
                body += "</td></tr></table></center></body></html>";






                //RecieverEmail = "abhisheksharma.swv@gmail.com";
                var fromAddress = new MailAddress(mailaddress);
                var toAddress = new MailAddress(RecieverEmail);
                const string subject = "Candidate Profile From Extuent INC";
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
        public void getList()
        {
            canloginList = context.candidate_login.Where(c => c.active == 1 ).OrderByDescending(c => c.rec_id).ToList();

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
                string categoryvalue = ddlCategory.SelectedValue.ToString();
                string dateFrom = date1.Value;
                string dateTo = date2.Value;


                if (dateFrom != "" && dateTo != "")
                {

                    if (Convert.ToDateTime(dateFrom) > Convert.ToDateTime(dateTo))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('To Date Must be greater than from From Date..')", true);
                        return;
                    }
                }
                else if (dateFrom == "" && dateTo != "")
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select From Date first..')", true);
                    return;
                }
                else if (dateFrom != "" && dateTo == "")
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please select To Date first..')", true);
                    return;
                }
                if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex != 0 && DropDownList1.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    string status = DropDownList1.SelectedValue;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2) && c.available_for_job_type == categoryvalue && c.status == status).ToList();

                    //string jobvalue = ddljobType.SelectedValue.ToString();
                }
                else if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex == 0 && DropDownList1.SelectedIndex != 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    string status = DropDownList1.SelectedValue;
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2) && c.status == status).ToList();

                    //string jobvalue = ddljobType.SelectedValue.ToString();
                }
                else if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex == 0)
                {
                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2)).ToList();
                }
                else if (dateFrom != "" && dateTo != "" && ddlCategory.SelectedIndex != 0)
                {

                    DateTime d1 = Convert.ToDateTime(dateFrom);
                    DateTime d2 = Convert.ToDateTime(dateTo);
                    canloginList = context.candidate_login.Where(c => c.active == 1 && (c.doc >= d1 && c.doc <= d2) && c.available_for_job_type == categoryvalue).ToList();
                }
                else if (ddlCategory.SelectedIndex != 0 && DropDownList1.SelectedIndex != 0)
                {
                    string status = DropDownList1.SelectedValue;
                    //  string category = ddlCategory.SelectedValue;

                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue && c.status == status).ToList();

                }
                else if (DropDownList1.SelectedIndex != 0)
                {
                    string status = DropDownList1.SelectedValue;


                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.status == status).ToList();

                }
                else
                    canloginList = context.candidate_login.Where(c => c.active == 1 && c.available_for_job_type == categoryvalue).ToList();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + ex.Message + "')", true);
                return;
            }
        }

        protected void btnSendProfile_Click(object sender, EventArgs e)
        {
            // Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id is not configured!..')", true);
            if (hdnCheckRecId.Value != "")
            {

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('"+ hdnCheckRecId.Value + "')", true);

                  Response.Redirect("Email-Send?emailhidden="+ hdnCheckRecId.Value + "", true);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (hdnCheckRecId.Value != "")
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + hdnCheckRecId.Value + "')", true);

                //  Response.Redirect("Email-Send?emailhidden="+ hdnCheckRecId.Value + "", true);
            }
        }
    }
}