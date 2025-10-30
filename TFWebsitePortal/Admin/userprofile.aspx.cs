using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
using System.IO;

namespace Extuent.Admin
{
    public partial class userprofile : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected user_type usrtype = new user_type();
        protected category cty = new category();
        public List<user_login> usrloginlist = new List<user_login>();
        public List<user_type> usrtypelist = new List<user_type>();
        public employer_login company = new employer_login();
        string datename = DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {

                   
                    usrtypelist = context.user_type.Where(c => c.active == true).ToList();

                    //ddlRole.DataSource = usrtypelist;
                    //ddlRole.DataValueField = "id";
                    //ddlRole.DataTextField = "user_type_name";
                    //ddlRole.DataBind();

                    //ddlRole.Items.Insert(0, "Select");


                    if (Request.QueryString["Del"] != null)
                    {
                        int ReqId = Convert.ToInt32(Request.QueryString["Del"]);


                        usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            usr.active = false;

                            context.SaveChanges();

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Deleted')", true);
                        }
                    }
                    if (Session["user-recid"] != null)
                    {
                        int ReqId = Convert.ToInt32(Session["user-recid"]);


                        usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();

                        if (usr != null)
                        {
                            company = context.employer_login.Where(c => c.rec_id == usr.company_recid).FirstOrDefault();
                            if (company != null)
                            {
                                txtname.Value = usr.Name;
                                txtemail.Value = usr.email;
                                txtpassword.Value = usr.password;
                                txtuserid.Value = usr.userName;
                                txtcompanyname.Value = company.company_name;
                                txtContactNO.Value = company.company_contact_no;
                                txtAddress.Value = company.company_location;
                                Image1.ImageUrl = company.company_logo_url;
                                Image2.ImageUrl= company.compnay_facebook;

                                //if (usr.role != null)
                                //  txtrole.Value = usr.role.ToString();

                            }
                           // btnUpdate.Visible = true;
                            //btnAdd.Visible = false;


                        }
                    }

                }

                getList();
            }
            catch { }
        }
        public void getList()
        {
           // usrloginlist = context.user_login.Where(c => c.active == true).ToList();
        }
   


        public void clear()
        {
            txtemail.Value = "";
            txtname.Value = "";
            txtpassword.Value = "";
            txtuserid.Value = "";


        }


        public string uploadFile()
        {
            string ret = "";
            try
            {
                if (FileUpload1.HasFile)
                {
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    string newName = "CompanyLogo" + datename + extension;

                   

                    FileUpload1.SaveAs(@"C:\Live\Extuent\Admin\Upload\CompanyLogo\" + newName);
                    ret = newName;
                }

            }
            catch { }
            return ret;
        }
        public string uploadProfileFile()
        {
            string ret = "";
            try
            {
                if (FileUpload2.HasFile)
                {
                    string extension = Path.GetExtension(FileUpload2.PostedFile.FileName);
                    string newName = "CompanyUserLogo" + datename + extension;

                    FileUpload2.SaveAs(@"C:\Live\Extuent\Admin\Upload\CompanyUserLogo\" + newName);
                    ret = newName;
                }

            }
            catch { }
            return ret;
        }
        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Session["user-recid"]);
                if (txtname.Value == "")
                {
                    
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Name must be filled out')", true);
                    return;
                }
                if (txtuserid.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('User Id must be filled out')", true);
                    return;
                }
                if (txtemail.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Email Id must be filled out')", true);
                    return;
                }
                if (txtpassword.Value == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Passowrd  must be filled out')", true);
                    return;
                }

                if (FileUpload1.HasFile)
                {


                    string[] validFileTypes1 = { "png", "jpg", "jpeg" };

                    string ext1 = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);

                    bool isValidFile1 = false;

                    for (int i = 0; i < validFileTypes1.Length; i++)
                    {

                        if (ext1 == "." + validFileTypes1[i])
                        {

                            isValidFile1 = true;

                            break;

                        }

                    }
                    if (!isValidFile1)
                    {

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please upload logo in png,jpg and jpeg format only)", true);
                        return;

                    }
                }

                if (FileUpload2.HasFile)
                {


                    string[] validFileTypes2 = { "png", "jpg", "jpeg" };

                    string ext2 = System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName);

                    bool isValidFile2 = false;

                    for (int i = 0; i < validFileTypes2.Length; i++)
                    {

                        if (ext2 == "." + validFileTypes2[i])
                        {

                            isValidFile2 = true;

                            break;

                        }

                    }
                    if (!isValidFile2)
                    {

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Please upload user profile picture in png,jpg and jpeg format only)", true);
                        return;

                    }
                }
                usr = context.user_login.Where(c => c.id == ReqId).FirstOrDefault();
                if (usr != null)
                {
                    company = context.employer_login.Where(c => c.rec_id == usr.company_recid).FirstOrDefault();
                    if (company != null)
                    {
                        usr.Name = txtname.Value;
                        usr.userName = txtuserid.Value;
                        usr.email = txtemail.Value;
                        usr.password = txtpassword.Value;

                        company.login_id = txtuserid.Value;
                        company.password= txtpassword.Value;
                        company.company_name = txtcompanyname.Value;
                        company.company_contact_no = txtContactNO.Value;
                        company.company_location = txtAddress.Value;
                        if(FileUpload1.HasFile)
                             company.company_logo_url = "/admin/Upload/CompanyLogo/" + uploadFile();
                        if (FileUpload2.HasFile)
                            company.compnay_facebook = "/admin/Upload/CompanyUserLogo/" + uploadProfileFile();

                        //usr.role = Convert.ToInt32(ddlRole.SelectedValue);
                        //if (rdoemail.Checked == true)
                        //    usr.is_emai_required = 1;
                        //else
                        //    usr.is_emai_required = 0;

                        usr.active = true;

                        context.SaveChanges();

                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Updated!', 'Edits to Company Profile Updated Successfully.');", true);
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Updated')", true);

                        Image1.ImageUrl = company.company_logo_url;
                        Image2.ImageUrl = company.compnay_facebook;

                        Session["logoUrl"] = company.company_logo_url;
                         Session["ProfileUrl"]=company.compnay_facebook;

                        // getList();

                        // clear();

                        
                    }
                    // btnUpdate.Visible = false;
                    //  btnAdd.Visible = true;

                    //Response.Redirect("User-Profile", false);
                }
            }
            catch (Exception ex) { }
        }
    }
}