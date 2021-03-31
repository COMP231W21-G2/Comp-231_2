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
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("PatientLogin.aspx");
            }
            if (!Page.IsPostBack)
            {
                GetUserDetails();
            }

            lbl_Result.Visible = false;
        }

        public void GetUserDetails()
        {

            DataTable dt =  DBController.GetUserDetails(((User)Session["User"]).UserID);
            if (dt != null & dt.Rows.Count > 0)
            {
                txt_Name.Text = dt.Rows[0]["name"].ToString();
                text_address.Text = dt.Rows[0]["address"].ToString();
                txt_phone.Text = dt.Rows[0]["phone_no"].ToString();
                txt_email.Text = dt.Rows[0]["email"].ToString();
                txt_med_his.Text = dt.Rows[0]["med_history"].ToString();
                txt_dob.Value = dt.Rows[0]["dob"].ToString();
            }
        }

        protected void btn_update_account_OnClick(object sender, EventArgs e)
        {
            string userName = txt_Name.Text;
            string phone = txt_phone.Text;
            string address = text_address.Text;
            string dob = txt_dob.Value;
            string medical = txt_med_his.Text;
            DBController.UpdateUserDetails(((User)Session["User"]).UserID, userName, phone, address,dob,medical);

            lbl_Result.Visible = true;
            lbl_Result.Text = "Account has been successfully updated!";
        }
    }
}