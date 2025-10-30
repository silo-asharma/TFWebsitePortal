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
using Extuent.Admin;

namespace Extuent
{
    public partial class Share_Profile : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected share_link_history sharelink = new share_link_history();


        protected void Page_Load(object sender, EventArgs e)
        {
            string str = "";
            if (Request.QueryString["v"] != null)
            {
                string ReqId = Convert.ToString(Request.QueryString["v"]);
                str = Convert.ToString(admincommon.Decrypt(HttpUtility.UrlDecode(Request.QueryString["v"])));

                int RecId = Convert.ToInt32(str);

                sharelink = context.share_link_history.Where(c => c.rec_id == RecId).FirstOrDefault();

                if (sharelink != null)
                {
                    Response.Redirect(sharelink.actual_url);
                }




            }

        }
    }
}