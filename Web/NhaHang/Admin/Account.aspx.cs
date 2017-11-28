using System;
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
}