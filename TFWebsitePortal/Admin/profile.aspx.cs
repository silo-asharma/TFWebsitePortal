using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eibServiceModel;
namespace exportimportbidcp.app
{
    public partial class profile : System.Web.UI.Page
    {
        db_a45c8e_expimpdEntities context = new db_a45c8e_expimpdEntities();
        client_main customer = new client_main();
        client_login customerlogin = new client_login();
        planmaster planame = new planmaster();
        public int LoginID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["aboutnew"] != null)
            {
                string v1 = Request.QueryString["aboutnew"].ToString();
                string v2 = Request.QueryString["phonenew"].ToString();
                string v3 = Request.QueryString["emailnew"].ToString();
                string v4 = Request.QueryString["addressnew"].ToString();
                // Button1_Click(sender, e);

                insertReset(v1, v2,v3,v4);

            }

            if (Request.QueryString["type"]!=null)
            {
                edit.Visible = true;
                display.Visible = false;
            }
            else
            {

                edit.Visible = false;
                display.Visible = true;
            }

            if (Session["CustomerLoginId"] != null)
            {
                int LoginID = Convert.ToInt32(Session["CustomerLoginId"]);
                 
                customer = context.client_main.Where(c => c.ClientID == LoginID).FirstOrDefault();
                if (customer != null)
                {
                    divname.InnerText = customer.Name;
                    txtabout.Value = customer.Name;
                    lblmobile.Value = customer.CustomerPhone;
                    lblemail.Value = customer.CustomEmail;
                    lbladdress.Value = customer.address;

                    divabout.InnerText = customer.Name;
                    divmobile.InnerText = customer.CustomerPhone;
                    divemail.InnerText = customer.CustomEmail;
                    divaddress.InnerText = customer.address;

                    planame = context.planmasters.Where(c => c.PlanId == customer.plan_id).FirstOrDefault();
                    if (planame != null)
                    {
                        divplanname.InnerText = planame.PlanName;
                      
                    }
                }

            }


        }
        protected void insertReset(string vabout, string vphone, string vemail,string vaddress)
        {
            if (Session["cudtrecid"] != null)
            {
                LoginID = Convert.ToInt32(Session["cudtrecid"]);
                //string pass = TextBox1.Text;//oldpasword.Value.Trim();

                customer = context.client_main.Where(c => c.ClientID == LoginID && c.Active == true).FirstOrDefault();
                if (customer != null)
                {
                    customer.Name = vabout;
                    customer.CustomerPhone = vphone;
                    customer.CustomEmail = vemail;
                    customer.address = vaddress;
                    customer.modified_at = DateTime.Now;

                    context.SaveChanges();



                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Key", "alert('Profile successfully updated!....');", true);
                    return;



                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Key", "alert('Profile have some issue Please contact to support team!....');", true);
                    return;
                }
            }
        }
    }
}