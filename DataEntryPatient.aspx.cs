using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Covid.Data_Factory;

namespace Covid.DataEntry
{
    public partial class DataEntryPatient : System.Web.UI.Page
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
            DataTable dt = DBController.DEPatientsOperations(1,"","","","","","","Select");
            grd_patient.DataSource = dt;
            grd_patient.DataBind();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            grd_patient.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grd_patient.Rows[e.RowIndex];
            int userid = Convert.ToInt32(grd_patient.DataKeys[e.RowIndex].Values[0]);

            string name = (row.FindControl("txtPatName") as TextBox).Text;
            string address = (row.FindControl("txtPatAdd") as TextBox).Text;
            string dob = (row.FindControl("txtPatDob") as TextBox).Text;
            string phone = (row.FindControl("txtPatPh") as TextBox).Text; 
            string email = (row.FindControl("txtPatEmail") as TextBox).Text;
            string med = (row.FindControl("txtPatMed") as TextBox).Text;

            DBController.DEPatientsOperations(userid, name,phone,email,address,med,dob, "Update");
            grd_patient.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            grd_patient.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userid = Convert.ToInt32(grd_patient.DataKeys[e.RowIndex].Values[0]);
            DBController.DEPatientsOperations(userid, "", "", "", "", "", "", "Delete");

            this.BindGrid();
        }

        protected void Insert(object sender, EventArgs e)
        {
            DBController.DEPatientsOperations(0, txtAddPatName.Text, txtAddPatPhone.Text, txtAddPatEmail.Text, txtAddPatAdd.Text, txtAddPatMed.Text, txtAddPatDob.Text, "Insert");
            txtAddPatName.Text = "";
            txtAddPatPhone.Text = "";
            txtAddPatEmail.Text = "";
            txtAddPatMed.Text = "";
            txtAddPatDob.Text = "";
            txtAddPatAdd.Text = "";
            this.BindGrid();
        }
    }
}