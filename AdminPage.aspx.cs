using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Covid.Data_Factory;

namespace Covid
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            DataTable dt = DBController.AdminUsersOperations(1, "", "", "",  "", "", "Select");
            grd_users.DataSource = dt;
            grd_users.DataBind();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            grd_users.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grd_users.Rows[e.RowIndex];
            int userid = Convert.ToInt32(grd_users.DataKeys[e.RowIndex].Values[0]);

            string name = (row.FindControl("txtUserName") as TextBox).Text;
            string address = (row.FindControl("txtUserAdd") as TextBox).Text;
            string dob = (row.FindControl("txtUserDob") as TextBox).Text;
            string phone = (row.FindControl("txtUserPh") as TextBox).Text;
            string email = (row.FindControl("txtUserEmail") as TextBox).Text;

            DBController.AdminUsersOperations(userid, name, phone, email, address, dob, "Update");
            grd_users.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            grd_users.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userid = Convert.ToInt32(grd_users.DataKeys[e.RowIndex].Values[0]);
            DBController.DEPatientsOperations(userid, "", "", "", "", "", "", "Delete");

            this.BindGrid();
        }

        protected void ShowNonVerifiedUsers(object sender, EventArgs e)
        {
            Response.Redirect("AdminVerfiyUsers.aspx");
        }

    }
}