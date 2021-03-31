using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Covid.Data_Factory;
using Covid.Model;

namespace Covid
{
    public partial class PatientSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            this.Master.FindControl("logoutLinkBtn").Visible = false;
            this.Master.FindControl("homeLinkbtn").Visible = false;
            
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void SubmitPatientSignUp(object sender, EventArgs e)
        {
            
            int PatientId = DBController.InsertPatient(txt_patient_name.Text.ToString(), txt_pwd.Text.ToString(),
                txt_address.Text.ToString(),
                Request.Form["dob"].ToString(), 
                txt_email.Text.ToString());
            
            User user = new User()
            {
                UserEmail = txt_email.Text.ToString(),
                UserName = txt_patient_name.Text,
                UserID = PatientId
            };
            Session["User"] = user;
            Response.Redirect("Home.aspx");
        }
    }
}