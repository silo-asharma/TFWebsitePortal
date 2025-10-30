using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exportimportbidcp.app.UC
{
    public partial class foot : System.Web.UI.UserControl
    {
        public string pageNameFooter = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            pageNameFooter = CultureInfo.CurrentCulture.TextInfo.ToTitleCase((Path.GetFileName(Request.Path)));
            if (pageNameFooter == "Add-Job")
                pageNameFooter = "dashbaord";
            else 
                pageNameFooter = "#";
          
        }
    }
}