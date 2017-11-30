using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class Admin_OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                PopulateControls();
            }
        }
    }

    private void PopulateControls()
    {
        string cid = Request.QueryString["cid"] ?? "";
        if (cid == null)
        {
            Response.Redirect("Default.aspx");
        }
        ListTable.Controls.Clear();
        ListTable.DataSource = tblOrderDeails.Get_All_By_OrderID(cid);
        ListTable.DataBind();
    }
}