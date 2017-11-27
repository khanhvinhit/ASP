using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        Logout();
    }
    protected void Logout()
    {
        Session["email"] = null;
        Session["type"] = null;
        Session["name"] = null;
        Session["avatar"] = null;
        Response.Redirect("Login.aspx");
        Response.Redirect("Login.aspx");
    }
}