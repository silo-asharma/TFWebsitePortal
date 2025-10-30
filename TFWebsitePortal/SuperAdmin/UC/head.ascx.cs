
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

namespace Extuent.SuperAdmin.UC
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
            if (pageName == "dashboard")
                pageName = "Dashboard";
            else if (pageName == "Company-Details")
                pageName = "Company Details";
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