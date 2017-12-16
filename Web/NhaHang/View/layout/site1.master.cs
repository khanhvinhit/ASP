using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layout_site1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable cart = new DataTable();
        if (Session["cart"] == null)
            {
                cart.Columns.Add("ID");
                cart.Columns.Add("Name");
                cart.Columns.Add("Price");
                cart.Columns.Add("Quantity");
                cart.Columns.Add("TotalPrice");
                Session["cart"] = cart;
            }
            else
            {
                cart = Session["cart"] as DataTable;
            }
        int i = 0;
        foreach (DataRow item in cart.Rows)
        {
            i++;
        }
        Label1.Text = i.ToString();

    }
}
