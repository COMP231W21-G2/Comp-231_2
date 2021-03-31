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
    public partial class Appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["DocId"] != null)
            {
                int docId = Convert.ToInt32(Request.QueryString["DocId"].ToString());
                BindDoctorList(docId);
                User user = (User) Session["User"];
                txt_patient_name.Text = user.UserName;
            }
        }

        protected void BindDoctorList(int docId)
        {
            DataTable dt = DBController.GetDoctorsList("");
            foreach (DataRow dr in dt.Rows)
            {
                ListItem li = new ListItem(dr["name"].ToString(), dr["doctor_id"].ToString());
                if(docId == Convert.ToInt32(dr["doctor_id"].ToString()))
                    li.Selected = true;
                ddl_doctor.Items.Add(li);
            }
            ddl_doctor.DataSource = dt;
        }
        protected void BookAppointment(object sender, EventArgs e)
        {
            DBController.InserPatientAppointment(((User) Session["User"]).UserID, Convert.ToInt32(ddl_doctor.SelectedValue),
                Convert.ToDateTime(txt_appt_date.Value),
                TimeSpan.Parse(ddl_time.SelectedValue));
        }

       
    }
}
