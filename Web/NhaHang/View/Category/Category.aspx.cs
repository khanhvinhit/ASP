﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
public partial class View_Category_Category : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            All();
        }
    }
    public void All()
    {
        SelectAll.DataSource = tblCategory.All();
        SelectAll.DataBind();
    }
}