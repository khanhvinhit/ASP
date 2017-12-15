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
    int pageNumber = 0;
    int pageSize = 3;
    int totalpage = 0;   
    protected void Page_Load(object sender, EventArgs e)
    {        
        if(!IsPostBack)
        {
            DoPage();
            loadData();
        }
    }
    
    public void loadData( )
    {
        int id = Convert.ToInt32(Request["id"]);
        rpNameCategory.DataSource = tblCategory.NameCategory(id);
        rpNameCategory.DataBind();
        int page = Convert.ToInt32(Request["page"]);
        rpDetail.DataSource = tblProduct.Detail(id).Skip((page-1)*pageSize).Take(pageSize);
        rpDetail.DataBind();
    }
    public void DoPage()
    {
        int id = Convert.ToInt32(Request["id"]);
        int total = tblProduct.Detail(id).Count();
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
        rpPage.DataSource = lsPage;
        rpPage.DataBind();
    }

    protected void rpPage_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        int page = Convert.ToInt32(Request["page"]);
        if (e.Item.ItemIndex < 0) return;
        HyperLink hlPage = (HyperLink)e.Item.FindControl("hlPage");
        if (hlPage != null)
        {
            hlPage.Text = (e.Item.ItemIndex + 1).ToString();
            int.TryParse("" + Request["page"], out pageNumber);
            if (e.Item.ItemIndex + 1 == pageNumber)
            {
                hlPage.CssClass = "alert alert-warning disabled";
                
            }
            if(page == 1)
            {
                hlPagePre.CssClass = "disabled";
            }
            else
            {
                hlPagePre.NavigateUrl = "../Product/Detail.aspx?id=" + id + "&page=" + (page-1);
            }
            if (page == totalpage)
            {
                hlPageNe.CssClass = "disabled";
            }
            else
            {
                hlPageNe.NavigateUrl = "../Product/Detail.aspx?id=" + id + "&page=" + (page + 1);
            }
            hlPage.NavigateUrl = "../Product/Detail.aspx?id=" + id + "&page=" +(e.Item.ItemIndex + 1);
        }
    }
}