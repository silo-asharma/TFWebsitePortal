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
    public partial class branding : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
        protected user_type usrtype = new user_type();
        protected category cty = new category();
        public List<user_login> usrloginlist = new List<user_login>();
        public List<user_type> usrtypelist = new List<user_type>();
        public employer_login company = new employer_login();
        string datename = DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
        public employer_branding emloyerbranding = new employer_branding();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int ReqId = Convert.ToInt32(Session["user-recid"]);
                

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
                emloyerbranding = new employer_branding();



                emloyerbranding.company_name = txtcompanyName.Value;
                emloyerbranding.employer_rec_id = ReqId;
                emloyerbranding.createdby = ReqId;
                emloyerbranding.logo_placement = ddlPlanName.SelectedItem.Text;
                if (FileUpload1.HasFile)
                    emloyerbranding.background_image_url = "/admin/Upload/CompanyFiles/" + uploadFile();
                if (FileUpload2.HasFile)
                    emloyerbranding.logo_image_url = "/admin/Upload/CompanyFiles/" + uploadProfileFile();
                emloyerbranding.active = 1;
                emloyerbranding.doc = DateTime.Now;

                context.employer_branding.Add(emloyerbranding);
                context.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('Uploaded!', 'Thank You for submitting the background change request. Our team will activate the new video background and logo within the next 72 hrs.');", true);



                
            }
            catch (Exception ex) { }
        }
        public void clear()
        {
            //txtemail.Value = "";
            //txtname.Value = "";
            //txtpassword.Value = "";
            //txtuserid.Value = "";


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



                    FileUpload1.SaveAs(@"C:\Live\Extuent\Admin\Upload\CompanyFiles\" + newName);
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
                    string newName = "CompanyNcakgroundLogo" + datename + extension;

                    FileUpload2.SaveAs(@"C:\Live\Extuent\Admin\Upload\CompanyFiles\" + newName);
                    ret = newName;
                }

            }
            catch { }
            return ret;
        }
    }
}