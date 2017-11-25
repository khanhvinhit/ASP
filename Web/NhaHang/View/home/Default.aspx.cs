using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
public partial class View_home_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateControls();
        }
    }
    private void PopulateControls()
    {
        //Những món ăn được chọn nhiều
        TopHot.DataSource = tblProduct.TopHot();
        TopHot.DataBind();
        //món ăn mới cập nhập
        NewCreate.DataSource = tblProduct.NewFood();
        NewCreate.DataBind();
    }
    protected void btnDatMon_Click(object sender, EventArgs e)
    {

    }
}