using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Covid
{
    public partial class PatientInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("PatientLogin.aspx");
            }

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "Abhilash";
            TableCell cell2 = new TableCell();
            cell2.Text = "202 Danda Rd Brampton";
            TableCell cell3 = new TableCell();
            cell3.Text = "May 06 1997";
            row.Cells.Add(cell1);
            row.Cells.Add(cell2);
            row.Cells.Add(cell3);
            

            lbl_name.InnerText = "Abhilash";
            lbl_address.InnerText = "202 Danda Brampton";
            ;
            lbl_dob.InnerText = "May 06 1997";
        }
    }
}