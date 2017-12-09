using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using System.Collections;

public partial class View_Product_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        if(!IsPostBack)
        {
            loadData(6);
        }
    }
    public int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] != null)
            {
                return Convert.ToInt32(ViewState["CurrentPage"]);
            }
            else
            {
                return 0;
            }
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }
    public void loadData(int pageSize)
    {
        int id = Convert.ToInt32(Request["id"]);
        rpNameCategory.DataSource = tblCategory.NameCategory(id);
        rpNameCategory.DataBind();
        rpDetail.DataSource = tblProduct.Detail(id);
        rpDetail.DataBind();
    }

}