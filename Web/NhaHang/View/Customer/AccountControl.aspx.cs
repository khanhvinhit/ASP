using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
public partial class View_Customer_AccountControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["idCus"] != null)
        {
            CusAcc(Session["idCus"].ToString());
        }
        OrderHistory(Convert.ToInt32(Session["idCus"]));
    }
    public void CusAcc(string id)
    {
        List<tblAccount> ac = null;
        ac = new List<tblAccount>();
        ac.Add(tblAccount.Single(id));
        rpCusAcc.DataSource =ac;
        rpCusAcc.DataBind();
    }
    public void OrderHistory(int id)
    {
        rpOrderHistory.DataSource = tblOrder.OrderByAccId(id);
        rpOrderHistory.DataBind();
    }
}