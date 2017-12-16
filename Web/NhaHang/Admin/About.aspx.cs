using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class Admin_About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null && (Session["typeID"].GetHashCode() != 1 || Session["typeID"].GetHashCode() != 2))
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
        ListTable.Controls.Clear();
        ListTable.DataSource = tblAbout.All();
        ListTable.DataBind();
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
            foreach (string id in stringid.Split(',')) tblAbout.Delete(id); PopulateControls();

        }
    }
}