﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class Admin_Account : System.Web.UI.Page
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
<<<<<<< HEAD
        //Những món ăn được chọn nhiều
        //ListTable.DataSource = tblAccount.Get_All_Accounts();
        //ListTable.DataBind();
=======
        ListTable.Controls.Clear();
        ListTable.DataSource = tblAccount.Get_All_Accounts();
        ListTable.DataBind();
>>>>>>> 8858471dc3ea0ee01698071c7e8142f97cec7b89
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        btnDelete.Click += new EventHandler(btnDelete_Click);
    }

    void btnDelete_Click(object sender, EventArgs e)
    {
        string stringid = Request.Form["cid"] ?? "";
        if (stringid != "")
        {
            foreach (string id in stringid.Split(',')) tblAccount.Delete(id); PopulateControls();

        }
    }
}