using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
public partial class View_Category_Category : System.Web.UI.Page
{
    int pageNumber = 0;
    int pageSize =2;
    int totalpage = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DoPage();
            All();
        }
    }
    public void All()
    {
        int page = Convert.ToInt32(Request["page"]);
        SelectAll.DataSource = tblCategory.All().Skip((page - 1) * pageSize).Take(pageSize);
        SelectAll.DataBind();
    }
    public void DoPage()
    {
        int id = Convert.ToInt32(Request["id"]);
        int total = tblCategory.All().Count();
        if (total % pageSize == 0)
        {
            totalpage = total / pageSize;
        }
        else
        {
            totalpage = (total / pageSize) + 1;
        }
        List<int> lsPage = new List<int>();
        for (int i = 0; i < totalpage; i++)
        {
            lsPage.Add(i);
        }
        rpPage1.DataSource = lsPage;
        rpPage1.DataBind();
    }
    protected void rpPage_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        int page = Convert.ToInt32(Request["page"]);
        if (e.Item.ItemIndex < 0) return;
        HyperLink hlPage = (HyperLink)e.Item.FindControl("hlPage1");
        if (hlPage != null)
        {
            hlPage.Text = (e.Item.ItemIndex + 1).ToString();
            int.TryParse("" + Request["page"], out pageNumber);
            if (e.Item.ItemIndex + 1 == pageNumber)
            {
                hlPage.CssClass = "alert alert-warning disabled";
            }
            if (page == 1|page==0)
            {
                hlPagePre.CssClass = "disabled";
            }
            else
            {
                hlPagePre.NavigateUrl = "../Category/Category.aspx?page=" + (page - 1);
            }
            if (page == totalpage)
            {
                hlPageNe.CssClass = "disabled";
            }
            else
            {
                hlPageNe.NavigateUrl = "../Category/Category.aspx?page=" + (page + 1);
            }
            hlPage.NavigateUrl = "../Category/Category.aspx?page=" + (e.Item.ItemIndex + 1);
        }
    }
}