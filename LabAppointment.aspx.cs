using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Covid.Data_Factory;
using Covid.Model;

namespace Covid
{
    public partial class LabAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_lab_appt_result.Visible = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["LabTestId"] != null)
                {
                    int labTestId = Convert.ToInt32(Request.QueryString["LabTestId"].ToString());
                    BindLabTestList(labTestId);
                    User user = (User) Session["User"];
                    txt_patient_name.Text = user.UserName;
                }
            }
        }

        protected void BindLabTestList(int labtestId)
        {
            DataTable dt = DBController.GetAllLabTests();
            foreach (DataRow dr in dt.Rows)
            {
                ListItem li = new ListItem(dr["test_name"].ToString(), dr["id"].ToString());
                if (labtestId == Convert.ToInt32(dr["id"].ToString()))
                    li.Selected = true;
                ddl_labTest.Items.Add(li);
            }
            ddl_labTest.DataSource = dt;
        }
        protected void BookAppointment(object sender, EventArgs e)
        {
            DBController.InsertLabAppointments(((User)Session["User"]).UserID, Convert.ToInt32(ddl_labTest.SelectedValue),
                Convert.ToDateTime(txt_appt_date.Value),
                TimeSpan.Parse(ddl_time.SelectedValue),
                ""
                );

            lbl_lab_appt_result.Visible = true;
            lbl_lab_appt_result.Text = "Appointment has been booked successfully";
        }
    }
}