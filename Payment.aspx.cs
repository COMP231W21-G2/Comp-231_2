using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Covid
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CartItems"] != null)
            {
                Dictionary<string, double> items = (Dictionary<string, double>)Session["CartItems"];
                var amount = items.Sum(x => x.Value);
                lbl_amt.Text = "$ " + amount.ToString();
            }
        }
    }
}