using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erpServiceModel;
namespace Extuent.SuperAdmin
{
    public partial class ExportToExcel : System.Web.UI.Page
    {
        db_a45c8e_VIPortalEntities context = new db_a45c8e_VIPortalEntities();
        protected job_post Jpost = new job_post();
        protected void Page_Load(object sender, EventArgs e)
        {
            ExportCSV();
        }
        private void ExportCSV()
        {
            DataTable dt;
            int rec;
            if (Session["Type"] == "Reportl1")
            {
                dt = (DataTable)Session["SaleReport"];
            }
            else if (Session["Type"] == "Report2")
            {
                dt = (DataTable)Session["SaleReportByAgent"];
            }
            else
            {
                dt = (DataTable)Session["Report"];
            }
            Session["Type"] = null;
            StringBuilder sb = new StringBuilder();

            foreach (DataColumn col in dt.Columns)
            {
                sb.Append(col.ColumnName + ",");
            }

            sb.Remove(sb.Length - 1, 1);
            sb.Append(Environment.NewLine);

            foreach (DataRow row in dt.Rows)
            {
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i == 4)
                    {
                        if (row[i] != null)
                        {
                            rec = Convert.ToInt32(row[i]);
                            Jpost = context.job_post.Where(c => c.rec_id == rec).FirstOrDefault();
                            if (Jpost != null)
                                sb.Append(Jpost.job_title + ",");
                        }
                        else
                            sb.Append(row[i].ToString() + ",");
                    }
                    else
                        sb.Append(row[i].ToString() + ",");
                }

                sb.Append(Environment.NewLine);
            }

            Response.ClearHeaders();
            Response.AppendHeader("Content-Disposition", "attachment; filename=Export.csv");
            Response.AppendHeader("Content-Length", sb.Length.ToString());
            Response.ContentType = "text/csv";
            Response.Write(sb.ToString());
            Response.End();

        }

    }
}