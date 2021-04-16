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
    public partial class Pharmacy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("PatientLogin.aspx");
            }
            if (!IsPostBack)
            {
                BindMedicines();
            }
        }

        protected void BindMedicines()
        {
            DataTable dt = DBController.GetAllMedicines();
            foreach (DataRow row in dt.Rows)
            {
                ListItem li = new ListItem( "    "+ row["product_name"].ToString() + "  ($" + row["product_price"].ToString() + ")" , row["product_price"].ToString());

                medicineChkList.Items.Add(li);

            }
        }
        protected void btn_buy_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void btn_addtocart_OnClick(object sender, EventArgs e)
        {
            Dictionary<string, double> cartItems = new Dictionary<string, double>();
            foreach (ListItem listItem in medicineChkList.Items)
            {
                if (listItem.Selected)
                {
                    cartItems.Add(listItem.Text,Convert.ToDouble(listItem.Value));
                    //do some work 
                }
            }

            Session["CartItems"] = cartItems;
        }

        protected void btn_labreport_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("LabReports.aspx");
        }
    }
}