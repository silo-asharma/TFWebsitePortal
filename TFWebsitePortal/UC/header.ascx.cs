using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;

namespace Extuent.UC
{
    public partial class header : System.Web.UI.UserControl
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected user_login usr = new user_login();
      
        public List<category> categoryList = new List<category>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {



                    categoryList = context.categories.Where(c => c.active == true).ToList();



                }


            }
            catch { }
        }
    }
}