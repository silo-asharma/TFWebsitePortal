
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exportimportbidcp.Dashboard.UC
{
    public partial class head : System.Web.UI.UserControl
    {
        public string pageName = "";
        public string URLDisplay = System.Configuration.ConfigurationManager.AppSettings["URL"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
           // getDetails();
            if (Session["user"] == null)
            {
                Response.Redirect("~/login", false);
            }
            pageName = CultureInfo.CurrentCulture.TextInfo.ToTitleCase((Path.GetFileName(Request.Path)));
            if (pageName == "Candidate-Interview-List")
                pageName = "Interviews";
            else if (pageName == "Add-Job")
                pageName = "Create Jobs";
            else if (pageName == "Add-Question")
                pageName = "Question Library";
            else if (pageName == "Add-Evaluation")
                pageName = "Evaluation Library";
            else if (pageName == "Add-Skills")
                pageName = "Skills Library";
            else if (pageName == "Add-Category")
                pageName = "Category Library";
            else if (pageName == "User-Profile")
                pageName = "Company Profile";
            else if (pageName == "Email-Setting")
                pageName = "Email Notification";
            else if (pageName == "User-Setting")
                pageName = "Manage Users";
            else if (pageName == "Search-Report")
                pageName = "Reports";
            else if (pageName == "Candidate-Profile")
                pageName = "Candidate Profile";
            else if(pageName == "Email-Send" && Session["EmailHead"].ToString()== "Share Job")
                pageName = "Share Job";
            else if (pageName == "Email-Send" && Session["EmailHead"].ToString() == "Share Profile")
                pageName = "Share Profile";
            else if (pageName == "Faq")
                pageName = "Frequently Asked Questions";
            else if (pageName == "branding")
                pageName = "Branding";

            HiddenField2.Value = "1";
        }
        public void getDetails()
        {
         
        }
        [System.Web.Script.Services.ScriptMethod()]

        [System.Web.Services.WebMethod]
        public static List<string> GetListofProduct(string prefixText)
        {
            ////ExticelCountryData objData = new ExticelCountryData();
            ////ExticelCountryBAL objBAL = new ExticelCountryBAL();
            List<string> ProductNames = new List<string>();
            //DAL.DAL obj = new DAL.DAL();
            //DataSet Ds = obj.GetProduct(prefixText);
            //for (int i = 0; i < Ds.Tables[0].Rows.Count; i++)
            //{
            //    ProductNames.Add(Ds.Tables[0].Rows[i]["PName"].ToString());
            //}
            return ProductNames;
        }
    }
}