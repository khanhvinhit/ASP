using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_Order_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable cart = new DataTable();
            if (Session["cart"] == null)
            {
                cart.Columns.Add("ID");
                cart.Columns.Add("Name");
                cart.Columns.Add("Price");
                cart.Columns.Add("Quantity");
                cart.Columns.Add("TotalPrice");
                Session["cart"] = cart;
            }
            else
            {
                cart = Session["cart"] as DataTable;
            }
            if (!String.IsNullOrEmpty(Request.QueryString["action"]))
            {
                if (Request.QueryString["action"] == "add")
                {
                    string id = Request.QueryString["id"];
                    tblProduct pro = tblProduct.Single(id);
                    string name = pro.Name;
                    string price = pro.Price.ToString();
                    bool isExisted = false;
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["ID"].ToString() == id)
                        {
                            if (dr["Quantity"].GetHashCode() > 10)
                            {
                                dr["Quantity"] = 10;
                                dr["TotalPrice"] = (decimal.Parse(dr["Quantity"].ToString()) *
                                                   decimal.Parse(dr["Price"].ToString()));
                                isExisted = true;
                            }
                            else
                            {
                                dr["Quantity"] = int.Parse(dr["Quantity"].ToString()) + 1;
                                dr["TotalPrice"] = (decimal.Parse(dr["Quantity"].ToString()) *
                                                   decimal.Parse(dr["Price"].ToString()));
                                isExisted = true;
                                break;
                            }

                        }
                    }
                    if (!isExisted)
                    {
                        DataRow dr = cart.NewRow();
                        dr["ID"] = id;
                        dr["Name"] = name;
                        dr["Price"] = price;
                        dr["Quantity"] = 1;
                        dr["TotalPrice"] = price;
                        cart.Rows.Add(dr);
                    }
                    Session["cart"] = cart;
                    Response.Redirect(Request.UrlReferrer.AbsoluteUri);
                }
            }
        }
    }
}