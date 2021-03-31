using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Covid.Data_Factory;
using Covid.Model;

namespace Covid
{
    public partial class PatientLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Master.FindControl("homeLinkbtn").Visible = false;
            this.Master.FindControl("logoutLinkBtn").Visible = false;
            
        }

        protected void signin(object sender, EventArgs e)
        {
            string useremail = txt_userid.Text.Trim();
            string password = txt_pwd.Text.Trim();
            var (isUserExists, userData)=  DBController.checkSignIn(useremail, password);
            if (isUserExists)
            {
                User user = new User()
                {
                    UserEmail = userData.Rows[0]["email"].ToString(), UserName = userData.Rows[0]["name"].ToString(),
                    UserID = Convert.ToInt32(userData.Rows[0]["patient_id"].ToString())
                };
                Session["User"] = user;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbl_result.Visible = true;
            }
        }
        protected void signup(object sender, EventArgs e)
        {
            Response.Redirect("PatientSignUp.aspx");
        }
    }
}