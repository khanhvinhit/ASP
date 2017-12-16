using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null|Convert.ToInt32( Session["typeID"]) == 3)
        {
            Response.Redirect("Login.aspx");
        }
    }
}