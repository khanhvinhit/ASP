﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Adminsite : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["typeID"].GetHashCode() != 3)
        {
            txtName.Text = Session["Name"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    
}
